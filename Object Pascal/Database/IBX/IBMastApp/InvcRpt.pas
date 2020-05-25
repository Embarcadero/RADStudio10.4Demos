//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit InvcRpt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TInvoiceByOrderNoReport = class(TQuickRep)
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    Description: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText2: TQRDBText;
    QRExpr3: TQRExpr;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRExpr5: TQRExpr;
    QRDBText15: TQRDBText;
    procedure InvoiceByOrderNoReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  InvoiceByOrderNoReport: TInvoiceByOrderNoReport;

implementation

uses DataMod;

{$R *.dfm}

procedure TInvoiceByOrderNoReport.InvoiceByOrderNoReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  Sender.AllDataSets.Add(MastData.Cust);
  Sender.AllDataSets.Add(MastData.Orders);
end;

end.
