inherited frmTableAdapter: TfrmTableAdapter
  Left = 361
  Top = 207
  Width = 554
  Height = 406
  Caption = 'Table Adapter'
  Font.Name = 'MS Sans Serif'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 546
    inherited bvlTitle: TBevel
      Width = 488
    end
    inherited imgAnyDAC: TImage
      Left = 488
    end
    inherited lblTitle: TLabel
      Width = 146
      Caption = 'Table Adapter'
    end
  end
  inherited pnlMain: TPanel
    Width = 546
    Height = 263
    inherited pnlConnection: TPanel
      Width = 546
      Height = 47
      TabOrder = 2
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 77
      Width = 536
      Height = 182
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object DBNavigator1: TDBNavigator
      Left = 5
      Top = 47
      Width = 290
      Height = 25
      DataSource = DataSource1
      Flat = True
      TabOrder = 1
    end
  end
  inherited pnlButtons: TPanel
    Top = 316
    Width = 546
    inherited bvlButtons: TBevel
      Width = 546
    end
    inherited btnClose: TButton
      Left = 467
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 353
    Width = 546
  end
  object adOrders: TFDTableAdapter
    SelectCommand = cmSelect
    InsertCommand = cmInsert
    UpdateCommand = cmUpdate
    DeleteCommand = cmDelete
    Left = 288
    Top = 184
  end
  object cmSelect: TFDCommand
    Connection = dmlMainComp.dbMain
    Left = 248
    Top = 217
  end
  object cmDelete: TFDCommand
    Connection = dmlMainComp.dbMain
    Left = 288
    Top = 217
  end
  object cmUpdate: TFDCommand
    Connection = dmlMainComp.dbMain
    Left = 328
    Top = 217
  end
  object cmInsert: TFDCommand
    Connection = dmlMainComp.dbMain
    Left = 368
    Top = 217
  end
  object cdsOrders: TFDMemTable
    Indexes = <
      item
        Active = True
        Selected = True
        Name = 'OrderID'
        Fields = 'OrderID'
      end>
    IndexFieldNames = 'OrderID'
    Adapter = adOrders
    Left = 328
    Top = 184
  end
  object DataSource1: TDataSource
    DataSet = cdsOrders
    Left = 368
    Top = 184
  end
end
