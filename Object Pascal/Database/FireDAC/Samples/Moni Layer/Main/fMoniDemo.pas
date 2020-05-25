//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fMoniDemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, ExtCtrls, ComCtrls,
  fMainBase,
  FireDAC.Stan.Intf,
  TestComponent,  FireDAC.Stan.Consts, FireDAC.Stan.Util, FireDAC.Stan.Def, FireDAC.Stan.Async,
    FireDAC.Stan.Pool, FireDAC.Stan.Expr, FireDAC.Stan.Factory, FireDAC.Moni.RemoteClient,
    FireDAC.Moni.FlatFile, FireDAC.Moni.Base;

type
  TfrmMoniDemo = class(TfrmMainBase)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    FDMoniRemoteClientLink1: TFDMoniRemoteClientLink;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
  private
    { Private declarations }
    TestComp1: TTestComp;
    TestComp2: TTestComp;
    TestComp3: TTestComp;
    TestComp4: TTestComp;
    TestComp5: TTestComp;
    TestComp6: TTestComp;
  public
    { Public declarations }
  end;

var
  frmMoniDemo: TfrmMoniDemo;

implementation

{$R *.dfm}

procedure TfrmMoniDemo.Button1Click(Sender: TObject);
begin
  TestComp1.Activate;
end;

procedure TfrmMoniDemo.Button3Click(Sender: TObject);
begin
  TestComp2.Activate;
end;

procedure TfrmMoniDemo.Button4Click(Sender: TObject);
begin
  TestComp3.Activate;
end;

procedure TfrmMoniDemo.Button5Click(Sender: TObject);
begin
  TestComp4.Activate;
end;

procedure TfrmMoniDemo.Button6Click(Sender: TObject);
begin
  TestComp5.Activate;
end;

procedure TfrmMoniDemo.Button7Click(Sender: TObject);
begin
  TestComp6.Activate;
end;

procedure TfrmMoniDemo.Button2Click(Sender: TObject);
begin
  TestComp1.Free;
end;

procedure TfrmMoniDemo.Button8Click(Sender: TObject);
begin
  TestComp2.Free;
end;

procedure TfrmMoniDemo.Button9Click(Sender: TObject);
begin
  TestComp3.Free;
end;

procedure TfrmMoniDemo.Button10Click(Sender: TObject);
begin
  TestComp4.Free;
end;

procedure TfrmMoniDemo.Button11Click(Sender: TObject);
begin
  TestComp5.Free;
end;

procedure TfrmMoniDemo.Button12Click(Sender: TObject);
begin
  TestComp6.Free;
end;

procedure TfrmMoniDemo.Button13Click(Sender: TObject);
begin
  TestComp1.Paused := not TestComp1.Paused;
end;

procedure TfrmMoniDemo.FormCreate(Sender: TObject);
begin
  Caption := 'CurrentProcessId = ' + IntToStr(GetCurrentProcessId);
  TestComp1 := TTestComp.Create(Self);
  TestComp1.Name := 'TestComp1';
  TestComp2 := TTestComp.Create(Self);
  TestComp2.Name := 'TestComp2';
  TestComp3 := TTestComp.Create(Self);
  TestComp3.Name := 'TestComp3';
  TestComp4 := TTestComp.Create(Self);
  TestComp4.Name := 'TestComp4';
  TestComp5 := TTestComp.Create(Self);
  TestComp5.Name := 'TestComp5';
  TestComp6 := TTestComp.Create(Self);
  TestComp6.Name := 'TestComp6';
end;

procedure TfrmMoniDemo.Button14Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to 1000000 do
    MonitorClient.Notify(ekVendor, esProgress, nil,
      'qweqweqweqwe', ['I', i, 'T', Now()]);
end;

end.
