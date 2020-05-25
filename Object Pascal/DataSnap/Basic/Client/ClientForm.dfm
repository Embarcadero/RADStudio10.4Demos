object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Form13'
  ClientHeight = 238
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object Button1: TButton
    Left = 18
    Top = 66
    Width = 151
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Test Provider'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 18
    Top = 6
    Width = 151
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Test ServerMethod Class'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 18
    Top = 36
    Width = 151
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Test ServerMethod Component'
    TabOrder = 2
    OnClick = Button3Click
  end
  object DBGrid1: TDBGrid
    Left = 18
    Top = 96
    Width = 451
    Height = 138
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -10
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'Datasnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DbxDataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=15.0.0.0,Culture=neutral,PublicKey' +
        'Token=a91a7c5705831a4f'
      'Filters={}')
    Left = 296
    Top = 8
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TDSServerModule2'
    SQLConnection = SQLConnection1
    Left = 296
    Top = 88
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CINT64'
        DataType = ftLargeint
      end
      item
        Name = 'CVARCHAR'
        DataType = ftWideString
        Size = 1
      end
      item
        Name = 'CSTREAM'
        DataType = ftBytes
        Size = 5000
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSnapTestData'
    RemoteServer = DSProviderConnection1
    StoreDefs = True
    Left = 336
    Top = 88
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 368
    Top = 88
  end
  object SqlServerMethod1: TSqlServerMethod
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'IncomingMessage'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'ReturnParameter'
        ParamType = ptResult
        Size = 2000
      end>
    SQLConnection = SQLConnection1
    ServerMethodName = 'TServerModule1.Hello'
    Left = 296
    Top = 48
  end
  object SQLConnection2: TSQLConnection
    DriverName = 'InterBase'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXInterbase'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXInterBaseDriver1' +
        '50.bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=15.0.0.0,Culture=neutral,PublicK' +
        'eyToken=a91a7c5705831a4f'
      
        'MetaDataPackageLoader=TDBXInterbaseMetaDataCommandFactory,DbxInt' +
        'erBaseDriver150.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXInterbaseMetaDataCommand' +
        'Factory,Borland.Data.DbxInterBaseDriver,Version=15.0.0.0,Culture' +
        '=neutral,PublicKeyToken=a91a7c5705831a4f'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxint.dll'
      'VendorLib=gds32.dll'
      
        'Database=C:\Users\Public\Documents\Embarcadero\Studio\19.0\Sampl' +
        'es\Data\employee.gdb'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'RoleName=RoleName'
      'ServerCharSet='
      'BlobSize=-1'
      'ErrorResourceFile='
      'Trim Char=False')
    Left = 512
    Top = 16
  end
end
