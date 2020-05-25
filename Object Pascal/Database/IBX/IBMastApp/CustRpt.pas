//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit CustRpt;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TCustomerByInvoiceReport = class(TQuickRep)
    DetailBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    procedure QRDBText1Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  CustomerByInvoiceReport: TCustomerByInvoiceReport;

implementation

{$R *.dfm}

uses DataMod;

procedure TCustomerByInvoiceReport.QRDBText1Print(sender: TObject;
          var Value: String);
begin
  with MastData do
    Value := DateToStr( CustByLastInvQueryLastInvoiceDate.Value );
end;

end.

