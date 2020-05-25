//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fEscapeFunctions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Menus, StdCtrls, ExtCtrls, DB, ComCtrls,
  fMainLayers,
  FireDAC.DatS, FireDAC.Stan.Intf, 
  FireDAC.Phys.Intf;

type
  TfrmEscapeFunctions = class(TfrmMainLayers)
    edtFunctions: TLabeledEdit;
    edtResult: TLabeledEdit;
    pmnFunc: TPopupMenu;
    edtSQLstr: TLabeledEdit;
    ABS351: TMenuItem;
    ACOS051: TMenuItem;
    ASCIIA1: TMenuItem;
    ASIN051: TMenuItem;
    ATAN051: TMenuItem;
    BITLENGTHabcde1: TMenuItem;
    CEILING281: TMenuItem;
    CHAR451: TMenuItem;
    CHARLENGTHabc1: TMenuItem;
    CONCATabcde1: TMenuItem;
    COS21: TMenuItem;
    DAYNAMEd200301011: TMenuItem;
    DAYOFMONTHd200301011: TMenuItem;
    DAYOFWEEKd200401011: TMenuItem;
    DAYOFYEARd200302011: TMenuItem;
    DEGREESfnPI1: TMenuItem;
    DECODE231241: TMenuItem;
    DIFFERENCEapplestrees1: TMenuItem;
    EXP21: TMenuItem;
    EXTRACTyeard200301011: TMenuItem;
    EXTRACTmonthd200301011: TMenuItem;
    EXTRACTdayd200301021: TMenuItem;
    FLOOR281: TMenuItem;
    HOURt1120051: TMenuItem;
    IF12341: TMenuItem;
    IF12342: TMenuItem;
    IFNULLNULLorange1: TMenuItem;
    INSERTappletree15orange1: TMenuItem;
    LCASEAbCde1: TMenuItem;
    LEFTAbCde31: TMenuItem;
    LENGTHabc1: TMenuItem;
    LOCATEgaggregate41: TMenuItem;
    LOG101001: TMenuItem;
    LTRIMabcde1: TMenuItem;
    MINUTEt1120051: TMenuItem;
    MOD641: TMenuItem;
    MONTHd200310011: TMenuItem;
    MONTHNAMEd200301011: TMenuItem;
    LOG451: TMenuItem;
    OCTETLENGTHabcde1: TMenuItem;
    PI1: TMenuItem;
    POSITIONagreedisagree1: TMenuItem;
    POWER251: TMenuItem;
    QUARTERd200301021: TMenuItem;
    RADIANS1801: TMenuItem;
    REPEATbla31: TMenuItem;
    REPLACE222abcd231: TMenuItem;
    RIGHTAbCde31: TMenuItem;
    ROUND1511: TMenuItem;
    RTRIMabcde1: TMenuItem;
    SECONDt1120051: TMenuItem;
    SIGN51: TMenuItem;
    SIN31: TMenuItem;
    SOUNDEXapples1: TMenuItem;
    SPACE41: TMenuItem;
    SQRT91: TMenuItem;
    SUBSTRINGAbcde231: TMenuItem;
    AN81: TMenuItem;
    IMESTAMPADDday1d200301021: TMenuItem;
    IMESTAMPADDweek1d200301021: TMenuItem;
    IMESTAMPADDmonth1d200301021: TMenuItem;
    IMESTAMPADDyear1d200301021: TMenuItem;
    IMESTAMPDIFFdayd20030101d200301021: TMenuItem;
    IMESTAMPDIFFweekd20030102d200301091: TMenuItem;
    IMESTAMPDIFFmonthd20030102d200302021: TMenuItem;
    IMESTAMPDIFFyeard20030102d200501021: TMenuItem;
    RUNCATE12241: TMenuItem;
    UCASEabcde1: TMenuItem;
    WEEKd200301021: TMenuItem;
    YEARd200310011: TMenuItem;
    N1: TMenuItem;
    C1: TMenuItem;
    D1: TMenuItem;
    S1: TMenuItem;
    procedure edtFunctionsKeyPress(Sender: TObject; var Key: Char);
    procedure MenuItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
  private
    { Private declarations }
    FTab: TFDDatSTable;
    FCommIntf: IFDPhysCommand;
  public
    { Public declarations }
  end;

var
  frmEscapeFunctions: TfrmEscapeFunctions;

implementation

{$R *.dfm}

procedure TfrmEscapeFunctions.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  FTab := TFDDatSTable.Create;
end;

procedure TfrmEscapeFunctions.cbDBClick(Sender: TObject);
begin
  inherited cbDBClick(Sender);
  edtFunctions.Enabled := True;
  edtResult.Enabled := True;
  edtSQLstr.Enabled := True;

  FConnIntf.CreateCommand(FCommIntf);
end;

procedure TfrmEscapeFunctions.edtFunctionsKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    edtSQLstr.Clear;
    // We put escape function to {fn ...} brackets
    edtSQLstr.Text := Format('select distinct {fn %s} from {id test_free}', [edtFunctions.Text]);

    FCommIntf.Prepare(edtSQLstr.Text);
    FCommIntf.Define(FTab);
    FCommIntf.Open;
    FCommIntf.Fetch(FTab);

    edtResult.Text := FTab.Rows[0].GetData(0);
  end
end;

procedure TfrmEscapeFunctions.MenuItemClick(Sender: TObject);    // this is the common method of all menuitem OnClickEvent
var
  p: Integer;
  s: String;
  c: Char;
begin
  s := TMenuItem(Sender).Caption;
  p := Pos('&', s);
  if p > 0 then
    Delete(s, p, 1);
  edtFunctions.Text := s;
  c := #13;
  edtFunctionsKeyPress(nil, c);
end;

end.
