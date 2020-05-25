//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit MonitorServerContainer;

interface

uses
  SysUtils, Classes,
  DSTCPServerTransport,
  DSHTTPCommon, DSHTTP,
  DSServer, DSCommonServer, DSAuth,
  Generics.Collections, IPPeerServer, IndyPeerImpl;

type
  TCMServerContainer = class(TDataModule)
    CMServer: TDSServer;
    CMServerTransport: TDSTCPServerTransport;
    CMServerClass: TDSServerClass;
    CMAuthManager: TDSAuthenticationManager;
    CMHTTPService: TDSHTTPService;
    procedure CMServerClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure CMAuthManagerUserAuthorize(Sender: TObject;
      AuthorizeEventObject: TDSAuthorizeEventObject; var valid: Boolean);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    //Number of minutes to monitor at any given time for thrashing.
    FThrashingWindow: Integer;
    //Maximum number of requests to allow within the thrashing window for a single session
    FMaxRequestsInWindow: Integer;
    //SessionId - Date of the first request within the past 5 minutes
    FHitTimes: TObjectDictionary<String,TDateTime>;
    //SessionId - Number of requests happened within the thrashing window
    FHitCounts: TObjectDictionary<String,Integer>;
  public
    //This will clear the cahced info for the session, resetting the hit time and count.
    procedure SessionClosed(SessionId: String);

    property ThrashingWindow: Integer read FThrashingWindow write FThrashingWindow;
    property MaxRequestsInWindow: Integer read FMaxRequestsInWindow write FMaxRequestsInWindow;
  end;

var
  CMServerContainer: TCMServerContainer;

implementation

uses Windows, MonitorServerMethods, Dialogs, DSSession, MonitorServerUI;

{$R *.dfm}

function elapsedSeconds(StartTime, LaterTime : TDateTime) : Integer;
var
  Aux: TDateTime;
  TimeStamp : TTimeStamp;
begin
  //make sure that the value of 'StartTime' is always the smallest of the two.
  if StartTime > LaterTime then
  begin
    Aux := StartTime;
    StartTime := LaterTime;
    LaterTime := Aux;
  end;

  //Computes the elapsed seconds between two dates.
  TimeStamp := DateTimeToTimeStamp(LaterTime - StartTime);
  Dec(TimeStamp.Date, TTimeStamp(DateTimeToTimeStamp(0)).Date);

  Result := (TimeStamp.Time div 1000) + (TimeStamp.Date * 24 * 60 * 60);
end;

procedure TCMServerContainer.CMAuthManagerUserAuthorize(Sender: TObject;
                                                      AuthorizeEventObject: TDSAuthorizeEventObject;
                                                      var valid: Boolean);
var
  Session: TDSSession;
  StartTime: TDateTime;
  elapsedSecs: Integer;
  elapsedMinutes: Integer;
  HitCount: Integer;
begin
  //Set valid to true by default. Will only be set to false if disconnecting the user
  valid := True;

  //Get the Session for the client making the invocation attempt
  Session := TDSSessionManager.Instance.GetThreadSession;

  if Session <> nil then
  begin
    //If this isn't the user's first request of the session, then check if they are
    //abusing the server by making calls too often.
    if FHitTimes.ContainsKey(Session.SessionName) then
    begin
      if FHitTimes.TryGetValue(Session.SessionName, StartTime) then
      begin
        //compute elapsed time since the first call within the 'thrashing window'.
        //The window is an amount of time where the number of requests to the server are counted
        //and if the maximum allowed request limit is exceeded within that time period, then the
        //client is disconnected. Otherwise, the counts get set back to the beginning and
        //the window starts over.
        elapsedSecs := elapsedSeconds(StartTime, Now);
        if elapsedSecs > 0 then
          elapsedMinutes := Trunc(elapsedSecs / 60)
        else
          elapsedMinutes := 0;

        //If the window has expired, then reset the session's hit information
        if elapsedMinutes >= FThrashingWindow then
        begin
          FHitTimes.AddOrSetValue(Session.SessionName, Now);
          FHitCounts.AddOrSetValue(Session.SessionName, 1);
        end
        //otherwise, increment the hit count by one and check for thrashing
        else if FHitCounts.TryGetValue(Session.SessionName, HitCount) then
        begin
          Inc(HitCount);

          //if the number of invocations exceeds the maximum allowed in the time period, disconnect
          // the client and set valid to false for this call.
          if (HitCount > FMaxRequestsInWindow)  then
          begin
            valid := False;
            CMServerForm.ForceConnectionClose(Session.SessionName);
          end
          //Otherwise, simply increment the hit count for this session.
          else
          begin
            FHitCounts.AddOrSetValue(Session.SessionName, HitCount);
          end;
        end;
      end;
    end
    //Otherwise, if this is the first request of the session, then set
    //the cached session values appropriatly.
    else
    begin
      FHitTimes.AddOrSetValue(Session.SessionName, Now);
      FHitCounts.AddOrSetValue(Session.SessionName, 1);
    end;
  end;
end;

procedure TCMServerContainer.CMServerClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := MonitorServerMethods.TServerConnMonitorMethods;
end;

procedure TCMServerContainer.SessionClosed(SessionId: String);
begin
  FHitTimes.Remove(SessionId);
  FHitCounts.Remove(SessionId);
end;

procedure TCMServerContainer.DataModuleCreate(Sender: TObject);
begin
  FThrashingWindow := 1;
  FMaxRequestsInWindow := 65;

  FHitTimes := TObjectDictionary<String,TDateTime>.Create;
  FHitCounts := TObjectDictionary<String,Integer>.Create;
end;

procedure TCMServerContainer.DataModuleDestroy(Sender: TObject);
begin
  CMServerForm.PrepareForGracefulClose;
end;

end.

