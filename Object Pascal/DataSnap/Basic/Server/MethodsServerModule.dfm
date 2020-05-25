object ServerModule1: TServerModule1
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  OnDestroy = DSServerModuleDestroy
  Height = 150
  Width = 215
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
  object SQLDataSet1: TSQLDataSet
    Params = <>
    Left = 120
    Top = 32
  end
end
