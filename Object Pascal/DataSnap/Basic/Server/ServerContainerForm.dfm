object Form8: TForm8
  Left = 0
  Top = 0
  Caption = 'DataSnap Test Server'
  ClientHeight = 305
  ClientWidth = 546
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  DesignSize = (
    546
    305)
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 6
    Top = 6
    Width = 122
    Height = 18
    Caption = 'Active Connections'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 6
    Top = 119
    Width = 65
    Height = 18
    Caption = 'Event Log'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 6
    Top = 26
    Width = 534
    Height = 83
    Anchors = [akLeft, akTop, akRight]
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -10
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UserName'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ServerConnection'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Info'
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 6
    Top = 140
    Width = 534
    Height = 90
    Anchors = [akLeft, akRight]
    DataSource = DataSource2
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -10
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DSServer1: TDSServer
    OnConnect = DSServer1Connect
    OnDisconnect = DSServer1Disconnect
    Left = 8
    Top = 368
  end
  object DSTCPServerTransport1: TDSTCPServerTransport
    PoolSize = 0
    Server = DSServer1
    Filters = <>
    Left = 40
    Top = 368
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 72
    Top = 368
  end
  object ActiveConnections: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'UserName'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'ServerConnection'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'Info'
        DataType = ftString
        Size = 128
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 688
    Data = {
      800000009619E0BD010000001800000004000000000003000000800002494404
      0001000000000008557365724E616D6501004900000001000557494454480200
      0200200010536572766572436F6E6E656374696F6E0100490000000100055749
      44544802000200800004496E666F010049000000010005574944544802000200
      80000000}
  end
  object DataSource1: TDataSource
    DataSet = ActiveConnections
    Left = 656
  end
  object EventLog: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EventName'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Time'
        DataType = ftTimeStamp
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 688
    Top = 152
    Data = {
      5D0000009619E0BD0200000018000000020000000000030000005D0009457665
      6E744E616D6501004900000001000557494454480200020014000454696D6510
      001100000001000753554254595045020049000A00466F726D61747465640000
      00}
  end
  object DataSource2: TDataSource
    DataSet = EventLog
    Left = 656
    Top = 152
  end
  object DSServerClass2: TDSServerClass
    OnGetClass = DSServerClass2GetClass
    Server = DSServer1
    Left = 104
    Top = 368
  end
  object DSServerClass3: TDSServerClass
    OnGetClass = DSServerClass3GetClass
    Server = DSServer1
    Left = 136
    Top = 368
  end
end
