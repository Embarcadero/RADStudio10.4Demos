inherited frmMacros: TfrmMacros
  Left = 352
  Top = 92
  Width = 596
  Height = 656
  Caption = 'Macros using Demo'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 588
    inherited bvlTitle: TBevel
      Width = 530
    end
    inherited imgAnyDAC: TImage
      Left = 530
    end
    inherited lblTitle: TLabel
      Width = 76
      Caption = 'Macros'
    end
  end
  inherited pnlMain: TPanel
    Width = 588
    Height = 513
    inherited pnlConnection: TPanel
      Width = 588
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
    end
    inherited pnlSubPageControl: TPanel
      Width = 588
      Height = 454
      inherited pcMain: TPageControl
        Width = 588
        Height = 453
        ActivePage = tsData
        inherited tsData: TTabSheet
          object Bevel1: TBevel
            Left = 0
            Top = 169
            Width = 580
            Height = 4
            Align = alTop
            Shape = bsTopLine
          end
          object DBGrid1: TDBGrid
            Left = 0
            Top = 207
            Width = 579
            Height = 213
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = DataSource1
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
          end
          object mmSQL: TMemo
            Left = 0
            Top = 177
            Width = 578
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Lines.Strings = (
              '')
            ReadOnly = True
            TabOrder = 3
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 580
            Height = 129
            Align = alTop
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            object mmComment: TMemo
              Left = 300
              Top = 0
              Width = 280
              Height = 129
              Align = alRight
              Color = clInfoBk
              Lines.Strings = (
                'The Macros allows you to parameterize parts of SQL '
                'query, where RDBMS prohibits parameter usage. '
                'Macro values are substituted in place of their names '
                'in SQL text at Prepare call, so RDBMS does not see '
                'Macros. Change macro values and DataType, then '
                'click '#39'Open Query'#39'.'
                '')
              ReadOnly = True
              TabOrder = 1
            end
            object lstMacros: TValueListEditor
              Left = 0
              Top = 0
              Width = 296
              Height = 129
              Align = alLeft
              Anchors = [akLeft, akTop, akRight, akBottom]
              DisplayOptions = [doColumnTitles, doKeyColFixed]
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
          end
          object Panel2: TPanel
            Left = 0
            Top = 129
            Width = 580
            Height = 40
            Align = alTop
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 2
            object lblDataType: TLabel
              Left = 0
              Top = 14
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'DataType:'
            end
            object btnOpenQuery: TButton
              Left = 197
              Top = 8
              Width = 76
              Height = 25
              Caption = 'Open Query'
              Enabled = False
              TabOrder = 1
              OnClick = btnOpenQueryClick
            end
            object cbDataType: TComboBox
              Left = 53
              Top = 10
              Width = 137
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              OnChange = cbDataTypeChange
              Items.Strings = (
                'mdUnknown '
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
        end
        inherited tsOptions: TTabSheet
          inherited FDGUIxFormsPanelTree1: TFDGUIxFormsPanelTree
            Width = 580
            Height = 381
            inherited frmUpdateOptions: TfrmFDGUIxFormsUpdateOptions
              Width = 576
              Height = 377
            end
            inherited frmResourceOptions: TfrmFDGUIxFormsResourceOptions
              Width = 576
              Height = 377
            end
            inherited frmFormatOptions: TfrmFDGUIxFormsFormatOptions
              Width = 576
              Height = 377
            end
            inherited frmFetchOptions: TfrmFDGUIxFormsFetchOptions
              Width = 576
              Height = 377
            end
          end
          inherited pnlDataSet: TPanel
            Width = 580
            inherited lblDataSet: TLabel
              Left = 7
              Width = 40
            end
          end
        end
      end
      inherited pnlMainSep: TPanel
        Width = 588
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 566
    Width = 588
    inherited bvlButtons: TBevel
      Width = 588
    end
    inherited btnClose: TButton
      Left = 518
      Width = 66
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 603
    Width = 588
  end
  object qryMain: TFDQuery
    Connection = dmlMainComp.dbMain
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    SQL.Strings = (
      'select !column from !tab where !id !Sign !idValue')
    Left = 112
    Top = 432
    MacroData = <
      item
        Value = 'ADDRESS'
        Name = 'COLUMN'
        DataType = mdIdentifier
      end
      item
        Value = 'Employees'
        Name = 'TAB'
        DataType = mdIdentifier
      end
      item
        Value = 'BIRTHDATE'
        Name = 'ID'
        DataType = mdIdentifier
      end
      item
        Value = '>'
        Name = 'Sign'
      end
      item
        Value = '1948-10-01'
        Name = 'IDVALUE'
        DataType = mdDate
      end>
  end
  object DataSource1: TDataSource
    DataSet = qryMain
    Left = 152
    Top = 432
  end
end
