object DSServerModule2: TDSServerModule2
  OldCreateOrder = False
  Height = 240
  Width = 273
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
    Left = 56
    Top = 24
  end
  object DataSnapTestData: TDataSetProvider
    DataSet = DataSnapTestDataQuery
    Left = 56
    Top = 168
  end
  object DataSnapTestDataQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from DATASNAP_TEST_DATA')
    SQLConnection = SQLConnection1
    Left = 56
    Top = 96
  end
end
