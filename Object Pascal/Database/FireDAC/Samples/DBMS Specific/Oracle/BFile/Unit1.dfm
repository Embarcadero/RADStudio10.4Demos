object Form1: TForm1
  Left = 312
  Top = 131
  Caption = 'Form1'
  ClientHeight = 506
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 201
    Width = 15
    Height = 13
    Caption = 'F1:'
  end
  object Label2: TLabel
    Left = 8
    Top = 225
    Width = 15
    Height = 13
    Caption = 'F2:'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 603
    Height = 153
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 8
    Top = 167
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBImage1: TDBImage
    Left = 29
    Top = 225
    Width = 393
    Height = 273
    DataField = 'F2'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit1: TDBEdit
    Left = 29
    Top = 198
    Width = 121
    Height = 21
    DataField = 'F1'
    DataSource = DataSource1
    TabOrder = 3
  end
  object CheckBox1: TCheckBox
    Left = 94
    Top = 171
    Width = 97
    Height = 17
    Caption = 'Show image'
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnClick = CheckBox1Click
  end
  object DBEdit2: TDBEdit
    Left = 428
    Top = 225
    Width = 121
    Height = 21
    DataField = 'F2'
    TabOrder = 5
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=Oracle_Demo')
    Connected = True
    Left = 24
    Top = 8
  end
  object FDQuery1: TFDQuery
    AfterOpen = FDQuery1AfterOpen
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    SQL.Strings = (
      'SELECT * FROM FD_TESTBFILE')
    Left = 56
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 88
    Top = 8
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 24
    Top = 64
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    ScreenCursor = gcrHourGlass
    Left = 72
    Top = 64
  end
end
