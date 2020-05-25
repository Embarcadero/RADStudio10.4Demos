//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uAbstractControl;

interface

uses
  Forms, SysUtils, Classes, Variants, SqlExpr;

const
  MO_ExceptionMsg = 'Meeting Organizer Error: ' + #13;

type
  TAbstractControl = class(TComponent)
  private
    fTD: TTransactionDesc;
    fDBConnection: TSQLConnection;
    procedure SetTD(value: TTransactionDesc);
    function GetTD: TTransactionDesc;
    procedure SetDBConnection(value: TSQLConnection);
    function GetDBConnection: TSQLConnection;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CreateDefaultDM; virtual; abstract;
    procedure CreateDefaultForm; virtual; abstract;
    property TD: TTransactionDesc read GetTD write SetTD;
    property DBConnection: TSQLConnection read GetDBConnection
      write SetDBConnection;
    function DataFormat(Data: Variant; DataType: Char): string;
  end;

implementation

uses uMainForm;

{ TAbstractControl }

constructor TAbstractControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  DBConnection := TMainForm(Application.MainForm).DBConnection;

  fTD.GlobalID := 1;
  fTD.TransactionID := 1;
  fTD.IsolationLevel := xilREADCOMMITTED;

  CreateDefaultDM;
end;

destructor TAbstractControl.Destroy;
begin
  inherited Destroy;
end;

function TAbstractControl.GetDBConnection: TSQLConnection;
begin
  Result := fDBConnection;
end;

function TAbstractControl.GetTD: TTransactionDesc;
begin
  Result := fTD;
end;

procedure TAbstractControl.SetDBConnection(value: TSQLConnection);
begin
  fDBConnection := value;
end;

procedure TAbstractControl.SetTD(value: TTransactionDesc);
begin
  fTD := value;
end;

function TAbstractControl.DataFormat(Data: Variant; DataType: Char): string;
begin
  if VarIsEmpty(Data) then
  begin
    Result := '';
  end
  else
  begin
    if DataType = 'C' then
    begin
      Result := #39 + Data + #39;
    end
    else if DataType = 'D' then
    begin
      Result := 'CAST(' + #39 + FormatDateTime('mm/dd/yyyy', VarToDateTime(Data)
        ) + #39 + ' AS DATE)'
    end
    else if DataType = 'T' then
    begin
      Result := 'CAST(' + #39 + FormatDateTime('mm/dd/yyyy hh:nn:ss',
        VarToDateTime(Data)) + #39 + ' AS TIMESTAMP)'
    end
    else if DataType = 'N' then
    begin
      Result := StringReplace(Result, '.', '', [rfReplaceAll]);
      Result := StringReplace(Result, ',', '.', [rfReplaceAll]);
    end;
  end;
end;

end.
