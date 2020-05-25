object DSServerModule1: TDSServerModule1
  OldCreateOrder = False
  Height = 194
  Width = 335
  object SQLConnection1: TSQLConnection
    ConnectionName = 'EMPLOYEE'
    DriverName = 'InterBase'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=InterBase'
      'DriverUnit=Data.DBXInterBase'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver170.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=17.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXInterbaseMetaDataCommandFactory,DbxInt' +
        'erBaseDriver170.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXInterbaseMetaDataCommand' +
        'Factory,Borland.Data.DbxInterBaseDriver,Version=17.0.0.0,Culture' +
        '=neutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxint.dll'
      'LibraryNameOsx=libsqlib.dylib'
      'VendorLib=GDS32.DLL'
      'VendorLibWin64=ibclient64.dll'
      'VendorLibOsx=libgds.dylib'
      
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
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    Left = 40
    Top = 64
  end
  object CustQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from customer')
    SQLConnection = SQLConnection1
    Left = 128
    Top = 32
  end
  object CustDataSetProvider: TDataSetProvider
    DataSet = CustQuery
    Left = 232
    Top = 32
  end
  object SalesQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CUST_NO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from sales'
      'where CUST_NO = :CUST_NO')
    SQLConnection = SQLConnection1
    Left = 128
    Top = 120
  end
  object SalesDataSetProvider: TDataSetProvider
    DataSet = SalesQuery
    Left = 232
    Top = 120
  end
end
