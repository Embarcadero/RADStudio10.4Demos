//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.ListBox,
  FMX.Layouts, FMX.Controls.Presentation;

type
  TDeviceInfoForm = class(TForm)
    btnGetDeviceInfo: TButton;
    ListBox1: TListBox;
    lbOSName: TListBoxItem;
    lbOSVersion: TListBoxItem;
    ToolBar1: TToolBar;
    Label1: TLabel;
    lbDeviceType: TListBoxItem;
    procedure btnGetDeviceInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeviceInfoForm: TDeviceInfoForm;

implementation
{$IFDEF IOS}
uses
  iOSapi.UIKit, iOSapi.Foundation, Macapi.Helpers;
{$ENDIF}
{$IFDEF ANDROID}
uses
  androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  androidapi.JNI.Os;
{$ENDIF}

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}


{$IFDEF ANDROID}

function GetCodename(VerString: string): string;
begin
  if VerString = '1.0' then
    Result := 'BASE'
  else if VerString = '1.1' then
    Result := 'BASE_1_1'
  else if VerString = '1.5' then
    Result := 'CUPCAKE'
  else if VerString = '1.6' then
    Result := 'DONUT'
  else if VerString = '2.0' then
    Result := 'ECLAIR'
  else if VerString = '2.0.1' then
    Result := 'ECLAIR_0_1'
  else if VerString = '2.1' then
    Result := 'ECLAIR_MR1'
  else if VerString = '2.2' then
    Result := 'FROYO'
  else if VerString = '2.3' then
    Result := 'GINGERBREAD'
  else if VerString = '2.3.3' then
    Result := 'GINGERBREAD_MR1'
  else if VerString = '3.0' then
    Result := 'HONEYCOMB'
  else if VerString = '3.1' then
    Result := 'HONEYCOMB_MR1'
  else if VerString = '3.2' then
    Result := 'HONEYCOMB_MR2'
  else if VerString = '4.0.3' then
    Result := 'ICE_CREAM_SANDWICH_MR1'
  else if Pos('4.0',VerString) = 1 then
    Result := 'ICE_CREAM_SANDWICH'
  else if VerString = '4.1' then
    Result := 'JELLY_BEAN'
  else if VerString = '4.2' then
    Result := 'JELLY_BEAN_MR1'
  else if VerString = '4.3' then
    Result := 'JELLY_BEAN_MR2'
  else if Pos('4.4',VerString) = 1 then
    Result := 'KITKAT'
  else if VerString = '5.0' then
    Result := 'LOLLIPOP'
  else if VerString = '5.1' then
    Result := 'LOLLIPOP_MR1'
  else if VerString = '6.0' then
    Result := 'MARSHMALLOW'
  else if VerString = '7.0' then
    Result := 'NOUGAT'
  else if VerString = '7.1' then
    Result := 'NOUGAT_MR1'
  else if Pos('8.0',VerString) = 1 then
    Result := 'OREO'
  else if Pos('8.1',VerString) = 1 then
    Result := 'OREO_MR1'
  else if VerString = '9' then
    Result := 'PIE'
  else if VerString = '10' then
    Result := 'ANDROID10'
  else if VerString = '11' then
    Result := 'ANDROID11'
  else Result := 'UNKNOWN';
end;

procedure TDeviceInfoForm.btnGetDeviceInfoClick(Sender: TObject);
var
  codename: string;
begin
  codename := 'Unknown';
  lbDeviceType.Text := Format('Device Type: %s', [JStringToString(TJBuild.JavaClass.MODEL)]);

  lbOSName.Text := Format('OS Name: %s', [GetCodename(JStringToString(TJBuild_VERSION.JavaClass.RELEASE))]);
  lbOSVersion.Text := Format('OS Version: %s', [JStringToString(TJBuild_VERSION.JavaClass.RELEASE)]);
end;
{$ENDIF}
{$IFDEF IOS}
procedure TDeviceInfoForm.btnGetDeviceInfoClick(Sender: TObject);
var
  Device : UIDevice;
begin
  Device := TUIDevice.Wrap(TUIDevice.OCClass.currentDevice);
  lbOSName.Text := Format('OS Name: %s', [NSStrToStr(Device.systemName)]);
  lbOSVersion.Text := Format('OS Version: %s', [NSStrToStr(Device.systemVersion)]);
  lbDeviceType.Text := Format('Device Type: %s', [NSStrToStr(Device.model)]);
end;
{$ENDIF}


end.
