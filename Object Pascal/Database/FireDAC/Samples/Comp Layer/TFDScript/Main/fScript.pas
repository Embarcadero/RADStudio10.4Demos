//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fScript;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, DB, Grids, DBGrids,
  fMainCompBase,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.UI.Intf, FireDAC.VCLUI.ResourceOptions, FireDAC.VCLUI.FetchOptions,
    FireDAC.VCLUI.FormatOptions, FireDAC.VCLUI.UpdateOptions,
    FireDAC.VCLUI.Script,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.Script, FireDAC.Comp.ScriptCommands, FireDAC.Comp.UI;

type
  TfrmScript = class(TfrmMainCompBase)
    FDScript1: TFDScript;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    tsFromStrings: TTabSheet;
    mmCreateIndexes: TMemo;
    mmCreateTabs: TMemo;
    mmLoadData: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    mmMain: TMemo;
    btnRunFromStrings: TButton;
    FDGUIxScriptDialog1: TFDGUIxScriptDialog;
    btnRunFromFiles: TButton;
    mmScriptSpool: TMemo;
    Label5: TLabel;
    btnRunSpool: TButton;
    mmSpoolFile: TMemo;
    mmSpoolInmem: TMemo;
    Label6: TLabel;
    Label7: TLabel;
    TabSheet1: TTabSheet;
    Label8: TLabel;
    mmRunFromSpoolScript: TMemo;
    btnRunFromSpool: TButton;
    mmRunFromSpoolOutput: TMemo;
    Label9: TLabel;
    procedure cbDBClick(Sender: TObject);
    procedure btnRunFromStringsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRunFromFilesClick(Sender: TObject);
    procedure btnRunSpoolClick(Sender: TObject);
    procedure btnRunFromSpoolClick(Sender: TObject);
  private
    procedure Reset;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmScript: TfrmScript;

implementation

uses dmMainComp, fMainBase;

{$R *.dfm}

procedure TfrmScript.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  FDScript1.ScriptOptions.BreakOnError := True;
  FDGUIxScriptDialog1.Options := FDGUIxScriptDialog1.Options - [ssAutoHide];
end;

procedure TfrmScript.cbDBClick(Sender: TObject);
begin
  btnRunFromStrings.Enabled := False;
  btnRunFromFiles.Enabled := False;
  btnRunSpool.Enabled := False;
  btnRunFromSpool.Enabled := False;
  inherited cbDBClick(Sender);
  btnRunFromStrings.Enabled := dmlMainComp.dbMain.Connected;
  btnRunFromFiles.Enabled := dmlMainComp.dbMain.Connected;
  btnRunSpool.Enabled := dmlMainComp.dbMain.Connected;
  btnRunFromSpool.Enabled := dmlMainComp.dbMain.Connected and
    (dmlMainComp.dbMain.RDBMSKind = TFDRDBMSKinds.Oracle);
end;

procedure TfrmScript.Reset;
begin
  FDScript1.SQLScripts.Clear;
  FDScript1.SQLScriptFileName := '';
  FDScript1.ScriptOptions.Reset;
end;

procedure TfrmScript.btnRunFromStringsClick(Sender: TObject);
begin
  FDScript1.Connection.Connected := False;
  Reset;
  // Fill the SQLScripts collection
  with FDScript1.SQLScripts do begin
    Clear;
    // The root script must be with zero index
    with Add do begin
      Name := 'Main';
      SQL := mmMain.Lines;
    end;
    with Add do begin
      Name := 'CreateTabs';
      SQL := mmCreateTabs.Lines;
    end;
    with Add do begin
      Name := 'CreateIndexes';
      SQL := mmCreateIndexes.Lines;
    end;
    with Add do begin
      Name := 'LoadData';
      SQL := mmLoadData.Lines;
    end;
  end;

  // Run it
  FDScript1.ValidateAll;
  FDScript1.ExecuteAll;
end;

procedure TfrmScript.btnRunFromFilesClick(Sender: TObject);
var
  sPath: String;
begin
  Reset;
  sPath := ExtractFilePath(ParamStr(0));

  // Lets create script files :)
  mmMain.Lines.SaveToFile(sPath + 'Main.sql');
  mmCreateTabs.Lines.SaveToFile(sPath + 'CreateTabs.sql');
  mmCreateIndexes.Lines.SaveToFile(sPath + 'CreateIndexes.sql');
  mmLoadData.Lines.SaveToFile(sPath + 'LoadData.sql');

  // Set script default path
  FDScript1.ScriptOptions.DefaultScriptPath := sPath;
  // Assign root script file name
  FDScript1.SQLScriptFileName := 'main';

  // Run it
  FDScript1.ValidateAll;
  FDScript1.ExecuteAll;
end;

procedure TfrmScript.btnRunSpoolClick(Sender: TObject);
begin
  Reset;
  // Fill the SQLScripts collection
  with FDScript1.SQLScripts do begin
    Clear;
    // The root script must be with zero index
    with Add do begin
      Name := 'Main';
      SQL := mmScriptSpool.Lines;
    end;
    with Add do begin
      Name := 'InMemSpool';
    end;
  end;

  // Run it
  FDScript1.ValidateAll;
  FDScript1.ExecuteAll;

  mmSpoolFile.Lines.LoadFromFile(FDScript1.AllSpools[0]);
  mmSpoolInmem.Lines := FDScript1.SQLScripts[1].SQL;
end;

procedure TfrmScript.btnRunFromSpoolClick(Sender: TObject);
begin
  Reset;
  // Fill the SQLScripts collection
  with FDScript1.SQLScripts do begin
    Clear;
    // The root script must be with zero index
    with Add do begin
      Name := 'Main';
      SQL := mmRunFromSpoolScript.Lines;
    end;
    with Add do begin
      Name := 'InMemSpool';
    end;
  end;

  // Run it
  // Here the ValidateAll cannot properly estimate the total
  // scripts volume. So, do not call ValidateAll.
  // FDScript1.ValidateAll;
  FDScript1.ExecuteAll;

  mmRunFromSpoolOutput.Lines := FDScript1.SQLScripts[1].SQL;
end;

end.
