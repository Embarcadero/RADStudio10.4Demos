//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program MastApp;

uses
  Vcl.Forms,
  About in 'About.pas' {AboutBox},
  BrCstOrd in 'BrCstOrd.pas' {BrCustOrdForm},
  Brparts in 'Brparts.pas' {BrPartsForm},
  DataMod in 'DataMod.pas' {MastData: TDataModule},
  Edcust in 'Edcust.pas' {EdCustForm},
  EDOrders in 'EDOrders.pas' {EdOrderForm},
  Edparts in 'Edparts.pas' {EdPartsForm},
  Main in 'Main.pas' {MainForm},
  Pickdate in 'Pickdate.pas' {BrDateForm},
  PickInvc in 'PickInvc.pas' {PickOrderNoDlg},
  Pickrep in 'Pickrep.pas' {PickRpt},
  QryCust in 'QryCust.pas' {QueryCustDlg},
  Splash in 'Splash.pas' {SplashForm},
  SrchDlg in 'SrchDlg.pas' {SearchDlg},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Update;
  Application.Title := 'Marine Adventures Order Entry';
  Application.HelpFile := 'MASTAPP.HLP';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TBrPartsForm, BrPartsForm);
  Application.CreateForm(TQueryCustDlg, QueryCustDlg);
  Application.CreateForm(TEdPartsForm, EdPartsForm);
  Application.CreateForm(TBrCustOrdForm, BrCustOrdForm);
  Application.CreateForm(TEdCustForm, EdCustForm);
  Application.CreateForm(TEdOrderForm, EdOrderForm);
  Application.CreateForm(TSearchDlg, SearchDlg);
  Application.CreateForm(TBrDateForm, BrDateForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TPickOrderNoDlg, PickOrderNoDlg);
  Application.CreateForm(TMastData, MastData);
  SplashForm.Hide;
  SplashForm.Free;
  Application.Run;
end.
