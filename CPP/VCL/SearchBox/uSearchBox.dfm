object SearchBoxForm: TSearchBoxForm
  Left = 0
  Top = 0
  Caption = 'TSearchBox'
  ClientHeight = 421
  ClientWidth = 377
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
  object Label2: TLabel
    Left = 105
    Top = 148
    Width = 45
    Height = 13
    Caption = 'VCL Style'
  end
  object Label1: TLabel
    Left = 16
    Top = 245
    Width = 17
    Height = 13
    Caption = 'Log'
  end
  object lblSearchIndicatorHelp: TLabel
    Left = 164
    Top = 64
    Width = 196
    Height = 65
    AutoSize = False
    Caption = 'Search Indicator Help'
    WordWrap = True
  end
  object grpSearchIndicator: TRadioGroup
    Left = 16
    Top = 56
    Width = 129
    Height = 73
    Caption = 'Search Indicator'
    ItemIndex = 0
    Items.Strings = (
      'sbiText'
      'sbiAudio')
    TabOrder = 1
    OnClick = grpSearchIndicatorClick
  end
  object cbxVclStyles: TComboBox
    Left = 164
    Top = 145
    Width = 196
    Height = 21
    Style = csDropDownList
    TabOrder = 3
    OnChange = cbxVclStylesChange
  end
  object lstLog: TListBox
    Left = 16
    Top = 264
    Width = 344
    Height = 141
    ItemHeight = 13
    TabOrder = 5
  end
  object chkEnabled: TCheckBox
    Left = 24
    Top = 148
    Width = 65
    Height = 17
    Caption = 'Enabled'
    Checked = True
    State = cbChecked
    TabOrder = 2
    OnClick = chkEnabledClick
  end
  object grpBiDiMode: TRadioGroup
    Left = 16
    Top = 182
    Width = 344
    Height = 51
    Caption = 'BiDiMode'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'bdLeftToRight'
      'bdRightToLeft')
    TabOrder = 4
    OnClick = grpBiDiModeClick
  end
  object SB: TSearchBox
    Left = 16
    Top = 16
    Width = 344
    Height = 21
    TabOrder = 0
    OnInvokeSearch = SBInvokeSearch
  end
end
