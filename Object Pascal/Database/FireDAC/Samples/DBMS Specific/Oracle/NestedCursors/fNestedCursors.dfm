object frmNestedCursors: TfrmNestedCursors
  Left = 335
  Top = 154
  Caption = 'Nested Cursors'
  ClientHeight = 605
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 33
    Width = 312
    Height = 176
    Align = alTop
    DataSource = DataSource1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 209
    Width = 312
    Height = 396
    Align = alClient
    DataSource = DataSource2
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 312
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    object btnOpenClose: TButton
      Left = 2
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Open/Close'
      TabOrder = 0
      OnClick = btnOpenCloseClick
    end
    object btnPrepUnprep: TButton
      Left = 83
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Prep/Unprep'
      TabOrder = 1
      OnClick = btnPrepUnprepClick
    end
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    SQL.Strings = (

        'select CURSOR(select p.* from "Products" p WHERE p.categoryid = ' +
        'c.categoryid) as crs, c.categoryid '
      'from "Categories" c'
      'order by c.categoryid')
    Left = 200
    Top = 272
    object FDQuery1CRS: TDataSetField
      FieldName = 'CRS'
      ReadOnly = True
    end
    object FDQuery1CATEGORYID: TBCDField
      FieldName = 'CATEGORYID'
      Origin = 'CATEGORYID'
      Required = True
      Precision = 10
      Size = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 232
    Top = 272
  end
  object FDMemTable1: TFDMemTable
    DataSetField = FDQuery1CRS
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    Left = 200
    Top = 312
  end
  object DataSource2: TDataSource
    DataSet = FDMemTable1
    Left = 232
    Top = 312
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=Oracle_Demo')
    Left = 168
    Top = 272
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    ScreenCursor = gcrHourGlass
    Left = 168
    Top = 424
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 200
    Top = 424
  end
end
