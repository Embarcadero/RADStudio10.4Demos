
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit Splash;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, DBTables;

type
  TSplashForm = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    Image1: TImage;
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.dfm}

end.
