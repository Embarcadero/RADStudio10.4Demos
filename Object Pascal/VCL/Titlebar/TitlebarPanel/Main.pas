unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.StdActns, Vcl.ExtActns, Vcl.ActnList,
  System.Actions, Vcl.PlatformDefaultStyleActnCtrls, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.TitleBarCtrls,
  Vcl.VirtualImageList, Vcl.Menus, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Buttons;

type
  TFrmMain = class(TForm)
    ActionMainMenuBar1: TActionMainMenuBar;
    TitleBarPanel1: TTitleBarPanel;
    ActionManager1: TActionManager;
    DialogOpenPicture1: TOpenPicture;
    DialogSavePicture1: TSavePicture;
    DialogColorSelect1: TColorSelect;
    DialogFontEdit1: TFontEdit;
    DialogPrintDlg1: TPrintDlg;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditDelete1: TEditDelete;
    FileOpen1: TFileOpen;
    FileOpenWith1: TFileOpenWith;
    FileSaveAs1: TFileSaveAs;
    FilePrintSetup1: TFilePrintSetup;
    FilePageSetup1: TFilePageSetup;
    FileRun1: TFileRun;
    FileExit1: TFileExit;
    BrowseForFolder1: TBrowseForFolder;
    InternetBrowseURL1: TBrowseURL;
    InternetDownLoadURL1: TDownLoadURL;
    InternetSendMail1: TSendMail;
    SearchFind1: TSearchFind;
    SearchFindNext1: TSearchFindNext;
    SearchReplace1: TSearchReplace;
    SearchFindFirst1: TSearchFindFirst;
    ToolBar16: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolBar32: TToolBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    VirtualImageList16: TVirtualImageList;
    ImageCollection1: TImageCollection;
    VirtualImageList32: TVirtualImageList;
    ColorBoxActive: TColorBox;
    ColorBoxInActive: TColorBox;
    ColorBoxActiveText: TColorBox;
    ColorBoxInActiveText: TColorBox;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    CheckBoxCustomColors: TCheckBox;
    CheckBoxOnPaint: TCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    ColorBoxButtonBackground: TColorBox;
    ColorBoxButtonForeground: TColorBox;
    Label1: TLabel;
    Label2: TLabel;
    ColorBoxButtonInactiveBackground: TColorBox;
    ColorBoxButtonInactiveForeground: TColorBox;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ActionMainMenuBar1Paint(Sender: TObject);
    procedure ColorBoxActiveSelect(Sender: TObject);
    procedure ColorBoxInActiveSelect(Sender: TObject);
    procedure ColorBoxActiveTextSelect(Sender: TObject);
    procedure ColorBoxInActiveTextSelect(Sender: TObject);
    procedure CheckBoxCustomColorsClick(Sender: TObject);
    procedure TitleBarPanel1Paint(Sender: TObject; Canvas: TCanvas;
      var ARect: TRect);
    procedure CheckBoxOnPaintClick(Sender: TObject);
    procedure ColorBoxButtonBackgroundSelect(Sender: TObject);
    procedure ColorBoxButtonForegroundSelect(Sender: TObject);
    procedure ColorBoxButtonInactiveBackgroundSelect(Sender: TObject);
    procedure ColorBoxButtonInactiveForegroundSelect(Sender: TObject);
    procedure SystemTitlebarButton1Paint(Sender: TObject);
    procedure SystemTitlebarButton1Click(Sender: TObject);
  private
    FLastDWMColorizationColor: TColor;
    procedure DWMColorizationColorChanged(var Message: TMessage); message WM_DWMCOLORIZATIONCOLORCHANGED;
    procedure WMActivate(var Message: TWMActivate); message WM_ACTIVATE;
    procedure UpdateControls;
    procedure DrawSymbol(ACanvas: TCanvas; ARect: TRect; FGColor, BGColor: TColor);
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  Vcl.GraphUtil, Vcl.Themes, System.Types, System.Math, Winapi.GDIPAPI,
  Winapi.GDIPOBJ;

{$R *.dfm}

procedure TFrmMain.ActionMainMenuBar1Paint(Sender: TObject);
var
  LColor: TColor;
begin
  if CustomTitleBar.Enabled and not CustomTitleBar.SystemColors then
  begin
    if Active then
      LColor := CustomTitleBar.BackgroundColor
    else
      LColor := CustomTitleBar.InactiveBackgroundColor;
    ActionMainMenuBar1.Canvas.Brush.Color := LColor;
    ActionMainMenuBar1.Canvas.FillRect(ActionMainMenuBar1.ClientRect);
  end;
end;

procedure TFrmMain.CheckBoxCustomColorsClick(Sender: TObject);
begin
  CustomTitleBar.SystemColors := not CheckBoxCustomColors.Checked;
  CustomTitleBar.SystemButtons := not CheckBoxCustomColors.Checked;
  if CustomTitleBar.SystemColors then
    CustomTitleBar.InitTitleBarColors;
  UpdateControls;
  CustomTitleBar.Invalidate;
  ActionMainMenuBar1.Invalidate;
end;

procedure TFrmMain.CheckBoxOnPaintClick(Sender: TObject);
begin
  CustomTitleBar.Invalidate;
end;

procedure TFrmMain.ColorBoxActiveSelect(Sender: TObject);
begin
  if CustomTitleBar.Enabled and not CustomTitleBar.SystemColors then
  begin
    CustomTitleBar.BackgroundColor := ColorBoxActive.Selected;
    UpdateControls;
    CustomTitleBar.Invalidate;
    ActionMainMenuBar1.Invalidate;
  end;
end;

procedure TFrmMain.ColorBoxActiveTextSelect(Sender: TObject);
begin
  if CustomTitleBar.Enabled and not CustomTitleBar.SystemColors then
  begin
    CustomTitleBar.ForegroundColor := ColorBoxActiveText.Selected;
    UpdateControls;
    CustomTitleBar.Invalidate;
    ActionMainMenuBar1.Invalidate;
  end;
end;

procedure TFrmMain.ColorBoxButtonBackgroundSelect(Sender: TObject);
begin
  if CustomTitleBar.Enabled and not CustomTitleBar.SystemColors then
  begin
    CustomTitleBar.ButtonBackgroundColor := ColorBoxButtonBackground.Selected;
    UpdateControls;
  end;
end;

procedure TFrmMain.ColorBoxButtonForegroundSelect(Sender: TObject);
begin
  if CustomTitleBar.Enabled and not CustomTitleBar.SystemColors then
  begin
    CustomTitleBar.ButtonForegroundColor := ColorBoxButtonForeground.Selected;
    UpdateControls;
  end;
end;

procedure TFrmMain.ColorBoxButtonInactiveBackgroundSelect(Sender: TObject);
begin
  if CustomTitleBar.Enabled and not CustomTitleBar.SystemColors then
  begin
    CustomTitleBar.ButtonInactiveBackgroundColor := ColorBoxButtonInactiveBackground.Selected;
    UpdateControls;
  end;
end;

procedure TFrmMain.ColorBoxButtonInactiveForegroundSelect(Sender: TObject);
begin
  if CustomTitleBar.Enabled and not CustomTitleBar.SystemColors then
  begin
    CustomTitleBar.ButtonInactiveForegroundColor := ColorBoxButtonInactiveForeground.Selected;
    UpdateControls;
  end;
end;

procedure TFrmMain.ColorBoxInActiveSelect(Sender: TObject);
begin
  if CustomTitleBar.Enabled and not CustomTitleBar.SystemColors then
  begin
    CustomTitleBar.InactiveBackgroundColor := ColorBoxInActive.Selected;
    UpdateControls;
  end;
end;

procedure TFrmMain.ColorBoxInActiveTextSelect(Sender: TObject);
begin
  if CustomTitleBar.Enabled and not CustomTitleBar.SystemColors then
  begin
    CustomTitleBar.InactiveForegroundColor := ColorBoxInActiveText.Selected;
    UpdateControls;
  end;

end;

procedure TFrmMain.DWMColorizationColorChanged(var Message: TMessage);
begin
  if CustomTitleBar.Enabled and CustomTitleBar.SystemColors and
    (TColor(Message.WParam) <> FLastDWMColorizationColor) then
  begin
    FLastDWMColorizationColor := TColor(Message.WParam);
    CustomTitleBar.InitTitleBarColors;
    UpdateControls;
    CustomTitleBar.Invalidate;
    Message.Result := 0;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FLastDWMColorizationColor := clNone;
  for var i: Integer := 0 to ComponentCount - 1 do
    if (Components[i].Tag = 1) and (Components[i] is TControl) then
      TControl(Components[i]).Enabled := TOSVersion.Check(10);
  UpdateControls;
end;

procedure TFrmMain.DrawSymbol(ACanvas: TCanvas; ARect: TRect; FGColor, BGColor: TColor);
var
  LRect: TRect;
  LGPGraphics: TGPGraphics;
  LGPPen: TGPPen;
  LRGBColor, LSize: Integer;
  LColor: Cardinal;
  LGPRect: TGPRect;
  LPath: TGPGraphicsPath;
begin
  LRGBColor := ColorToRGB(FGColor);
  LColor := MakeColor(GetRValue(LRGBColor), GetGValue(LRGBColor), GetBValue(LRGBColor));
  LGPGraphics := TGPGraphics.Create(ACanvas.Handle);
  try
    LGPGraphics.SetSmoothingMode(SmoothingModeAntiAlias);
    LGPPen := TGPPen.Create(LColor, CurrentPPI / Screen.DefaultPixelsPerInch);
    try
      LPath := TGPGraphicsPath.Create;
      try
        LPath.Reset;
        LSize := MulDiv(9, CurrentPPI, Screen.DefaultPixelsPerInch);
        LRect := CenteredRect(ARect, Rect(0, 0, LSize, LSize));

        LGPRect := MakeRect(LRect.Left, LRect.Top, LRect.Width, LRect.Height);
        LPath.AddEllipse(LGPRect);

        LSize := MulDiv(2, CurrentPPI, Screen.DefaultPixelsPerInch);
        InflateRect(LRect, LSize, LSize);
        LGPRect := MakeRect(LRect.Left, LRect.Top, LRect.Width, LRect.Height);
        LPath.AddEllipse(LGPRect);

        LGPGraphics.DrawPath(LGPPen, LPath);
      finally
        LPath.Free;
      end;
    finally
     LGPPen.Free;
    end;
  finally
    LGPGraphics.Free;
  end;
end;

procedure TFrmMain.SystemTitlebarButton1Click(Sender: TObject);
begin
  ShowMessage('You clicked the custom caption button !!!!!!');
end;

procedure TFrmMain.SystemTitlebarButton1Paint(Sender: TObject);
begin
  DrawSymbol(TSystemTitlebarButton(Sender).Canvas, TSystemTitlebarButton(Sender).ClientRect,
    IfThen(Active, CustomTitleBar.ButtonForegroundColor, CustomTitleBar.ButtonInactiveForegroundColor),
    IfThen(Active, CustomTitleBar.ButtonBackgroundColor, CustomTitleBar.ButtonInactiveBackgroundColor));
end;

procedure TFrmMain.TitleBarPanel1Paint(Sender: TObject; Canvas: TCanvas;
  var ARect: TRect);
const
  AlignStyles: array [TAlignment] of TTextFormats = (tfLeft, tfRight, tfCenter);
  cDefaultGlowSize = 20;
var
  LTextOptions: TStyleTextOptions;
  LTextFormat: TTextFormat;
  s: string;
  LRect: TRect;
  LBitmap: TBitmap;
  BlendFunc: TBlendFunction;
begin
  if CheckBoxOnPaint.Checked then
  begin
    //Bitmap
    LRect := ARect;
    LBitmap := TBitmap.Create;
    try
      LBitmap.PixelFormat := pf32bit;
      LBitmap.SetSize(MulDiv(200, CurrentPPI, Screen.DefaultPixelsPerInch), LRect.Height div 2);
      if Active then
        GradientFillCanvas(LBitmap.Canvas, clWebLightYellow, clWebGreen,
          Rect(0, 0, LBitmap.Width, LBitmap.Height), TGradientDirection.gdHorizontal)
      else
        GradientFillCanvas(LBitmap.Canvas, clWebCornSilk, clWebAzure,
          Rect(0, 0, LBitmap.Width, LBitmap.Height), TGradientDirection.gdHorizontal);

      //LBitmap.AlphaFormat := afPremultiplied;
      SetPreMutipliedAlpha(LBitmap);

      BlendFunc.BlendOp := AC_SRC_OVER;
      BlendFunc.BlendFlags := 0;
      BlendFunc.SourceConstantAlpha := 255;
      BlendFunc.AlphaFormat := AC_SRC_ALPHA;
      Winapi.Windows.AlphaBlend(Canvas.Handle, (Width - LBitmap.Width) div 2, MulDiv(30, CurrentPPI, Screen.DefaultPixelsPerInch), LBitmap.Width, LBitmap.Height,
      LBitmap.Canvas.Handle, 0, 0, LBitmap.Width, LBitmap.Height, BlendFunc);
    finally
      LBitmap.Free;
    end;

    //  drawing a text
    LTextOptions.GlowSize := cDefaultGlowSize;
    LTextOptions.Flags := [stfTextColor, stfGlowSize];

    if Active then
      LTextOptions.TextColor := clWebDarkRed
    else
      LTextOptions.TextColor := clBlue;

    LTextFormat := [tfSingleLine, tfVerticalCenter, tfEndEllipsis, tfComposited];
    Include(LTextFormat, AlignStyles[taCenter]);

    Inc(LRect.Top, MulDiv(20, CurrentPPI, Screen.DefaultPixelsPerInch));
    s := 'Sample Text OnPaint event';
    TStyleManager.SystemStyle.DrawText(Canvas.Handle,
      TStyleManager.SystemStyle.GetElementDetails(twCaptionActive), s, LRect,
      LTextFormat, LTextOptions);
  end;
end;

procedure TFrmMain.UpdateControls;
begin
  ToolBar16.HotTrackColor := ColorBlendRGB(StyleServices(Self).GetSystemColor(clHighlight), CustomTitleBar.BackgroundColor, 0.6);
  ToolBar32.HotTrackColor := ToolBar16.HotTrackColor;
  ToolBar16.Transparent := ((TOSVersion.Major = 6) and (TOSVersion.Minor = 1)) or (TOSVersion.Check(10) and CustomTitleBar.SystemColors);
  ToolBar32.Transparent := ToolBar16.Transparent;
  if not ToolBar16.Transparent then
  begin
    ToolBar16.GradientStartColor := CustomTitleBar.BackgroundColor;
    ToolBar16.GradientEndColor := CustomTitleBar.BackgroundColor;
  end;
  if not ToolBar32.Transparent then
  begin
    ToolBar32.GradientStartColor := CustomTitleBar.BackgroundColor;
    ToolBar32.GradientEndColor := CustomTitleBar.BackgroundColor;
  end;
  ActionMainMenuBar1.DoubleBuffered := True;
  ActionMainMenuBar1.Transparent := ToolBar16.Transparent;
  if not CustomTitleBar.SystemColors then
  begin
    ColorBoxActiveText.Selected := CustomTitleBar.ForegroundColor;
    ColorBoxInActiveText.Selected := CustomTitleBar.InactiveForegroundColor;
  end;

  if TOSVersion.Check(10) and not CustomTitleBar.SystemColors then
  begin
    ColorBoxActive.Selected := CustomTitleBar.BackgroundColor;
    ColorBoxInActive.Selected := CustomTitleBar.InactiveBackgroundColor;
    ColorBoxButtonBackground.Selected := CustomTitleBar.ButtonBackgroundColor;
    ColorBoxButtonForeground.Selected := CustomTitleBar.ButtonForegroundColor;
    ColorBoxButtonInactiveBackground.Selected := CustomTitleBar.ButtonInactiveBackgroundColor;
    ColorBoxButtonInactiveForeground.Selected := CustomTitleBar.ButtonInactiveForegroundColor;
  end;
end;

procedure TFrmMain.WMActivate(var Message: TWMActivate);
var
  LColor : TColor;
begin
  inherited;
  if CustomTitleBar.Enabled and Assigned(ActionMainMenuBar1) then
    ActionMainMenuBar1.Invalidate;

  if TOSVersion.Check(10) and CustomTitleBar.Enabled and not CustomTitleBar.SystemColors then
  begin
    if Active then
      LColor := CustomTitleBar.BackgroundColor
    else
      LColor := CustomTitleBar.InactiveBackgroundColor;

    ToolBar16.GradientStartColor := LColor;
    ToolBar16.GradientEndColor := LColor;
    ToolBar32.GradientStartColor := LColor;
    ToolBar32.GradientEndColor := LColor;
  end;
end;

end.
