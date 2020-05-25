//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit TestComponent;

interface

uses
  Classes, SysUtils, Variants, ExtCtrls, Forms,
  FireDAC.Stan.Intf, FireDAC.Stan.Factory,
  FireDAC.Phys.Intf,
  FireDAC.VCLUI.Wait;

type
  TTestComp = class(TComponent, IFDStanObject, IFDMoniAdapter)
  private
    FTimer: TTimer;
    FActive: Boolean;
    FHandle: LongWord;
    procedure DoTimer(Sender: TObject);
    function GetPaused: Boolean;
    procedure SetPaused(AValue: Boolean);
  protected
    { IFDStanObject }
    function GetName: TComponentName;
    function GetParent: IFDStanObject;
    procedure BeforeReuse;
    procedure AfterReuse;
    procedure SetOwner(const AOwner: TObject; const ARole: TComponentName);
    { IFDMoniAdapter }
    function GetHandle: LongWord;
    function GetItemCount: Integer;
    function GetSupportItems: TFDMoniAdapterItemKinds;
    procedure GetItem(AIndex: Integer; out AName: String; out AValue: Variant;
      out AKind: TFDMoniAdapterItemKind);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Activate;
    property Paused: Boolean read GetPaused write SetPaused;
    property Handle: LongWord read GetHandle;
    property ItemCount: Integer read GetItemCount;
    property SupportItems: TFDMoniAdapterItemKinds read GetSupportItems;

  end;

function MonitorClient: IFDMoniClient;

implementation

var
  FMonitorClient: IFDMoniClient;

function MonitorClient: IFDMoniClient;
var
  oRemClnt: IFDMoniRemoteClient;
begin
  if FMonitorClient = nil then begin
    FDCreateInterface(IFDMoniRemoteClient, oRemClnt);
    FMonitorClient := oRemClnt as IFDMoniClient;
    FMonitorClient.Tracing := True;
  end;
  Result := FMonitorClient;
end;

constructor TTestComp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTimer := TTimer.Create(nil);
  FTimer.Enabled := False;
  FTimer.Interval := 1000;
  FTimer.OnTimer := DoTimer;
end;

destructor TTestComp.Destroy;
begin
  if not (csDesigning in ComponentState) and FActive then
    MonitorClient.UnregisterAdapter(Self);
  FTimer.Free;
  inherited Destroy;
end;

procedure TTestComp.Activate;
begin
  if not (csDesigning in ComponentState) then begin
    FHandle := MonitorClient.RegisterAdapter(Self);
    FActive := True;
    FTimer.Enabled := True;
  end;
end;

procedure TTestComp.DoTimer(Sender: TObject);
begin
  MonitorClient.Notify(ekConnService, esProgress, Self,
    'Testing '{ + DateToStr(Now)}, [1, 'abdf']);
  MonitorClient.AdapterChanged(Self);
end;

function TTestComp.GetPaused: Boolean;
begin
  Result := not FTimer.Enabled;
end;

function TTestComp.GetSupportItems: TFDMoniAdapterItemKinds;
begin
  Result := [ikSQL, ikParam, ikStat];
end;

procedure TTestComp.SetPaused(AValue: Boolean);
begin
  FTimer.Enabled := not AValue;
end;

// ----------------------------------------------------------------------------
// IFDStanObject

function TTestComp.GetName: TComponentName;
begin
  if Name = '' then
    Result := '$' + IntToHex(Integer(Self), 8)
  else
    Result := Name;
end;

function TTestComp.GetParent: IFDStanObject;
begin
  Result := nil;
end;

procedure TTestComp.AfterReuse;
begin
  // nothing
end;

procedure TTestComp.BeforeReuse;
begin
  // nothing
end;

procedure TTestComp.SetOwner(const AOwner: TObject; const ARole: TComponentName);
begin
  // nothing
end;

// ----------------------------------------------------------------------------
// IFDMoniAdapter

function TTestComp.GetHandle: LongWord;
begin
  Result := FHandle;
end;

function TTestComp.GetItemCount: Integer;
begin
  Result := 10;
end;

procedure TTestComp.GetItem(AIndex: Integer; out AName: String; out AValue: Variant;
  out AKind: TFDMoniAdapterItemKind);
begin
  case AIndex of
  7:
    begin
      AName := 'SQL';
      AValue := 'SELECT * FROM QWE';
      AKind := ikSQL;
    end;
  8:
    begin
      AName := 'Param1';
      AValue := Null;
      AKind := ikParam;
    end;
  9:
    begin
      AName := 'Param2';
      AValue := DateTimeToStr(Now());
      AKind := ikParam;
    end;
  else
    AName := IntToStr(AIndex);
    AValue := AIndex * 10;
    AKind := ikStat;
  end;
end;

initialization

finalization

  FMonitorClient := nil;

end.
