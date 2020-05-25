//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fLoginDemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, DB, ExtCtrls, Buttons, ComCtrls,
  fMainCompBase,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Def,
  FireDAC.VCLUI.Login, FireDAC.VCLUI.Wait,
  FireDAC.Phys.Intf,
  FireDAC.Comp.Client;

type
  TForm1 = class(TfrmMainCompBase)
    btnConnect: TButton;
    btnDisconnect: TButton;
    chLoginPrompt:            TCheckBox;
    Label3:                   TLabel;
    Bevel1:                   TBevel;
    chChangePassword:         TCheckBox;
    chHistory:                TCheckBox;
    edLoginRetries:           TLabeledEdit;
    udLoginRetries:           TUpDown;
    mmVisibleItems:           TMemo;
    Label1:                   TLabel;
    chHistoryWithPassword:    TCheckBox;
    Memo1:                    TMemo;
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
  private
    procedure UpdateLoginDialog;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  dmMainComp;

{$R *.dfm}

procedure TForm1.UpdateLoginDialog;
begin
  with dmlMainComp do begin
    dbMain.LoginPrompt := chLoginPrompt.Checked;
    with FDGUIxLoginDialog1 do begin
      ChangeExpiredPassword := chChangePassword.Checked;
      HistoryEnabled := chHistory.Checked;
      HistoryWithPassword := chHistoryWithPassword.Checked;
      LoginRetries := udLoginRetries.Position;
      VisibleItems.Assign(mmVisibleItems.Lines);
    end;
  end;
end;

procedure TForm1.btnConnectClick(Sender: TObject);
begin
  UpdateLoginDialog;
  dmlMainComp.dbMain.Connected := True;
end;

procedure TForm1.btnDisconnectClick(Sender: TObject);
begin
  dmlMainComp.dbMain.Connected := False;
end;

procedure TForm1.cbDBClick(Sender: TObject);
begin
  UpdateLoginDialog;
  inherited cbDBClick(Sender);
end;

end.
