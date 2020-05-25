object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    635
    300)
  PixelsPerInch = 96
  TextHeight = 13
  object btnDelete: TButton
    Left = 386
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 0
    OnClick = btnDeleteClick
  end
  object btnUpload: TButton
    Left = 9
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Upload'
    TabOrder = 1
    OnClick = btnUploadClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 619
    Height = 252
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnDownloadExt: TButton
    Left = 88
    Top = 8
    Width = 145
    Height = 25
    Caption = 'Download (external stream)'
    TabOrder = 3
    OnClick = btnDownloadExtClick
  end
  object btnDownloadInt: TButton
    Left = 237
    Top = 8
    Width = 145
    Height = 25
    Caption = 'Download (internal stream)'
    TabOrder = 4
    OnClick = btnDownloadIntClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=FSTest'
      'ConnectionDef=MSSQL_Demo')
    Connected = True
    Left = 40
    Top = 72
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 48
    Top = 208
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 136
    Top = 208
  end
  object qSelect: TFDQuery
    Active = True
    Connection = FDConnection1
    UpdateObject = FDUpdateSQL1
    SQL.Strings = (
      'select id, name, data.PathName() as path, rowguid from FSTab')
    Left = 128
    Top = 72
    object qSelectid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qSelectname: TStringField
      DisplayWidth = 30
      FieldName = 'name'
      Origin = 'name'
      Required = True
      Size = 100
    end
    object qSelectpath: TWideStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 30
      FieldName = 'path'
      Origin = 'path'
      ProviderFlags = []
      ReadOnly = True
      Size = 4000
    end
    object qSelectrowguid: TGuidField
      FieldName = 'rowguid'
      Origin = 'rowguid'
      ReadOnly = True
      Size = 38
    end
  end
  object DataSource1: TDataSource
    DataSet = qSelect
    Left = 128
    Top = 128
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = FDConnection1
    InsertSQL.Strings = (
      
        'INSERT INTO FSTab (name, data) VALUES (:NEW_name, CAST('#39'x'#39' AS VA' +
        'RBINARY(MAX)));'
      'SELECT SCOPE_IDENTITY() AS id, data.PathName() AS path, rowguid'
      'FROM FSTab WHERE id = SCOPE_IDENTITY()')
    ModifySQL.Strings = (
      'UPDATE FSTab SET name = :NEW_name WHERE id = :OLD_id')
    DeleteSQL.Strings = (
      'DELETE FROM FSTab WHERE id = :OLD_id')
    FetchRowSQL.Strings = (
      'SELECT id, name, data.PathName() AS path, rowguid'
      'FROM FSTab WHERE id = :OLD_id')
    Left = 208
    Top = 72
  end
  object OpenDialog1: TOpenDialog
    Left = 352
    Top = 160
  end
  object SaveDialog1: TSaveDialog
    Left = 464
    Top = 160
  end
  object qFileStream: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select :p = data.PathName()'
      'from FSTab'
      'where id = :id')
    Left = 296
    Top = 72
    ParamData = <
      item
        Name = 'P'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
