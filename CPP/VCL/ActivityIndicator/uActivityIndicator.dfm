object ActivityIndicatorForm: TActivityIndicatorForm
  Left = 0
  Top = 0
  Caption = 'TActivityIndicator'
  ClientHeight = 328
  ClientWidth = 452
  Color = clBtnFace
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
  object lblFrameDelay: TLabel
    Left = 245
    Top = 55
    Width = 83
    Height = 13
    Caption = 'Frame Delay (50)'
  end
  object lblVclStyle: TLabel
    Left = 24
    Top = 124
    Width = 45
    Height = 13
    Alignment = taRightJustify
    Caption = 'VCL Style'
  end
  object lblFormColor: TLabel
    Left = 245
    Top = 126
    Width = 158
    Height = 13
    Caption = 'Form Color (Windows Style Only)'
  end
  object chkAnimate: TCheckBox
    Left = 245
    Top = 20
    Width = 96
    Height = 17
    Caption = 'Animate'
    TabOrder = 0
    OnClick = chkAnimateClick
  end
  object trkFrameDelay: TTrackBar
    Left = 238
    Top = 74
    Width = 203
    Height = 28
    Max = 15
    Min = 3
    Position = 5
    TabOrder = 1
    OnChange = trkFrameDelayChange
  end
  object grpIndicatorType: TRadioGroup
    Left = 20
    Top = 193
    Width = 145
    Height = 117
    Caption = 'Indicator Type'
    ItemIndex = 0
    Items.Strings = (
      'aitMomentumDots'
      'aitRotatingSector'
      'aitSectorRing')
    TabOrder = 4
    OnClick = grpIndicatorTypeClick
  end
  object grpIndicatorSize: TRadioGroup
    Left = 184
    Top = 193
    Width = 125
    Height = 117
    Caption = 'Indicator Size'
    ItemIndex = 1
    Items.Strings = (
      'aisSmall'
      'aisMedium'
      'aisLarge'
      'aisXLarge')
    TabOrder = 5
    OnClick = grpIndicatorSizeClick
  end
  object grpIndicatorColor: TRadioGroup
    Left = 328
    Top = 193
    Width = 105
    Height = 117
    Caption = 'Indicator Color'
    ItemIndex = 0
    Items.Strings = (
      'aicBlack'
      'aicWhite')
    TabOrder = 6
    OnClick = grpIndicatorColorClick
  end
  object cbxVclStyles: TComboBox
    Left = 20
    Top = 145
    Width = 197
    Height = 21
    Style = csDropDownList
    TabOrder = 2
    OnChange = cbxVclStylesChange
  end
  object AI: TActivityIndicator
    Left = 20
    Top = 20
  end
  object cbxFormColor: TColorBox
    Left = 245
    Top = 145
    Width = 188
    Height = 22
    DefaultColorColor = clBtnFace
    NoneColorColor = clBtnFace
    Selected = clBtnFace
    TabOrder = 3
    OnChange = cbxFormColorChange
  end
end
