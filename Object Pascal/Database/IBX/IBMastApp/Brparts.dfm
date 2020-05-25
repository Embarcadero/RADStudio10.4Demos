object BrPartsForm: TBrPartsForm
  Left = 229
  Top = 151
  HelpContext = 4
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Browse Parts'
  ClientHeight = 350
  ClientWidth = 576
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 576
    Height = 58
    HelpContext = 4
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 0
    object ActivateBtn: TSpeedButton
      Left = 463
      Top = 5
      Width = 98
      Height = 41
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Backorders'
      OnClick = ActivateQuery
    end
    object Bevel1: TBevel
      Left = 3
      Top = 53
      Width = 570
      Height = 2
      Align = alBottom
      Shape = bsTopLine
      ExplicitTop = 32
      ExplicitWidth = 378
    end
    object Navigator: TDBNavigator
      Left = 8
      Top = 4
      Width = 190
      Height = 41
      DataSource = MastData.PartsSource
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Kind = dbnHorizontal
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object EditBtn: TButton
      Left = 370
      Top = 5
      Width = 87
      Height = 41
      Caption = '&Edit'
      ModalResult = 1
      TabOrder = 1
      OnClick = EditBtnClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 304
    Width = 576
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object CloseBtn: TButton
      Left = 487
      Top = 6
      Width = 74
      Height = 34
      Cancel = True
      Caption = '&Close'
      Default = True
      ModalResult = 2
      TabOrder = 0
      OnClick = CloseBtnClick
    end
  end
  object PartsGrid: TDBGrid
    Left = 0
    Top = 58
    Width = 576
    Height = 246
    Align = alClient
    DataSource = MastData.PartsSource
    Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = EditBtnClick
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
        Title.Caption = 'OnOrder'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BACKORD'
        Title.Caption = 'Back Ord'
        Visible = True
      end>
  end
end
