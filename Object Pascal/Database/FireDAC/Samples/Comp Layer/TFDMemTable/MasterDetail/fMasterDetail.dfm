inherited frmMasterDetail: TfrmMasterDetail
  Left = 368
  Top = 200
  Width = 565
  Height = 559
  Caption = 'Master Details'
  Font.Name = 'MS Sans Serif'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 557
    inherited bvlTitle: TBevel
      Width = 499
    end
    inherited imgAnyDAC: TImage
      Left = 499
    end
    inherited lblTitle: TLabel
      Width = 152
      Caption = 'Master Details'
    end
  end
  inherited pnlMain: TPanel
    Width = 557
    Height = 416
    inherited pnlConnection: TPanel
      Width = 557
      Height = 45
      TabOrder = 2
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
    end
    object pblGrids: TPanel
      Left = 0
      Top = 72
      Width = 557
      Height = 344
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 5
      TabOrder = 0
      object Splitter1: TSplitter
        Left = 5
        Top = 199
        Width = 547
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object DBGrid1: TDBGrid
        Left = 5
        Top = 5
        Width = 547
        Height = 194
        Align = alTop
        DataSource = dsOrders
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object DBGrid2: TDBGrid
        Left = 5
        Top = 202
        Width = 547
        Height = 137
        Align = alClient
        DataSource = dsOrdDetails
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object pnlFetchOnDemand: TPanel
      Left = 0
      Top = 45
      Width = 557
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object chbFetchOnDemand: TCheckBox
        Left = 6
        Top = 6
        Width = 110
        Height = 17
        Caption = 'Fetch On Demand'
        TabOrder = 0
        OnClick = chbFetchOnDemandClick
      end
      object Button1: TButton
        Left = 120
        Top = 1
        Width = 75
        Height = 25
        Caption = 'Apply updates'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 201
        Top = 1
        Width = 96
        Height = 25
        Caption = 'Cancel updates'
        TabOrder = 2
        OnClick = Button2Click
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 469
    Width = 557
    inherited bvlButtons: TBevel
      Width = 557
    end
    inherited btnClose: TButton
      Left = 478
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 506
    Width = 557
  end
  object cdsOrders: TFDMemTable
    Adapter = adOrders
    Left = 448
    Top = 136
  end
  object cdsOrdDetails: TFDMemTable
    IndexFieldNames = 'OrderID'
    MasterSource = dsOrders
    MasterFields = 'OrderID'
    Adapter = adOrderDetails
    Left = 448
    Top = 333
  end
  object dsOrders: TDataSource
    DataSet = cdsOrders
    Left = 480
    Top = 136
  end
  object dsOrdDetails: TDataSource
    DataSet = cdsOrdDetails
    Left = 480
    Top = 333
  end
  object adOrders: TFDTableAdapter
    SelectCommand = cmOrders
    Left = 412
    Top = 136
  end
  object adOrderDetails: TFDTableAdapter
    SelectCommand = cmOrderDetails
    Left = 412
    Top = 333
  end
  object cmOrders: TFDCommand
    Connection = dmlMainComp.dbMain
    CommandText.Strings = (
      'select * from {id Orders}')
    Left = 448
    Top = 171
  end
  object cmOrderDetails: TFDCommand
    Connection = dmlMainComp.dbMain
    CommandText.Strings = (
      'select * from {id Order Details}')
    Left = 448
    Top = 370
  end
end
