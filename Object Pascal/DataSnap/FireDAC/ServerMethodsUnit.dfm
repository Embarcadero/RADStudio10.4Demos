object ServerMethods: TServerMethods
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  OnDestroy = DSServerModuleDestroy
  Height = 305
  Width = 523
  object FDConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=SQLite_Demo')
    LoginPrompt = False
    Left = 56
    Top = 24
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 176
    Top = 24
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 304
    Top = 24
  end
  object FDStanStorageJSONLink: TFDStanStorageJSONLink
    Left = 432
    Top = 24
  end
  object FDSchemaAdapter: TFDSchemaAdapter
    UpdateOptions.AutoCommitUpdates = True
    Left = 112
    Top = 96
  end
  object qCustomers: TFDQuery
    CachedUpdates = True
    OnUpdateError = DataSetUpdateError
    Connection = FDConnection
    SchemaAdapter = FDSchemaAdapter
    SQL.Strings = (
      'select * from Customers')
    Left = 56
    Top = 152
  end
  object qOrders: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'CustomerID'
    MasterSource = dsCustomers
    MasterFields = 'CustomerID'
    OnUpdateError = DataSetUpdateError
    Connection = FDConnection
    SchemaAdapter = FDSchemaAdapter
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'select * from Orders')
    Left = 160
    Top = 152
  end
  object dsCustomers: TDataSource
    DataSet = qCustomers
    Left = 56
    Top = 208
  end
  object dsOrders: TDataSource
    DataSet = qOrders
    Left = 160
    Top = 208
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 432
    Top = 88
  end
end
