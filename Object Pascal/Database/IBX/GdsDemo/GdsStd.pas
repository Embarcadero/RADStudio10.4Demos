//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit GdsStd;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TGDSStdForm = class(TForm)
    GDSStdPanel: TPanel;
    GDSStdImage: TImage;
    GDSLabel: TLabel;
    GDSLabel2: TLabel;
    GDSSloganLabel: TLabel;
    GDSSloganLabel2: TLabel;
    ImageBevel: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GDSStdForm: TGDSStdForm;

implementation

{$R *.dfm}

end.
