object BrCustOrdForm: TBrCustOrdForm
  Left = 228
  Top = 191
  HelpContext = 1
  ActiveControl = CustGrid
  Caption = 'Orders By Customer'
  ClientHeight = 437
  ClientWidth = 624
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
  object CtrlsPanel: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object ActivateBtn: TSpeedButton
      Left = 488
      Top = 5
      Width = 127
      Height = 38
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Activate Query'
      OnClick = ActivateQuery
    end
    object DefineBtn: TSpeedButton
      Left = 352
      Top = 5
      Width = 130
      Height = 38
      AllowAllUp = True
      Caption = '&Define Query'
      OnClick = SetQuery
    end
    object Bevel1: TBevel
      Left = 0
      Top = 47
      Width = 624
      Height = 2
      Align = alBottom
      Shape = bsTopLine
      ExplicitTop = 34
      ExplicitWidth = 405
    end
    object Navigator: TDBNavigator
      Left = 8
      Top = 5
      Width = 190
      Height = 38
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Kind = dbnHorizontal
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object BtnPanel: TPanel
    Left = 0
    Top = 398
    Width = 624
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      624
      39)
    object EditBtn: TButton
      Left = 437
      Top = 1
      Width = 84
      Height = 34
      Anchors = [akTop, akRight]
      Caption = '&Edit'
      TabOrder = 0
      OnClick = EditBtnClick
    end
    object CloseBtn: TButton
      Left = 527
      Top = 1
      Width = 84
      Height = 34
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Close'
      Default = True
      TabOrder = 1
      OnClick = CloseBtnClick
    end
  end
  object CustPanel: TPanel
    Left = 0
    Top = 49
    Width = 624
    Height = 232
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      624
      232)
    object CustGrid: TDBGrid
      Left = 6
      Top = 3
      Width = 612
      Height = 223
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = MastData.CustMasterSrc
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -16
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = EditBtnClick
      OnEnter = CustGridEnter
      Columns = <
        item
          Expanded = False
          FieldName = 'CUSTNO'
          Title.Caption = 'Cust No'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMPANY'
          Title.Caption = 'Company'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PHONE'
          Title.Caption = 'Phone'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LASTINVOICEDATE'
          Title.Caption = 'Last Invoice'
          Width = 93
          Visible = True
        end>
    end
  end
  object OrdersPanel: TPanel
    Left = 0
    Top = 281
    Width = 624
    Height = 117
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      624
      117)
    object OrdersGrid: TDBGrid
      Left = 6
      Top = 3
      Width = 611
      Height = 111
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = MastData.OrdByCustSrc
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -16
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = EditBtnClick
      OnEnter = OrdersGridEnter
    end
  end
end
