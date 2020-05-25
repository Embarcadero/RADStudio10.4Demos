object SearchDlg: TSearchDlg
  Left = 226
  Top = 118
  ActiveControl = DBGrid1
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'SearchDlg'
  ClientHeight = 337
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 10
    Top = 13
    Width = 91
    Height = 19
    Alignment = taRightJustify
    Caption = 'Search Field:'
  end
  object Label2: TLabel
    Left = 10
    Top = 42
    Width = 89
    Height = 19
    Alignment = taRightJustify
    Caption = 'Search Text:'
  end
  object SearchButton: TSpeedButton
    Left = 408
    Top = 42
    Width = 38
    Height = 28
    Hint = 'Search'
    Enabled = False
    Glyph.Data = {
      CA010000424DCA01000000000000760000002800000022000000110000000100
      04000000000054010000CE0E0000D80E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FBFFF
      FFFFF3333333333333333300000033333333FBBFFFFBF3333333333333333300
      00003333333FBFFFFBFFF333333333333333330000003333333FBFFFFBFBF333
      3333333333333300000033333333FBBFFFFFF333333333333333330000003333
      333444FBFFFBF3333333888333333300000033333344834FBFFFF33333388738
      333333000000333334847F84BFFFF33333878737833333000000333334484F84
      FBBFB333338878378333330000003333348F74483FF3F3333387338873333300
      0000333344FFF743333333333883333833333300000033448F84443333333338
      873388873333330000003448F74333333333338873387773333333000000348F
      77333333333333873337333333333300000034F7743333333333338333873333
      3333330000003444433333333333338888733333333333000000333333333333
      3333333333333333333333000000}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = SearchButtonClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 80
    Width = 438
    Height = 204
    DataSource = DataSource
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PARTNO'
        Title.Caption = 'Part No'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Caption = 'Description'
        Width = 181
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENDORNO'
        Title.Caption = 'Vendor No'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ONHAND'
        Title.Caption = 'Onhand'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ONORDER'
        Title.Caption = 'Onorder'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BACKORD'
        Title.Caption = 'Back ord'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COST'
        Title.Caption = 'Cost'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LISTPRICE'
        Title.Caption = 'List Price'
        Visible = True
      end>
  end
  object SearchEd: TEdit
    Left = 105
    Top = 42
    Width = 297
    Height = 27
    TabOrder = 1
    OnChange = SearchEdChange
    OnKeyPress = SearchEdKeyPress
  end
  object OrderCombo: TComboBox
    Left = 105
    Top = 8
    Width = 341
    Height = 27
    Style = csDropDownList
    TabOrder = 0
    OnChange = OrderComboChange
  end
  object BitBtn2: TBitBtn
    Left = 361
    Top = 294
    Width = 85
    Height = 35
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 270
    Top = 294
    Width = 85
    Height = 35
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
  end
  object DataSource: TDataSource
    DataSet = MastData.Parts
    Left = 47
    Top = 253
  end
end
