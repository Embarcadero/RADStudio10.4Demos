inherited frmMacros: TfrmMacros
  Left = 383
  Top = 252
  Width = 599
  Height = 574
  Caption = 'Macros and Params'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 591
    inherited bvlTitle: TBevel
      Width = 533
    end
    inherited imgAnyDAC: TImage
      Left = 533
    end
    inherited lblTitle: TLabel
      Width = 207
      Caption = 'Macros and Params'
    end
  end
  inherited pnlMain: TPanel
    Width = 591
    Height = 450
    inherited pnlConnection: TPanel
      Width = 591
      Height = 225
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
      object lblDataType: TLabel [1]
        Left = 7
        Top = 175
        Width = 50
        Height = 13
        Alignment = taRightJustify
        Caption = 'DataType:'
      end
      object btnFetch: TButton [2]
        Left = 162
        Top = 16
        Width = 76
        Height = 25
        Caption = 'Fetch'
        Enabled = False
        TabOrder = 5
        OnClick = btnFetchClick
      end
      inherited cbDB: TComboBox
        TabOrder = 4
      end
      object mmComment: TMemo
        Left = 283
        Top = 47
        Width = 302
        Height = 119
        Color = clInfoBk
        Lines.Strings = (
          'By using this feature of IFDPhysCommand, you can easy '
          'modify your SQL query. First, you create a template of '
          'query, and then substitute into it the needed values. For '
          'example, you can change values of macros in this form: try '
          'change '#39'Address'#39' to '#39'FirstName'#39' and click '#39'Fetch'#39'. Also you '
          'can change DataType of macros'#39's value and MacroType. ')
        ReadOnly = True
        TabOrder = 3
      end
      object lstMacros: TValueListEditor
        Left = 6
        Top = 47
        Width = 272
        Height = 119
        DisplayOptions = [doColumnTitles, doKeyColFixed]
        Enabled = False
        ScrollBars = ssNone
        Strings.Strings = (
          'Column='
          'Tab='
          'Id='
          'Sign='
          'IdValue=')
        TabOrder = 0
        TitleCaptions.Strings = (
          'Macros'
          'Value')
        OnSelectCell = lstMacrosSelectCell
        OnSetEditText = lstMacrosSetEditText
        ColWidths = (
          62
          214)
      end
      object mmSQL: TMemo
        Left = 6
        Top = 199
        Width = 579
        Height = 25
        Anchors = [akLeft, akRight, akBottom]
        Color = clInfoBk
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 1
      end
      object cbDataType: TComboBox
        Left = 65
        Top = 172
        Width = 137
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
        TabOrder = 2
        OnChange = cbDataTypeChange
        Items.Strings = (
          'mdUnknown'
          'mdString'
          'mdIdentifier'
          'mdInteger'
          'mdBoolean'
          'mdFloat'
          'mdDate'
          'mdTime'
          'mdDateTime'
          'mdRaw')
      end
    end
    inherited Console: TMemo
      Top = 229
      Width = 580
      Height = 214
    end
  end
  inherited pnlButtons: TPanel
    Top = 503
    Width = 591
    inherited bvlButtons: TBevel
      Width = 591
    end
    inherited btnClose: TButton
      Left = 512
    end
  end
end
