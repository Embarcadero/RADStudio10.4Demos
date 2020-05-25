object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Simple demo '
  ClientHeight = 411
  ClientWidth = 384
  Color = clBtnFace
  CustomTitleBar.Height = 0
  CustomTitleBar.BackgroundColor = 1080336
  CustomTitleBar.ForegroundColor = clWhite
  CustomTitleBar.InactiveBackgroundColor = clWhite
  CustomTitleBar.InactiveForegroundColor = 10066329
  CustomTitleBar.ButtonForegroundColor = clWhite
  CustomTitleBar.ButtonBackgroundColor = 1080336
  CustomTitleBar.ButtonHoverForegroundColor = clWhite
  CustomTitleBar.ButtonHoverBackgroundColor = 1483541
  CustomTitleBar.ButtonPressedForegroundColor = 65793
  CustomTitleBar.ButtonPressedBackgroundColor = 1956636
  CustomTitleBar.ButtonInactiveForegroundColor = 10066329
  CustomTitleBar.ButtonInactiveBackgroundColor = clWhite
  Constraints.MaxHeight = 450
  Constraints.MaxWidth = 400
  Constraints.MinHeight = 450
  Constraints.MinWidth = 400
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 384
    Height = 411
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 376
    ExplicitHeight = 424
    object Label1: TLabel
      Left = 32
      Top = 61
      Width = 30
      Height = 13
      Caption = 'Active'
    end
    object Label2: TLabel
      Left = 216
      Top = 61
      Width = 39
      Height = 13
      Caption = 'Inactive'
    end
    object Label3: TLabel
      Left = 8
      Top = 259
      Width = 87
      Height = 13
      Caption = 'Caption Alignment'
    end
    object CheckBoxCustomTitleBar: TCheckBox
      Left = 8
      Top = 8
      Width = 129
      Height = 17
      Caption = 'Enable custom title-bar'
      TabOrder = 0
      OnClick = CheckBoxCustomTitleBarClick
    end
    object CheckBoxCustomColors: TCheckBox
      Left = 8
      Top = 31
      Width = 169
      Height = 17
      Caption = 'Allow customize titlebar colors'
      TabOrder = 1
      OnClick = CheckBoxCustomColorsClick
    end
    object CheckBoxShowCaption: TCheckBox
      Left = 8
      Top = 126
      Width = 97
      Height = 17
      Caption = 'Show caption'
      TabOrder = 2
      OnClick = CheckBoxShowCaptionClick
    end
    object CheckBoxShowIcon: TCheckBox
      Left = 8
      Top = 149
      Width = 97
      Height = 17
      Caption = 'Show Icon'
      TabOrder = 3
      OnClick = CheckBoxShowIconClick
    end
    object ColorBoxActive: TColorBox
      Left = 32
      Top = 80
      Width = 145
      Height = 22
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames, cbCustomColors]
      TabOrder = 4
      OnSelect = ColorBoxActiveSelect
    end
    object TrackBar1: TTrackBar
      Left = 8
      Top = 208
      Width = 353
      Height = 45
      Max = 100
      Min = 30
      Frequency = 5
      Position = 30
      TabOrder = 5
      OnChange = TrackBar1Change
    end
    object CheckBoxHeight: TCheckBox
      Left = 8
      Top = 185
      Width = 97
      Height = 17
      Caption = 'Custom Height'
      TabOrder = 6
      OnClick = CheckBoxHeightClick
    end
    object ColorBoxInActive: TColorBox
      Left = 216
      Top = 80
      Width = 145
      Height = 22
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames, cbCustomColors]
      TabOrder = 7
      OnSelect = ColorBoxInActiveSelect
    end
    object RadioButtonLeft: TRadioButton
      Left = 8
      Top = 296
      Width = 113
      Height = 17
      Caption = 'Left'
      TabOrder = 8
      OnClick = RadioButtonLeftClick
    end
    object RadioButtonCenter: TRadioButton
      Left = 127
      Top = 296
      Width = 90
      Height = 17
      Caption = 'Center'
      TabOrder = 9
      OnClick = RadioButtonCenterClick
    end
    object RadioButtonRight: TRadioButton
      Left = 232
      Top = 296
      Width = 113
      Height = 17
      Caption = 'Right'
      TabOrder = 10
      OnClick = RadioButtonRightClick
    end
  end
end
