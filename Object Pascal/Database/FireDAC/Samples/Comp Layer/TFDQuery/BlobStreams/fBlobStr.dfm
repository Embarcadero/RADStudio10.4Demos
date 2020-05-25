object frmBlobStr: TfrmBlobStr
  Left = 0
  Top = 0
  Caption = 'frmBlobStr'
  ClientHeight = 409
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    472
    409)
  PixelsPerInch = 96
  TextHeight = 13
  object btnInsertExternal: TButton
    Left = 94
    Top = 8
    Width = 131
    Height = 25
    Caption = 'Insert (external stream)'
    TabOrder = 0
    OnClick = btnInsertExternalClick
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 39
    Width = 456
    Height = 218
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataField = 'blobdata'
    DataSource = DataSource1
    TabOrder = 1
  end
  object btnInsertInternal: TButton
    Left = 231
    Top = 8
    Width = 130
    Height = 25
    Caption = 'Insert (internal stream)'
    TabOrder = 2
    OnClick = btnInsertInternalClick
  end
  object btnPrepare: TButton
    Left = 8
    Top = 8
    Width = 80
    Height = 25
    Caption = 'Prepare data'
    TabOrder = 3
    OnClick = btnPrepareClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 264
    Width = 456
    Height = 137
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 4
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 400
    Top = 112
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 304
    Top = 168
  end
  object FDPhysADSDriverLink1: TFDPhysADSDriverLink
    Left = 352
    Top = 112
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 352
    Top = 168
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 256
    Top = 112
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 304
    Top = 112
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 256
    Top = 168
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_Demo')
    Left = 40
    Top = 64
  end
  object qInsert: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'insert into {id FDQA_Blob} (blobdata) values (:blobdata)')
    Left = 104
    Top = 61
    ParamData = <
      item
        Name = 'BLOBDATA'
        DataType = ftBlob
        ParamType = ptInput
        Value = Null
      end>
  end
  object qSelect: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from {id FDQA_Blob}')
    Left = 168
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = qSelect
    Left = 168
    Top = 120
  end
end
