
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fDatSLayerBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, ExtCtrls, ComCtrls,
  fMainBase;

type
  TfrmDatSLayerBase = class(TfrmMainBase)
    pnlControlButtons: TPanel;
    Console: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDatSLayerBase: TfrmDatSLayerBase;

implementation

{$R *.dfm}

end.
