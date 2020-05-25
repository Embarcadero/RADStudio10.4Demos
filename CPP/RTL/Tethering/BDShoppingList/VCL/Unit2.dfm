object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'TetherBDTest'
  ClientHeight = 465
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 40
    Width = 25
    Height = 13
    Caption = 'Code'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 32
    Top = 80
    Width = 64
    Height = 13
    Caption = 'ProductName'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 32
    Top = 120
    Width = 26
    Height = 13
    Caption = 'Stock'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 32
    Top = 160
    Width = 60
    Height = 13
    Caption = 'MinimalStock'
    FocusControl = DBEdit4
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 287
    Width = 625
    Height = 178
    TabStop = False
    Align = alBottom
    DataSource = DsProducts
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBEdit1: TDBEdit
    Left = 32
    Top = 56
    Width = 134
    Height = 21
    TabStop = False
    DataField = 'Code'
    DataSource = DsProducts
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 32
    Top = 96
    Width = 521
    Height = 21
    DataField = 'ProductName'
    DataSource = DsProducts
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 32
    Top = 136
    Width = 134
    Height = 21
    DataField = 'Stock'
    DataSource = DsProducts
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 32
    Top = 176
    Width = 134
    Height = 21
    DataField = 'MinimalStock'
    DataSource = DsProducts
    TabOrder = 4
  end
  object DBNavigator1: TDBNavigator
    AlignWithMargins = True
    Left = 3
    Top = 259
    Width = 619
    Height = 25
    DataSource = DsProducts
    Align = alBottom
    TabOrder = 5
  end
  object CDSProducts: TClientDataSet
    PersistDataPacket.Data = {
      D80000009619E0BD010000001800000006000000000003000000D80004436F64
      65040001000200010007535542545950450200490008004175746F696E63000B
      50726F647563744E616D65010049000000010005574944544802000200140005
      53746F636B04000100000000000C4D696E696D616C53746F636B040001000000
      00000650496D61676501004900000001000557494454480200020014000A7072
      6F64756374496D6704004B000000010007535542545950450200490007004269
      6E6172790001000C4155544F494E4356414C55450400010001000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Code'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'ProductName'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Stock'
        DataType = ftInteger
      end
      item
        Name = 'MinimalStock'
        DataType = ftInteger
      end
      item
        Name = 'PImage'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'productImg'
        DataType = ftBlob
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterPost = CDSProductsAfterPost
    Left = 216
    Top = 20
    object CDSProductsCode: TAutoIncField
      FieldName = 'Code'
      ReadOnly = True
    end
    object CDSProductsProductName: TStringField
      FieldName = 'ProductName'
    end
    object CDSProductsStock: TIntegerField
      FieldName = 'Stock'
    end
    object CDSProductsMinimalStock: TIntegerField
      FieldName = 'MinimalStock'
    end
  end
  object TetherBDTest: TTetheringManager
    Password = 'TetherBDTest'
    Text = 'TetherBDTest'
    AllowedAdapters = 'Network_V4'
    Left = 512
    Top = 136
  end
  object TetherBDTestProfile: TTetheringAppProfile
    Manager = TetherBDTest
    Text = 'TetherBDTestProfile'
    Group = 'TetherBDTestGroup'
    Actions = <
      item
        Name = 'acGetList'
        IsPublic = True
        Action = actGetList
        NotifyUpdates = False
      end>
    Resources = <
      item
        Name = 'ResShoppingList'
        IsPublic = True
        OnResourceReceived = TetherBDTestProfileResources0ResourceReceived
      end>
    OnResourceReceived = TetherBDTestProfileResources0ResourceReceived
    Left = 504
    Top = 24
  end
  object DsProducts: TDataSource
    DataSet = CDSProducts
    Left = 296
    Top = 24
  end
  object ActionList1: TActionList
    Left = 432
    Top = 8
    object actGetList: TAction
      Caption = 'GetShoppingList'
      OnExecute = actGetListExecute
    end
  end
end
