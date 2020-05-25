//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit MonitorServerUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  DSTCPServerTransport,
  IdTCPConnection, IndyPeerImpl, IPPeerServer, IPPeerClient,
  Generics.Collections, Menus, ExtCtrls;

type
  TCMServerForm = class(TForm)
    Label1: TLabel;
    ConnectionsList: TListBox;
    SessionIdList: TListBox;
    Label2: TLabel;
    useKeepAliveCheck: TCheckBox;
    KAIdleLabel: TLabel;
    KAIdleMS: TEdit;
    KeepAlivePopup: TPopupMenu;
    EnableKAItem: TMenuItem;
    DisableKAItem: TMenuItem;
    Label3: TLabel;
    thrashCountEdit: TEdit;
    Label4: TLabel;
    maxRequestsEdit: TEdit;
    thrashUpdate: TButton;
    Bevel1: TBevel;
    N1: TMenuItem;
    closeConnItem: TMenuItem;
    Label6: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure ConnectionsListClick(Sender: TObject);
    procedure SessionIdListClick(Sender: TObject);
    procedure ButtCloseSelectedClick(Sender: TObject);
    procedure useKeepAliveCheckClick(Sender: TObject);
    procedure EnableKAItemClick(Sender: TObject);
    procedure DisableKAItemClick(Sender: TObject);
    procedure ConnectionsListContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure updateUpdateButton;
    procedure thrashUpdateClick(Sender: TObject);
    procedure thrashCountEditChange(Sender: TObject);
    procedure maxRequestsEditChange(Sender: TObject);
    procedure closeConnItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FConnections: TObjectDictionary<TIdTCPConnection,TDSTCPChannel>;
    procedure CMServerTransportConnectEvent(Event: TDSTCPConnectEventObject);
    procedure CMServerTransportDisconnectEvent(Event: TDSTCPDisconnectEventObject);
    procedure AddConnectionToList(Conn: TIdTCPConnection; Channel: TDSTCPChannel);
    procedure AddSessionListener;
    procedure AddOrRemoveSession(SessionId: String; IsAdd: Boolean);
    function GetConnectionWithSessionId(SessionId: String): TIdTCPConnection;
    function GetSessionIdConnectionIndex(SessionId: String): Integer;
    function GetSelectedConnection: TIdTCPConnection;
    function GetSelectedChannel(Conn: TIdTCPConnection = nil): TDSTCPChannel;
  public
    /// <summary>Closes the TCP connection corresponding to the session with the given Id.</summary>
    procedure ForceConnectionClose(SessionId: String);

    procedure PrepareForGracefulClose;
  end;

var
  CMServerForm: TCMServerForm;

implementation

uses MonitorServerContainer, DSSession, Winapi.Winsock;

{$R *.dfm}

{ TCMServerForm }

Function GetIPAddress:String;
type
  pu_long = ^u_long;
var
  varTWSAData: TWSAData;
  varPHostEnt: PHostEnt;
  varTInAddr: TInAddr;
  namebuf: Array[0..255] of AnsiChar;
begin
  if WSAStartup($101, varTWSAData) <> 0 then
    Result := '127.0.0.1'
  else
  begin
    gethostname(namebuf, sizeof(namebuf));
    varPHostEnt := gethostbyname(namebuf);
    varTInAddr.S_addr := u_long(pu_long(varPHostEnt^.h_addr_list^)^);
    Result := '' + inet_ntoa(varTInAddr);
  end;
  WSACleanup;
end;

procedure TCMServerForm.ForceConnectionClose(SessionId: String);
var
  ConnIndex: Integer;
  Obj: TObject;
  Channel: TDSTCPChannel;
begin
  //Find the connection with the given SessionId, and then get its
  //Index in the visual list (stored as an Object)
  ConnIndex := GetSessionIdConnectionIndex(SessionId);

  if ConnIndex > -1 then
  begin
    //Get the connection Object from the list box
    Obj := ConnectionsList.Items.Objects[ConnIndex];
    if Obj <> nil then
    begin
      //Get the connection's channel, and then call close on it.
      //Closing the channel will result in the 'CMServerTransportDisconnectEvent'
      //event being notified, and it will in turn remove the connection/channel from the list.
      Channel := GetSelectedChannel(TIdTCPConnection(Obj));
      if Channel <> nil then
        Channel.Close;
    end;
  end;
end;

procedure TCMServerForm.FormActivate(Sender: TObject);
begin
  useKeepAliveCheck.Hint := 'This will only be applied to new connections,'#13#10'not already established connections.';

  thrashUpdateClick(nil);

  FConnections := TObjectDictionary<TIdTCPConnection,TDSTCPChannel>.Create;

  //Register an event to be notified when TCP connections are created
  CMServerContainer.CMServerTransport.OnConnect := CMServerTransportConnectEvent;

  //Register an event to be notified when TCP connections are closed.
  CMServerContainer.CMServerTransport.OnDisconnect := CMServerTransportDisconnectEvent;

  //Add a listener to be notified when sessions are established or are ended.
  //this is used to update the list box with session IDs in it.
  AddSessionListener;
end;

procedure TCMServerForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FConnections);

end;

procedure TCMServerForm.FormCreate(Sender: TObject);
begin
  Caption := Caption + ' - ' + GetIPAddress;
end;

function TCMServerForm.GetSelectedChannel(Conn: TIdTCPConnection): TDSTCPChannel;
begin
  Result := nil;

  //Finds the selected connection
  if Conn = nil then
    Conn := GetSelectedConnection;

  //uses the selected connection to look up the associated channel.
  if Conn <> nil then
    FConnections.TryGetValue(Conn, Result)
end;

function TCMServerForm.GetSelectedConnection: TIdTCPConnection;
var
  I, Count, Index: Integer;
  Obj: TObject;
begin
  Result := nil;
  Index := -1;
  Count := ConnectionsList.Count;

  //Find the selected row in the list box
  if Count > 0 then
  begin
    for I := 0 to Count - 1 do
    begin
      if ConnectionsList.Selected[I] then
      begin
        Index := I;
        break;
      end;
    end;

    //Get the stored object for the selected row, if any.
    if Index > -1 then
    begin
      Obj := ConnectionsList.Items.Objects[Index];
      if Obj <> nil then
        Exit(TIdTCPConnection(Obj));
    end;
  end;
end;

function TCMServerForm.GetConnectionWithSessionId(SessionId: String): TIdTCPConnection;
var
  PairEnum: TObjectDictionary<TIdTCPConnection, TDSTCPChannel>.TPairEnumerator;
  Conn: TIdTCPConnection;
  Channel: TDSTCPChannel;
begin
  Result := nil;

  if FConnections = nil then
    Exit;

  System.TMonitor.Enter(FConnections);
  try
    PairEnum := FConnections.GetEnumerator;

    //Iterate over each connection looking for the connection that has a matching channel
    //with the specified SessionId.
    while PairEnum.MoveNext do
    begin
      Conn := PairEnum.Current.Key;
      Channel := PairEnum.Current.Value;

      //check the connection's channel's session Id.
      if (Channel <> nil) and (Channel.SessionId <> EmptyStr) then
      begin
        if Channel.SessionId = SessionId then
        begin
          Exit(Conn);
        end;
      end;
    end;
  finally
    System.TMonitor.Exit(FConnections);
  end;
end;

function TCMServerForm.GetSessionIdConnectionIndex(SessionId: String): Integer;
var
  Conn: TIdTCPConnection;
begin
  Result := -1;

  //Get the connection whose channel has the given session Id
  Conn := GetConnectionWithSessionId(SessionId);

  //Return the list box index of the connection.
  if Conn <> nil then
    Exit(ConnectionsList.Items.IndexOfObject(Conn));
end;

procedure TCMServerForm.CMServerTransportConnectEvent(Event: TDSTCPConnectEventObject);
begin
  if FConnections = nil then
    Exit;

  //This is called when a TCP conneciton is established. The connection and its corresponding
  //channel are added to the FConnections dictionary (the connection as the key) and then the
  //Connection list box is updated.
  System.TMonitor.Enter(FConnections);
  try
    FConnections.Add(TIdTCPConnection(Event.Connection), Event.Channel);
  finally
    System.TMonitor.Exit(FConnections);
  end;

  //Update the connection list to include the new connection and its channel.
  AddConnectionToList(TIdTCPConnection(Event.Connection), Event.Channel);

  //If keep-alive is in use, then enable Keep-alive for this new connection.
  if useKeepAliveCheck.Checked and (KAIdleMS.Text <> EmptyStr)then
    Event.Channel.EnableKeepAlive(StrToInt(KAIdleMS.Text));
end;

procedure TCMServerForm.CMServerTransportDisconnectEvent(Event: TDSTCPDisconnectEventObject);
var
  Index: Integer;
begin
  if (FConnections = nil) or (Event.Connection = nil) then
    Exit;

  //This is called when a TCP connection is closed, for whatever reason.
  System.TMonitor.Enter(FConnections);
  try
    FConnections.Remove(TIdTCPConnection(Event.Connection));

    TThread.Synchronize(nil, procedure
      begin
        //update the connection list box, removing the connection that was just closed
        Index := ConnectionsList.Items.IndexOfObject(Event.Connection);
        if Index > -1 then
        begin
          ConnectionsList.Items.Delete(Index);

          if ConnectionsList.SelCount = 0 then
            SessionIdList.ClearSelection;
        end;
      end);
  finally
    System.TMonitor.Exit(FConnections);
  end;
end;

procedure TCMServerForm.ConnectionsListClick(Sender: TObject);
var
  Index: Integer;
  Channel: TDSTCPChannel;
  SessionId: String;
begin
  //Keeps the selection of the two list boxes in sync.
  //There is the possibility that the session ID for a specific connection will not be on the same
  //line (index) in the session ID list as the connection is in the connection list. So this code
  //finds the appropriate index in the corresponding list and selects it.
  Channel := GetSelectedChannel;

  //clear the selected Session Id before continuing
  SessionIdList.ClearSelection;

  if Channel <> nil then
  begin
    SessionId := Channel.SessionId;

    if SessionId <> EmptyStr then
    begin
      Index := SessionIdList.Items.IndexOf(SessionId);
      if Index > -1 then
        SessionIdList.Selected[Index] := True;
    end;
  end;
end;

procedure TCMServerForm.ConnectionsListContextPopup(Sender: TObject; MousePos: TPoint;
                                                    var Handled: Boolean);
begin
  //Only show the popup menu if there is a selected connection
  Handled := GetSelectedConnection = nil;
end;

procedure TCMServerForm.DisableKAItemClick(Sender: TObject);
var
  Channel: TDSTCPChannel;
begin
  //Disable keep-alive for the selected channel, if one is selected.
  Channel := GetSelectedChannel;

  if (Channel <> nil) then
    Channel.DisableKeepAlive;
end;

procedure TCMServerForm.EnableKAItemClick(Sender: TObject);
var
  Channel: TDSTCPChannel;
begin
  //Enable keep-alive for the selected channel, if one is selected.
  Channel := GetSelectedChannel;

  if (Channel <> nil) and (KAIdleMS.Text <> EmptyStr) then
    Channel.EnableKeepAlive(StrToInt(KAIdleMS.Text));
end;

procedure TCMServerForm.SessionIdListClick(Sender: TObject);
var
  I, Count, Index: Integer;
  SessionId: String;
begin
  //Keeps the selection of the two list boxes in sync.
  //There is the possibility that the session ID for a specific connection will not be on the same
  //line (index) in the session ID list as the connection is in the connection list. So this code
  //finds the appropriate index in the corresponding list and selects it.

  Index := -1;
  Count := SessionIdList.Count;

  //Clear the selection on the connection list
  ConnectionsList.ClearSelection;

  if Count > 0 then
  begin
    for I := 0 to Count - 1 do
    begin
      //Find the selected Session Id
      if SessionIdList.Selected[I] then
      begin
        Index := I;
        break;
      end;
    end;

    //Use the selected Session Id to find the appropriate connection, and then select it.
    if Index > -1 then
    begin
      SessionId := SessionIdList.Items.Strings[Index];
      if SessionId <> EmptyStr then
      begin
        Index := GetSessionIdConnectionIndex(SessionId);
        if Index > -1 then
          ConnectionsList.Selected[Index] := True;
      end;
    end;
  end;
end;

procedure TCMServerForm.updateUpdateButton;
begin
  //enable or disable the update button, based on the values held in the text fields.
  //Only enabling the update button if the fields contain valid values and the values are different
  //than the ones already in use by the authentication manager.
  if (thrashCountEdit.Text <> EmptyStr) and (maxRequestsEdit.Text <> EmptyStr) then
  begin
    thrashUpdate.Enabled := (CMServerContainer.ThrashingWindow <> StrToInt(thrashCountEdit.Text)) or
                            (CMServerContainer.MaxRequestsInWindow <> StrToInt(maxRequestsEdit.Text));
  end
  else
  begin
    thrashUpdate.Enabled := False;
  end;
end;

procedure TCMServerForm.thrashCountEditChange(Sender: TObject);
begin
  updateUpdateButton;
end;

procedure TCMServerForm.maxRequestsEditChange(Sender: TObject);
begin
  updateUpdateButton;
end;

procedure TCMServerForm.PrepareForGracefulClose;
begin
  FreeAndNil(FConnections);
end;

procedure TCMServerForm.thrashUpdateClick(Sender: TObject);
begin
  //set the values in the text fields to the appropriate values used by the authentication manager
  if (thrashCountEdit.Text <> EmptyStr) and (maxRequestsEdit.Text <> EmptyStr) then
  begin
    CMServerContainer.ThrashingWindow := StrToInt(thrashCountEdit.Text);
    CMServerContainer.MaxRequestsInWindow := StrToInt(maxRequestsEdit.Text);
  end;
end;

procedure TCMServerForm.AddSessionListener;
begin
  //Add a session listener, which will be notified when a session is created or closed.
  TDSSessionManager.Instance.AddSessionEvent(
    procedure(Sender: TObject;
              const EventType: TDSSessionEventType;
              const Session: TDSSession)
    begin
      //the application is in an invalid or terminating state, so ignore the event.
      if FConnections = nil then
        Exit;

      //If a session has been closed, update the Authentication Manager, to free it's
      //Session related information.
      if (EventType = SessionClose) and (Session <> nil) then
        CMServerContainer.SessionClosed(Session.SessionName);

      //update the session Id list box
      AddOrRemoveSession(Session.SessionName, EventType = SessionCreate);
    end);
end;

procedure TCMServerForm.ButtCloseSelectedClick(Sender: TObject);
var
  Channel: TDSTCPChannel;
begin
  //Find the selected connection's channel, and then close it.
  Channel := GetSelectedChannel;

  //after calling close, the CMServerTransportDisconnectEvent event will be notified.
  if Channel <> nil then
  begin
    Channel.Close;
  end;
end;

procedure TCMServerForm.closeConnItemClick(Sender: TObject);
begin
  ButtCloseSelectedClick(nil);
end;

procedure TCMServerForm.AddOrRemoveSession(SessionId: string; IsAdd: Boolean);
var
  Index: Integer;
begin
  if FConnections = nil then
    Exit;

  if IsAdd then
  begin
    if SessionIdList.Items.IndexOf(SessionId) < 0 then
      SessionIdList.Items.Add(SessionId);
  end
  else
  begin
    Index := SessionIdList.Items.IndexOf(SessionId);
    if Index > -1 then
      SessionIdList.Items.Delete(Index);
  end;
end;

procedure TCMServerForm.AddConnectionToList(Conn: TIdTCPConnection; Channel: TDSTCPChannel);
var
  InfoStr: String;
begin
  //If the given Connection and Channel are valid, then a string representation is made,
  //and this, along with the connection object itself, is stored in the connect list box.
  if (Conn <> nil) and (Channel <> nil) and (Channel.ChannelInfo <> nil) and
     (Channel.ChannelInfo.ClientInfo.IpAddress <> EmptyStr) then
  begin
    with Channel.ChannelInfo.ClientInfo do
    begin
      InfoStr := Format('%s:%s', [IpAddress, ClientPort]);
    end;
    ConnectionsList.Items.AddObject(InfoStr, Conn);
  end
  else
    ConnectionsList.Items.AddObject('Channel is missing proper ClientInfo.', Conn);
end;

procedure TCMServerForm.useKeepAliveCheckClick(Sender: TObject);
begin
  KAIdleLabel.Enabled := useKeepAliveCheck.Checked;
  KAIdleMS.Enabled := useKeepAliveCheck.Checked;
end;

end.
