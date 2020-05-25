inherited frmMain: TfrmMain
  Left = 419
  Top = 175
  Caption = 'TFDBatchMove'
  ClientHeight = 503
  ClientWidth = 526
  Font.Name = 'MS Sans Serif'
  ExplicitWidth = 542
  ExplicitHeight = 541
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 526
    ExplicitWidth = 526
    inherited bvlTitle: TBevel
      Width = 468
      ExplicitWidth = 473
    end
    inherited imgAnyDAC: TImage
      Left = 468
      ExplicitLeft = 473
    end
    inherited lblTitle: TLabel
      Width = 133
      Caption = 'Moving Data'
      ExplicitWidth = 133
    end
  end
  inherited pnlMain: TPanel
    Width = 526
    Height = 394
    ExplicitWidth = 526
    ExplicitHeight = 394
    object Splitter1: TSplitter [0]
      Left = 0
      Top = 227
      Width = 526
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitWidth = 531
    end
    inherited pnlConnection: TPanel
      Width = 526
      ExplicitWidth = 526
      inherited lblUseConnectionDef: TLabel
        Width = 126
        ExplicitWidth = 126
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 57
      Width = 526
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object btnTabToASCMove: TButton
        Left = 6
        Top = 0
        Width = 130
        Height = 23
        Caption = '1.) Move text to table'
        Enabled = False
        TabOrder = 0
        OnClick = btnASCToTabMoveClick
      end
      object btnASCToTabMove: TButton
        Left = 147
        Top = 0
        Width = 130
        Height = 23
        Caption = '2.) Move table to table'
        Enabled = False
        TabOrder = 1
        OnClick = btnTabToTabMoveClick
      end
      object btnTabToTabMove: TButton
        Left = 288
        Top = 0
        Width = 130
        Height = 23
        Caption = '3.) Move table to text'
        Enabled = False
        TabOrder = 2
        OnClick = btnTabToASCMoveClick
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 83
      Width = 526
      Height = 24
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '   Loaded data'
      TabOrder = 2
    end
    object grdLoaded: TDBGrid
      Left = 0
      Top = 107
      Width = 526
      Height = 120
      Align = alTop
      DataSource = dsLoaded
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object Panel3: TPanel
      Left = 0
      Top = 230
      Width = 526
      Height = 24
      Align = alTop
      Alignment = taLeftJustify
      Caption = '   Moved data'
      TabOrder = 4
    end
    object grdMoved: TDBGrid
      Left = 0
      Top = 254
      Width = 526
      Height = 140
      Align = alClient
      DataSource = dsMoved
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  inherited pnlButtons: TPanel
    Top = 447
    Width = 526
    ExplicitTop = 447
    ExplicitWidth = 526
    inherited bvlButtons: TBevel
      Width = 526
      ExplicitWidth = 531
    end
    inherited lblInfo: TLabel
      Hint = 
        'http://docwiki.embarcadero.com/CodeExamples/en/TFDBatchMove_' +
        'Sample'
    end
    inherited btnClose: TButton
      Left = 439
      Top = 6
      ExplicitLeft = 439
      ExplicitTop = 6
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 484
    Width = 526
    ExplicitTop = 484
    ExplicitWidth = 526
  end
  object FDBatchMove: TFDBatchMove
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 376
    Top = 192
  end
  object qryMoved: TFDQuery
    Connection = dmlMainComp.dbMain
    SQL.Strings = (
      'select * from {id FDQA_LockTable}')
    Left = 444
    Top = 248
  end
  object qryLoaded: TFDQuery
    Connection = dmlMainComp.dbMain
    SQL.Strings = (
      'select * from {id FDQA_TransTable}')
    Left = 444
    Top = 192
  end
  object dsMoved: TDataSource
    DataSet = qryMoved
    Left = 480
    Top = 248
  end
  object dsLoaded: TDataSource
    DataSet = qryLoaded
    Left = 480
    Top = 192
  end
end
