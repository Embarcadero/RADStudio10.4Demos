
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fCalculatedColumnsFuncs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ExtCtrls, Menus,
  fDatSLayerBase,
  FireDAC.DatS, FireDAC.Stan.Intf, ComCtrls;

type
  TfrmCalculatedColumnsFuncs = class(TfrmDatSLayerBase)
    edtExpr: TLabeledEdit;
    edtStr: TLabeledEdit;
    rgDataType: TRadioGroup;
    pmnFunc: TPopupMenu;
    UPPERstr1: TMenuItem;
    LOWERstr1: TMenuItem;
    SUBSTRINGstrstartlen1: TMenuItem;
    RIMstr1: TMenuItem;
    RIMLEFTstr1: TMenuItem;
    RIMRIGHTstr1: TMenuItem;
    YEARdateexp1: TMenuItem;
    MONTHdateexp1: TMenuItem;
    DAYdateexp1: TMenuItem;
    HOURdatetimeexp1: TMenuItem;
    MINUTEdatetimeexp1: TMenuItem;
    SECONDdatetimeexp1: TMenuItem;
    GETDATE1: TMenuItem;
    DATE1: TMenuItem;
    IME1: TMenuItem;
    ABS1: TMenuItem;
    CEIL1: TMenuItem;
    COS1: TMenuItem;
    COSH1: TMenuItem;
    EXP1: TMenuItem;
    FLOOR1: TMenuItem;
    LN1: TMenuItem;
    LOG1: TMenuItem;
    MOD1: TMenuItem;
    POWER1: TMenuItem;
    ROUND1: TMenuItem;
    SIGN1: TMenuItem;
    SIN1: TMenuItem;
    SINH1: TMenuItem;
    SQRT1: TMenuItem;
    AN1: TMenuItem;
    ANH1: TMenuItem;
    RUNC1: TMenuItem;
    CHR1: TMenuItem;
    CONCATstr1str21: TMenuItem;
    INITCAPstr1: TMenuItem;
    LPADstrpadlenpadstring1: TMenuItem;
    LTRIMstr1: TMenuItem;
    REPLACEstrstrtoreplreplstr1: TMenuItem;
    RPADstrpadlenpadstr1: TMenuItem;
    RTRIMstr1: TMenuItem;
    SOUNDEXstr1: TMenuItem;
    SUBSTRstrstartlen1: TMenuItem;
    RANSLATEstrstrtoreplreplstr1: TMenuItem;
    ASCIIsinglecharacter1: TMenuItem;
    INSTRstr1str2startnthapp1: TMenuItem;
    LENGTH1: TMenuItem;
    MONTHSBETWEEN1: TMenuItem;
    LASTDAY1: TMenuItem;
    FIRSTDAY1: TMenuItem;
    NEXTDAY1: TMenuItem;
    SYSDATE1: TMenuItem;
    OCHAR1: TMenuItem;
    ODATE1: TMenuItem;
    ONUMBER1: TMenuItem;
    DECODE1: TMenuItem;
    IIF1: TMenuItem;
    IF1: TMenuItem;
    NVL1: TMenuItem;
    GREATEST1: TMenuItem;
    LEAST1: TMenuItem;
    CHAR1: TMenuItem;
    CHARLENGTH1: TMenuItem;
    CHARACTERLENGTH1: TMenuItem;
    DIFFERENCE1: TMenuItem;
    INSERT1: TMenuItem;
    LCASE1: TMenuItem;
    LEFT1: TMenuItem;
    LOCATE1: TMenuItem;
    OCTETLENGTH1: TMenuItem;
    POSITIONstr1str21: TMenuItem;
    REPEATstrcount1: TMenuItem;
    RIGHTstrlength1: TMenuItem;
    SPACEintexp1: TMenuItem;
    UCASEstr1: TMenuItem;
    ACOS1: TMenuItem;
    ASIN1: TMenuItem;
    ATAN1: TMenuItem;
    ATAN21: TMenuItem;
    CEILING1: TMenuItem;
    COT1: TMenuItem;
    DEGREES1: TMenuItem;
    LOG101: TMenuItem;
    LOG102: TMenuItem;
    RADIANS1: TMenuItem;
    RAND1: TMenuItem;
    RUNCATE1: TMenuItem;
    CURRENTDATE1: TMenuItem;
    CURRENTTIME1: TMenuItem;
    CURRENTTIMESTAMP1: TMenuItem;
    CURDATE1: TMenuItem;
    CURTIME1: TMenuItem;
    DAYNAMEdateexp1: TMenuItem;
    DAYOFMONTHdateexp1: TMenuItem;
    DAYOFWEEKdateexp1: TMenuItem;
    DAYOFYEARdateexp1: TMenuItem;
    EXTRACTextractintervdateexp1: TMenuItem;
    MONTHNAMEdateexp1: TMenuItem;
    MONTHNAMEdateexp2: TMenuItem;
    QUARTERdateexp1: TMenuItem;
    IMESTAMPADD1: TMenuItem;
    IMESTAMPDIFF1: TMenuItem;
    WEEKdateexp1: TMenuItem;
    CONVERTvalueexpdatatype1: TMenuItem;
    Numeric1: TMenuItem;
    Character1: TMenuItem;
    Dateandtime1: TMenuItem;
    System1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure edtExprKeyPress(Sender: TObject; var Key: Char);
    procedure MenuItemClick(Sender: TObject);
  private
    { Private declarations }
    FDatSManager: TFDDatSManager;
    FTab: TFDDatSTable;
  public
    { Public declarations }
  end;

var
  frmCalculatedColumnsFuncs: TfrmCalculatedColumnsFuncs;

implementation

{$R *.dfm}

uses
  // registers extended functions at expression evaluator
  FireDAC.Stan.ExprFuncs;

procedure TfrmCalculatedColumnsFuncs.FormCreate(Sender: TObject);
begin
  FDatSManager := TFDDatSManager.Create;
  FTab := FDatSManager.Tables.Add('CALC');
  // define FTab structure
  // Calculated columns
  FTab.Columns.Add('CALANSISTR', dtAnsiString).Size := 50;
  FTab.Columns.Add('CALWIDESTR', dtWideString).Size := 20;
  FTab.Columns.Add('CALDATETIME', dtDateTime);
  FTab.Columns.Add('CALINT', dtInt16);
  FTab.Columns.Add('CALDOUBLE', dtDouble);
end;

procedure TfrmCalculatedColumnsFuncs.edtExprKeyPress(Sender: TObject; var Key: Char);
var
  oCol: TFDDatSColumn;
begin
  if Key = #13 then begin
    oCol := nil;
    case rgDataType.ItemIndex of
    0: oCol := FTab.Columns.ColumnByName('CALANSISTR');
    1: oCol := FTab.Columns.ColumnByName('CALWIDESTR');
    2: oCol := FTab.Columns.ColumnByName('CALDATETIME');
    3: oCol := FTab.Columns.ColumnByName('CALINT');
    4: oCol := FTab.Columns.ColumnByName('CALDOUBLE');
    end;

    if oCol = nil then
      Exit;
    oCol.Expression := edtExpr.Text;
    try
      FTab.Rows.Clear;
      FTab.Rows.Add([]);
    except
      oCol.Expression := '';
      raise;
    end;

    edtStr.Text := VarToStr(FTab.Rows[0].GetData(oCol));
  end
end;

procedure TfrmCalculatedColumnsFuncs.MenuItemClick(Sender: TObject);    // this is the common method of all menuitem OnClickEvent
var
  p: Integer;
  s: String;
  c: Char;
begin
  s := TMenuItem(Sender).Caption;
  rgDataType.ItemIndex := TMenuItem(Sender).Tag;
  p := Pos('&', s);
  if p > 0 then
    Delete(s, p, 1);
  edtExpr.Text := s;
  c := #13;
  edtExprKeyPress(Sender, c);
end;

end.
