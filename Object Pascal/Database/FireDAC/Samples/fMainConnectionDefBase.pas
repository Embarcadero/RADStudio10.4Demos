
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fMainConnectionDefBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
    Grids, DBGrids, DB, StdCtrls, ComCtrls, ExtCtrls, Buttons, 
  fMainBase,
  FireDAC.Stan.Option, FireDAC.Stan.Intf,
  FireDAC.Phys.Intf;

type
  TfrmMainConnectionDefBase = class(TfrmMainBase)
    lblUseConnectionDef: TLabel;
    pnlConnection: TPanel;
    cbDB: TComboBox;
    procedure cbDBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure GetConnectionDefs(AList: TStrings); virtual; abstract;
    procedure SetConnDefName(AConnDefName: String); virtual; abstract;
    procedure ConnectionActive(AValue: Boolean); virtual; abstract;
    function GetFormatOptions: TFDFormatOptions; virtual; abstract;
    function GetRDBMSKind: TFDRDBMSKind; virtual; abstract;
  public
    { Public declarations }
  end;

var
  frmMainConnectionDefBase: TfrmMainConnectionDefBase;

implementation

{$R *.dfm}

{ ---------------------------------------------------------------------------- }
procedure TfrmMainConnectionDefBase.FormCreate(Sender: TObject);
begin
  GetConnectionDefs(cbDB.Items);
end;

{ ---------------------------------------------------------------------------- }
procedure TfrmMainConnectionDefBase.cbDBClick(Sender: TObject);
begin
  cbDB.DroppedDown := False;
  ConnectionActive(False);
  SetConnDefName(cbDB.Text);
  ConnectionActive(True);
  case GetRDBMSKind of
  TFDRDBMSKinds.MSSQL,
  TFDRDBMSKinds.MSAccess,
  TFDRDBMSKinds.SQLAnywhere:
    with GetFormatOptions do begin
      OwnMapRules := True;
      MapRules.Clear;
      with MapRules.Add do begin
        SourceDataType := dtWideString;
        TargetDataType := dtAnsiString;
      end;
      // FormatOptions.StrsDivLen2 := False;
    end;
  TFDRDBMSKinds.Oracle:
    with GetFormatOptions do begin
      OwnMapRules := True;
      MapRules.Clear;
      MaxBcdPrecision := 0;
      with MapRules.Add do begin
        PrecMax := 10;
        PrecMin := 6;
        ScaleMax := 0;
        ScaleMin := 0;
        SourceDataType := dtFmtBCD;
        TargetDataType := dtInt32;
      end;
      with MapRules.Add do begin
        PrecMax := 5;
        PrecMin := 3;
        ScaleMax := 0;
        ScaleMin := 0;
        SourceDataType := dtFmtBCD;
        TargetDataType := dtInt16;
      end;
      with MapRules.Add do begin
        PrecMax := 38;
        PrecMin := 38;
        SourceDataType := dtFmtBCD;
        TargetDataType := dtDouble;
      end;
      with MapRules.Add do begin
        PrecMax := 2;
        PrecMin := 0;
        SourceDataType := dtFmtBCD;
        TargetDataType := dtBoolean;
      end;
      with MapRules.Add do begin
        SourceDataType := dtWideString;
        TargetDataType := dtAnsiString;
      end;
      with MapRules.Add do begin
        PrecMax := 19;
        PrecMin := 4;
        SourceDataType := dtFmtBCD;
        TargetDataType := dtCurrency;
      end;
      with MapRules.Add do begin
        SourceDataType := dtDateTime;
        TargetDataType := dtDateTimeStamp;
      end;
      // Following is required for Borland Oracle dbExp driver &
      // NVARCHAR/NVARCHAR2/NCHAR fields.
      // FormatOptions.StrsDivLen2 := True;
    end;
  TFDRDBMSKinds.MySQL:
    with GetFormatOptions do begin
      OwnMapRules := True;
      MapRules.Clear;
      with MapRules.Add do begin
        SourceDataType := dtSByte;
        TargetDataType := dtBoolean;
      end;
      with MapRules.Add do begin
        SourceDataType := dtDateTime;
        TargetDataType := dtDateTimeStamp;
      end;
      with MapRules.Add do begin
        PrecMax := 19;
        PrecMin := 4;
        SourceDataType := dtFmtBCD;
        TargetDataType := dtCurrency;
      end;
    end;
  TFDRDBMSKinds.DB2:
    with GetFormatOptions do begin
      OwnMapRules := True;
      MapRules.Clear;
      MaxBcdPrecision := 0;
      with MapRules.Add do begin
        PrecMax := 2;
        PrecMin := 0;
        SourceDataType := dtFmtBCD;
        TargetDataType := dtBoolean;
      end;
      with MapRules.Add do begin
        PrecMax := 19;
        PrecMin := 4;
        SourceDataType := dtFmtBCD;
        TargetDataType := dtCurrency;
      end;
      with MapRules.Add do begin
        SourceDataType := dtWideString;
        TargetDataType := dtAnsiString;
      end;
      with MapRules.Add do begin
        SourceDataType := dtDate;
        TargetDataType := dtDateTimeStamp;
      end;
    end;
  TFDRDBMSKinds.Interbase,
  TFDRDBMSKinds.PostgreSQL,
  TFDRDBMSKinds.SQLite:
    with GetFormatOptions do begin
      OwnMapRules := True;
      MapRules.Clear;
      MaxBcdPrecision := 0;
      with MapRules.Add do begin
        PrecMax := 19;
        PrecMin := 4;
        SourceDataType := dtFmtBCD;
        TargetDataType := dtCurrency;
      end;
      with MapRules.Add do begin
        SourceDataType := dtWideString;
        TargetDataType := dtAnsiString;
      end;
      with MapRules.Add do begin
        SourceDataType := dtDate;
        TargetDataType := dtDateTimeStamp;
      end;
      with MapRules.Add do begin
        SourceDataType := dtDateTime;
        TargetDataType := dtDateTimeStamp;
      end;
    end;
  TFDRDBMSKinds.Advantage:
    with GetFormatOptions do begin
      OwnMapRules := True;
      MapRules.Clear;
      with MapRules.Add do begin
        SourceDataType := dtDate;
        TargetDataType := dtDateTimeStamp;
      end;
    end;
  end;
end;

end.
