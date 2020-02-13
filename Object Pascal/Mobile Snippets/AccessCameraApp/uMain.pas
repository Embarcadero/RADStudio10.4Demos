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
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, System.Actions,
  FMX.ActnList, FMX.StdActns, FMX.MediaLibrary.Actions, FMX.Objects, FMX.Graphics,
  FMX.Controls.Presentation;

type
  TAccessCameraAppForm = class(TForm)
  private const
    PermissionCamera = 'android.permission.CAMERA';
    PermissionReadExternalStorage = 'android.permission.READ_EXTERNAL_STORAGE';
    PermissionWriteExternalStorage = 'android.permission.WRITE_EXTERNAL_STORAGE';
  private
    procedure DisplayRationale(Sender: TObject; const APermissions: TArray<string>; const APostRationaleProc: TProc);
    procedure TakePicturePermissionRequestResult(Sender: TObject; const APermissions: TArray<string>; const AGrantResults: TArray<TPermissionStatus>);
  published var
    alGetFromCamera: TActionList;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    imgCameraImage: TImage;
    ToolBar1: TToolBar;
    btnTakePhoto: TButton;
    Label1: TLabel;
  published
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure btnTakePhotoClick(Sender: TObject);
  end;

implementation

uses
  FMX.DialogService;

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

// Optional rationale display routine to display permission requirement rationale to the user
procedure TAccessCameraAppForm.DisplayRationale(Sender: TObject; const APermissions: TArray<string>; const APostRationaleProc: TProc);
begin
  var RationaleMsg: string;

  for var I := 0 to High(APermissions) do
  begin
    if APermissions[I] = PermissionCamera then
      RationaleMsg := RationaleMsg + 'The app needs to access the camera to take a photo' + SLineBreak + SLineBreak
    else if APermissions[I] = PermissionReadExternalStorage then
      RationaleMsg := RationaleMsg + 'The app needs to read a photo file from your device';
  end;

  // Show an explanation to the user *asynchronously* - don't block this thread waiting for the user's response!
  // After the user sees the explanation, invoke the post-rationale routine to request the permissions
  TDialogService.ShowMessage(RationaleMsg,
    procedure(const AResult: TModalResult)
    begin
      APostRationaleProc;
    end)
end;

procedure TAccessCameraAppForm.btnTakePhotoClick(Sender: TObject);
begin
  PermissionsService.RequestPermissions([PermissionCamera, PermissionReadExternalStorage, PermissionWriteExternalStorage], TakePicturePermissionRequestResult, DisplayRationale)
end;

procedure TAccessCameraAppForm.TakePicturePermissionRequestResult(Sender: TObject; const APermissions: TArray<string>; const AGrantResults: TArray<TPermissionStatus>);
begin
  // 3 permissions involved: CAMERA, READ_EXTERNAL_STORAGE and WRITE_EXTERNAL_STORAGE
  if (Length(AGrantResults) = 3) and (AGrantResults[0] = TPermissionStatus.Granted) and (AGrantResults[1] = TPermissionStatus.Granted) and (AGrantResults[2] = TPermissionStatus.Granted) then
    TakePhotoFromCameraAction1.Execute
  else
    TDialogService.ShowMessage('Cannot take a photo because the required permissions are not all granted')
end;

procedure TAccessCameraAppForm.TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
begin
  { Assign the image retrieved from the Camera to the TImage component. }
  imgCameraImage.Bitmap.Assign(Image);
end;

end.
