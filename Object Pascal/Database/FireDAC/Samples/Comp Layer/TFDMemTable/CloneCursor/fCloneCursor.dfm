inherited frmCloneCursor: TfrmCloneCursor
  Left = 267
  Top = 151
  Caption = 'CloneCursor'
  ClientHeight = 492
  ClientWidth = 687
  Font.Name = 'MS Sans Serif'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 687
    inherited bvlTitle: TBevel
      Width = 629
    end
    inherited imgAnyDAC: TImage
      Left = 629
    end
    inherited lblTitle: TLabel
      Width = 133
      Caption = 'Clone Cursor'
    end
  end
  inherited pnlMain: TPanel
    Width = 687
    Height = 383
    inherited pnlConnection: TPanel
      Width = 687
      Height = 40
      TabOrder = 1
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
      object mmHint: TMemo
        Left = 175
        Top = 0
        Width = 512
        Height = 40
        Align = alRight
        Color = clInfoBk
        Lines.Strings = (
          
            'The following example uses a cloned dataset to determine whether' +
            ' the current record is within'
          
            'a specified range. Using the cloned dataset the application may ' +
            'have few "views" of the same data.'
          '')
        ReadOnly = True
        TabOrder = 1
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 40
      Width = 687
      Height = 343
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Splitter1: TSplitter
        Left = 353
        Top = 40
        Height = 303
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 40
        Width = 353
        Height = 303
        Align = alLeft
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object DBGrid2: TDBGrid
        Left = 356
        Top = 40
        Width = 331
        Height = 303
        Align = alClient
        DataSource = DataSource2
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 687
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 2
        object btnClone: TButton
          Left = 6
          Top = 8
          Width = 76
          Height = 25
          Caption = 'CloneCursor'
          TabOrder = 2
          OnClick = btnCloneClick
        end
        object btnCheck: TButton
          Left = 87
          Top = 8
          Width = 76
          Height = 25
          Caption = 'CheckRange'
          TabOrder = 3
          OnClick = btnCheckClick
        end
        object btnCancelRange: TButton
          Left = 168
          Top = 8
          Width = 76
          Height = 25
          Caption = 'CancelRange'
          TabOrder = 4
          OnClick = btnCancelRangeClick
        end
        object edtEnd: TLabeledEdit
          Left = 535
          Top = 10
          Width = 75
          Height = 21
          EditLabel.Width = 98
          EditLabel.Height = 13
          EditLabel.Caption = 'End range (OrderID):'
          LabelPosition = lpLeft
          TabOrder = 1
        end
        object edtStart: TLabeledEdit
          Left = 353
          Top = 10
          Width = 75
          Height = 21
          EditLabel.Width = 101
          EditLabel.Height = 13
          EditLabel.Caption = 'Start range (OrderID):'
          LabelPosition = lpLeft
          TabOrder = 0
        end
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 436
    Width = 687
    inherited bvlButtons: TBevel
      Width = 687
    end
    inherited btnClose: TButton
      Left = 608
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 473
    Width = 687
  end
  object cdsOrders: TFDMemTable
    CachedUpdates = True
    IndexFieldNames = 'ORDERID'
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Adapter = FDTableAdapter1
    Left = 88
    Top = 200
  end
  object DataSource1: TDataSource
    DataSet = cdsOrders
    Left = 120
    Top = 200
  end
  object cdsClone: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 440
    Top = 200
  end
  object DataSource2: TDataSource
    DataSet = cdsClone
    Left = 472
    Top = 200
  end
  object FDTableAdapter1: TFDTableAdapter
    SelectCommand = FDCommand1
    Left = 57
    Top = 200
  end
  object FDCommand1: TFDCommand
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    CommandText.Strings = (
      'select * from {id Orders}')
    Left = 88
    Top = 234
  end
end
