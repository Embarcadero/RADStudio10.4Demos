//---------------------------------------------------------------------------

// This software is Copyright (c) 2015-2019 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uSettings;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox,
  FMX.Layouts, FMX.Media, FMX.Pickers;

type
  TItemSelectedCallback = reference to procedure(const ASelectedIndex: Integer);

  TSettingsForm = class(TForm)
    tbToolbar: TToolBar;
    lbSettings: TListBox;
    lbiKind: TListBoxItem;
    lbiQualityGroupHeader: TListBoxGroupHeader;
    lbiResolution: TListBoxItem;
    lbiPriority: TListBoxItem;
    lbiQuality: TListBoxItem;
    lbiTorchGroupHeader: TListBoxGroupHeader;
    lbiTorchMode: TListBoxItem;
    btnBack: TSpeedButton;
    lTitle: TLabel;
    procedure lbiKindClick(Sender: TObject);
    procedure lbiTorchModeClick(Sender: TObject);
    procedure lbiQualityClick(Sender: TObject);
    procedure lbiPriorityClick(Sender: TObject);
    procedure lbiResolutionClick(Sender: TObject);
  private
    [Weak] FCamera: TCameraComponent;
    procedure SetCamera(const Value: TCameraComponent);
    { Refreshing UI }
    function CollectResolutionsTitles: TArray<string>;
    procedure UpdateResolutionTitle;
    procedure UpdateQualityTitle;
    procedure UpdatePriorityTitle;
    procedure UpdateTorchMode;
    procedure UpdateKindTitle;
    procedure SelectValueFromList(const AItems: TArray<string>; const ASelectedIndex: Integer; const ASelectedCallback: TItemSelectedCallback);
  public
    property Camera: TCameraComponent read FCamera write SetCamera;
  end;

var
  SettingsForm: TSettingsForm;

implementation

uses
  FMX.Platform;

{$R *.fmx}

type
  TListPickerHelper = class
  private
    class var FCurrent: TListPickerHelper;
    class function Current: TListPickerHelper;
    class destructor Destroy;
  private
    FPicker: TCustomListPicker;
    FCallback: TItemSelectedCallback;
    procedure ValueChangedHandler(Sender: TObject; const AValueIndex: Integer);
    procedure SetItems(const Value: TArray<string>);
    procedure SetItemIndex(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Show;
    property Items: TArray<string> write SetItems;
    property ItemIndex: Integer write SetItemIndex;
    property ItemSelectedCallback: TItemSelectedCallback read FCallback write FCallback;
  end;

{ TListPickerFactory }

constructor TListPickerHelper.Create;
var
  Factory: IFMXPickerService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXPickerService, Factory) then
  begin
    FPicker := Factory.CreateListPicker;
    FPicker.OnValueChanged := ValueChangedHandler;
  end
  else
    raise EUnsupportedPlatformService.Create('IFMXPickerService');
end;

class function TListPickerHelper.Current: TListPickerHelper;
begin
  if FCurrent = nil then
    FCurrent := TListPickerHelper.Create;
  Result := FCurrent;
end;

class destructor TListPickerHelper.Destroy;
begin
  FreeAndNil(FCurrent);
end;

destructor TListPickerHelper.Destroy;
begin
  FreeAndNil(FPicker);
  inherited;
end;

procedure TListPickerHelper.SetItemIndex(const Value: Integer);
begin
  FPicker.ItemIndex := Value;
end;

procedure TListPickerHelper.SetItems(const Value: TArray<string>);
var
  Item: string;
begin
  FPicker.Values.Clear;
  for Item in Value do
    FPicker.Values.Add(Item);
end;

procedure TListPickerHelper.Show;
begin
  FPicker.Show;
end;

procedure TListPickerHelper.ValueChangedHandler(Sender: TObject; const AValueIndex: Integer);
begin
  if Assigned(FCallback) then
    FCallback(AValueIndex);
end;

{ TFormSettings }

function TSettingsForm.CollectResolutionsTitles: TArray<string>;
var
  SL: TStringList;
  ResolutionTitle: string;
begin
  SL := TStringList.Create;
  try
    for var Setting in Camera.AvailableCaptureSettings do
    begin
      ResolutionTitle := Format('%d x %d x %f', [Setting.Width, Setting.Height, Setting.FrameRate]);
      SL.Add(ResolutionTitle);
    end;
    Result := SL.ToStringArray;
  finally
    SL.Free;
  end;
end;

procedure TSettingsForm.lbiKindClick(Sender: TObject);
begin
  SelectValueFromList(['Default', 'Front', 'Back'], Integer(Camera.Kind),
    procedure (const AIndex: Integer)
    begin
      Camera.Kind := TCameraKind(AIndex);
      UpdateKindTitle;
      UpdateResolutionTitle;
    end);
end;

procedure TSettingsForm.lbiPriorityClick(Sender: TObject);
begin
  SelectValueFromList(['Resolution', 'Frame rate'], Integer(Camera.CaptureSettingPriority),
    procedure (const AIndex: Integer)
    begin
      Camera.CaptureSettingPriority := TVideoCaptureSettingPriority(AIndex);
      UpdatePriorityTitle;
      UpdateResolutionTitle;
    end);
end;

procedure TSettingsForm.lbiQualityClick(Sender: TObject);
begin
  SelectValueFromList(['Photo', 'High', 'Medium', 'Low', 'Custom'], Integer(Camera.Quality),
    procedure (const AIndex: Integer)
    begin
      Camera.Quality := TVideoCaptureQuality(AIndex);
      UpdateQualityTitle;
      UpdateResolutionTitle;
    end);
end;

procedure TSettingsForm.lbiResolutionClick(Sender: TObject);
begin
  SelectValueFromList(CollectResolutionsTitles, -1,
    procedure (const AIndex: Integer)
    begin
      var CaptureSettings := FCamera.AvailableCaptureSettings;
      Camera.CaptureSetting := CaptureSettings[AIndex];
      Camera.Quality := TVideoCaptureQuality.CaptureSettings;
      UpdateResolutionTitle;
      UpdateQualityTitle;
    end);
end;

procedure TSettingsForm.lbiTorchModeClick(Sender: TObject);
begin
  SelectValueFromList(['Off', 'On', 'Auto'], Integer(Camera.TorchMode),
    procedure (const AIndex: Integer)
    begin
      Camera.TorchMode := TTorchMode(AIndex);
      UpdateTorchMode;
    end);
end;

procedure TSettingsForm.SelectValueFromList(const AItems: TArray<string>; const ASelectedIndex: Integer;
  const ASelectedCallback: TItemSelectedCallback);
var
  Picker: TListPickerHelper;
begin
  Picker := TListPickerHelper.Current;

  Picker.Items := AItems;
  Picker.ItemSelectedCallback := ASelectedCallback;
  Picker.ItemIndex := ASelectedIndex;
  Picker.Show;
end;

procedure TSettingsForm.SetCamera(const Value: TCameraComponent);
begin
  FCamera := Value;
  UpdateResolutionTitle;
  UpdateQualityTitle;
  UpdatePriorityTitle;
  UpdateTorchMode;
  UpdateKindTitle;
end;

procedure TSettingsForm.UpdateKindTitle;
var
  Title: string;
begin
  case Camera.Kind of
    TCameraKind.Default:
      Title := 'Default';
    TCameraKind.FrontCamera:
      Title := 'Front';
    TCameraKind.BackCamera:
      Title := 'Back';
  end;
  lbiKind.ItemData.Detail := Title;
end;

procedure TSettingsForm.UpdatePriorityTitle;
var
  PriorityValue: string;
begin
  case Camera.CaptureSettingPriority of
    TVideoCaptureSettingPriority.Resolution:
      PriorityValue := 'Resolution';
    TVideoCaptureSettingPriority.FrameRate:
      PriorityValue := 'Frame rate';
  end;
  lbiPriority.ItemData.Detail := PriorityValue;
end;

procedure TSettingsForm.UpdateQualityTitle;
var
  Title: string;
begin
  case Camera.Quality of
    TVideoCaptureQuality.PhotoQuality:
      Title := 'Photo';
    TVideoCaptureQuality.HighQuality:
      Title := 'High';
    TVideoCaptureQuality.MediumQuality:
      Title := 'Medium';
    TVideoCaptureQuality.LowQuality:
      Title := 'Low';
    TVideoCaptureQuality.CaptureSettings:
      Title := 'Custom';
  end;
  lbiQuality.ItemData.Detail := Title;
end;

procedure TSettingsForm.UpdateResolutionTitle;
var
  Setting: TVideoCaptureSetting;
begin
  Setting := Camera.CaptureSetting;
  lbiResolution.ItemData.Detail := Format('%d x %d x %f', [Setting.Width, Setting.Height, Setting.FrameRate]);
end;

procedure TSettingsForm.UpdateTorchMode;
var
  Title: string;
begin
  case Camera.TorchMode of
    TTorchMode.ModeOff:
      Title := 'Off';
    TTorchMode.ModeOn:
      Title := 'On';
    TTorchMode.ModeAuto:
      Title := 'Auto';
  end;
  lbiTorchMode.ItemData.Detail := Title;
end;

end.
