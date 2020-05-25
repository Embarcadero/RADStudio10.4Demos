inherited frmNextRecordset: TfrmNextRecordset
  Left = 357
  Top = 242
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Oracle Stored procedures - Next recordset'
  ClientHeight = 525
  ClientWidth = 584
  Font.Charset = RUSSIAN_CHARSET
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 584
    inherited bvlTitle: TBevel
      Width = 526
    end
    inherited imgAnyDAC: TImage
      Left = 526
    end
    inherited lblTitle: TLabel
      Width = 191
      Caption = 'Stored procedures'
    end
  end
  inherited pnlMain: TPanel
    Width = 584
    Height = 416
    object Label1: TLabel [0]
      Left = 11
      Top = 272
      Width = 20
      Height = 13
      Caption = 'pin1'
    end
    object Label2: TLabel [1]
      Left = 11
      Top = 296
      Width = 20
      Height = 13
      Caption = 'pin2'
    end
    object Label3: TLabel [2]
      Left = 11
      Top = 359
      Width = 28
      Height = 13
      Caption = 'pout1'
    end
    object Label4: TLabel [3]
      Left = 11
      Top = 383
      Width = 28
      Height = 13
      Caption = 'pout2'
    end
    object Label5: TLabel [4]
      Left = 0
      Top = 29
      Width = 268
      Height = 13
      Caption = ' Result of fetching from DEMO_TESTPRC.REFCRS'
      Color = clBackground
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label6: TLabel [5]
      Left = 0
      Top = 248
      Width = 584
      Height = 13
      Align = alTop
      Caption = ' Input / output parameters of DEMO_TESTPRC.INOUTPARS'
      Color = clSkyBlue
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label7: TLabel [6]
      Left = 0
      Top = 57
      Width = 584
      Height = 13
      Align = alTop
      Caption = ' Cursor parameters of DEMO_TESTPRC.REFCRS'
      Color = clSkyBlue
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    inherited pnlConnection: TPanel
      Width = 584
      TabOrder = 7
      inherited cbDB: TComboBox
        Enabled = False
      end
      object Memo1: TMemo
        Left = 232
        Top = 8
        Width = 347
        Height = 42
        Color = clInfoBk
        Lines.Strings = (
          'For cursor parameters, as for multiple result sets, you should'
          'set FetchOptions.AutoClose to False.')
        ReadOnly = True
        TabOrder = 1
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 106
      Width = 584
      Height = 142
      Align = alTop
      DataSource = dsRefCrs
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object edtPin1: TEdit
      Left = 44
      Top = 269
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '10'
    end
    object edtPin2: TEdit
      Left = 44
      Top = 293
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'qq'
    end
    object edtPout1: TEdit
      Left = 44
      Top = 356
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object edtPout2: TEdit
      Left = 44
      Top = 380
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object btnExecProc: TButton
      Left = 44
      Top = 322
      Width = 75
      Height = 25
      Caption = 'ExecProc'
      TabOrder = 5
      OnClick = btnExecProcClick
    end
    object Panel1: TPanel
      Left = 0
      Top = 70
      Width = 584
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 6
      object btnReopen: TButton
        Left = 5
        Top = 6
        Width = 49
        Height = 25
        Caption = 'Reopen'
        TabOrder = 0
        OnClick = btnReopenClick
      end
      object btnNextRS: TButton
        Left = 60
        Top = 6
        Width = 94
        Height = 25
        Caption = 'Next record set'
        TabOrder = 1
        OnClick = btnNextRSClick
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 469
    Width = 584
    inherited bvlButtons: TBevel
      Width = 584
    end
    inherited btnClose: TButton
      Left = 505
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 506
    Width = 584
  end
  object spRefCrs: TFDStoredProc
    Connection = dmlMainComp.dbMain
    FetchOptions.AutoClose = False
    PackageName = 'DEMO_TESTPRC'
    StoredProcName = 'REFCRS'
    Left = 248
    Top = 197
  end
  object dsRefCrs: TDataSource
    DataSet = spRefCrs
    Left = 280
    Top = 197
  end
  object spInOutPars: TFDStoredProc
    Connection = dmlMainComp.dbMain
    PackageName = 'DEMO_TESTPRC'
    StoredProcName = 'INOUTPARS'
    Left = 248
    Top = 245
  end
end
