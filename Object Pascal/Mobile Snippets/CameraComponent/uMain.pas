//---------------------------------------------------------------------------

// This software is Copyright (c) 2015-2019 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.Permissions,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Media,
  FMX.Objects, FMX.Layouts, FMX.Memo, FMX.ListBox, FMX.TabControl, FMX.Controls.Presentation,
  System.Actions, FMX.ActnList, System.Messaging;

type
  TCameraComponentForm = class(TForm)
    btnSettings: TButton;
    ActionList: TActionList;
    actStart: TAction;
    actStop: TAction;
    actShowSettings: TAction;
    CameraComponent: TCameraComponent;
    btnStartStopCamera: TButton;
    imgCameraView: TImage;
    tbToolbar: TToolBar;
    lToolbarTitle: TLabel;
    procedure actStopExecute(Sender: TObject);
    procedure actStartExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure actShowSettingsExecute(Sender: TObject);
    { Broadcast }
    procedure CameraComponentSampleBufferReady(Sender: TObject; const ATime: TMediaTime);
    procedure ActionListExecute(Action: TBasicAction; var Handled: Boolean);
  private
    FPermissionCamera: string;
    FSavedCameraActive: Boolean;
    procedure DisplayCameraPreviewFrame;
    procedure ActivateCameraPermissionRequestResult(Sender: TObject; const APermissions: TArray<string>; const AGrantResults: TArray<TPermissionStatus>);
    procedure DisplayRationale(Sender: TObject; const APermissions: TArray<string>; const APostRationaleProc: TProc);
    procedure ApplicationEventChangedHandler(const Sender: TObject; const AMessage: TMessage);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses
{$IFDEF ANDROID}
  Androidapi.Helpers,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,
{$ENDIF}
  FMX.Platform, FMX.DialogService, uSettings;

{$R *.fmx}

constructor TCameraComponentForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  TMessageManager.DefaultManager.SubscribeToMessage(TApplicationEventMessage, ApplicationEventChangedHandler);
{$IFDEF ANDROID}
  FPermissionCamera := JStringToString(TJManifest_permission.JavaClass.CAMERA);
{$ENDIF}
end;

procedure TCameraComponentForm.ActionListExecute(Action: TBasicAction; var Handled: Boolean);
begin
  if not PermissionsService.IsPermissionGranted(FPermissionCamera) then
  begin
    Handled := True;
    PermissionsService.RequestPermissions([FPermissionCamera], ActivateCameraPermissionRequestResult, DisplayRationale);
  end;
end;

procedure TCameraComponentForm.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  if CameraComponent.Active then
    btnStartStopCamera.Action := actStop
  else
    btnStartStopCamera.Action := actStart;
end;

procedure TCameraComponentForm.actShowSettingsExecute(Sender: TObject);
var
  SavedCameraActive: Boolean;
begin
  SavedCameraActive := CameraComponent.Active;
  SettingsForm.Camera := CameraComponent;
  CameraComponent.Active := False;
  SettingsForm.ShowModal(procedure (AResult: TModalResult)
  begin
    CameraComponent.Active := SavedCameraActive;
  end);
end;

procedure TCameraComponentForm.actStartExecute(Sender: TObject);
begin
  CameraComponent.Active := True;
end;

procedure TCameraComponentForm.actStopExecute(Sender: TObject);
begin
  CameraComponent.Active := False;
end;

procedure TCameraComponentForm.ActivateCameraPermissionRequestResult(Sender: TObject; const APermissions: TArray<string>; const AGrantResults: TArray<TPermissionStatus>);
begin
  // 1 permission involved: CAMERA
  if (Length(AGrantResults) = 1) and (AGrantResults[0] = TPermissionStatus.Granted) then
  begin
    { Turn on the Camera }
    CameraComponent.Active := True;
    FSavedCameraActive := True;
  end
  else
    TDialogService.ShowMessage('Cannot start the camera because the required permission has not been granted');
end;

// Optional rationale display routine to display permission requirement rationale to the user
procedure TCameraComponentForm.DisplayRationale(Sender: TObject; const APermissions: TArray<string>; const APostRationaleProc: TProc);
begin
  // Show an explanation to the user *asynchronously* - don't block this thread waiting for the user's response!
  // After the user sees the explanation, invoke the post-rationale routine to request the permissions
  TDialogService.ShowMessage('The app needs to access the camera in order to work',
    procedure(const AResult: TModalResult)
    begin
      APostRationaleProc;
    end)
end;

procedure TCameraComponentForm.ApplicationEventChangedHandler(const Sender: TObject; const AMessage: TMessage);
begin
  case TApplicationEventMessage(AMessage).Value.Event of
    TApplicationEvent.WillBecomeInactive:
    begin
      FSavedCameraActive := CameraComponent.Active;
      CameraComponent.Active := False;
    end;
    TApplicationEvent.BecameActive:
      CameraComponent.Active := FSavedCameraActive;
  end;
end;

procedure TCameraComponentForm.CameraComponentSampleBufferReady(Sender: TObject; const ATime: TMediaTime);
begin
  TThread.Synchronize(TThread.CurrentThread, DisplayCameraPreviewFrame);
end;

destructor TCameraComponentForm.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TApplicationEventMessage, ApplicationEventChangedHandler);
  inherited;
end;

procedure TCameraComponentForm.DisplayCameraPreviewFrame;
begin
  CameraComponent.SampleBufferToBitmap(imgCameraView.Bitmap, True);
end;

end.
