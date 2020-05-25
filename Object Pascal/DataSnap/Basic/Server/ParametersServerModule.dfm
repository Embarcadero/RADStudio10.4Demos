object ParametersServerModule1: TParametersServerModule1
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  OnDestroy = DSServerModuleDestroy
  Height = 202
  Width = 271
  object SQLConnection1: TSQLConnection
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
    Left = 32
    Top = 24
  end
  object ReturnSqlQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from DATASNAP_TEST_DATA')
    SQLConnection = SQLConnection1
    Left = 200
    Top = 120
  end
  object OutSqlQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from DATASNAP_TEST_DATA')
    SQLConnection = SQLConnection1
    Left = 16
    Top = 120
  end
  object VarSqlQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from DATASNAP_TEST_DATA')
    SQLConnection = SQLConnection1
    Left = 104
    Top = 120
  end
end
