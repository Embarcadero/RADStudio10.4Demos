
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
program Mastapp;

uses
  Forms,
  Main in 'MAIN.PAS' {MainForm},
  Brparts in 'BRPARTS.PAS' {BrPartsForm},
  QryCust in 'QryCust.pas' {QueryCustDlg},
  Edparts in 'EDPARTS.PAS' {EdPartsForm},
  BrCstOrd in 'BrCstOrd.pas' {BrCustOrdForm},
  Edcust in 'EDCUST.PAS' {EdCustForm},
  Edorders in 'EDORDERS.PAS' {EdOrderForm},
  SrchDlg in 'SrchDlg.pas' {SearchDlg},
  Splash in 'SPLASH.PAS' {SplashForm},
  Pickdate in 'PICKDATE.PAS' {BrDateForm},
  About in 'ABOUT.PAS' {AboutBox},
  Pickrep in 'PICKREP.PAS' {PickRpt},
  DataMod in 'DataMod.pas' {MastData: TDataModule},
  PickInvc in 'PickInvc.pas' {PickOrderNoDlg};

{$R *.RES}

begin
  Application.Initialize;
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Update;
  Application.Title := 'Marine Adventures Order Entry';
  Application.HelpFile := 'MASTAPP.HLP';
  Application.CreateForm(TMastData, MastData);
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
  Application.CreateForm(TPickRpt, PickRpt);
  Application.CreateForm(TPickOrderNoDlg, PickOrderNoDlg);
  SplashForm.Hide;
  SplashForm.Free;
  Application.Run;
end.
