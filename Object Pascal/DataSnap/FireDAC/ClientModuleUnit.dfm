object DataModuleFDClient: TDataModuleFDClient
  OldCreateOrder = False
  Height = 300
  Width = 375
  object dsOrders: TDataSource
    DataSet = mtOrders
    Left = 192
    Top = 192
  end
  object mtCustomers: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Adapter = taCustomers
    Left = 40
    Top = 80
  end
  object taCustomers: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter
    DatSTableName = 'qCustomers'
    Left = 40
    Top = 136
  end
  object dsCustomers: TDataSource
    DataSet = mtCustomers
    Left = 40
    Top = 192
  end
  object mtOrders: TFDMemTable
    CachedUpdates = True
    IndexFieldNames = 'CustomerID'
    MasterSource = dsCustomers
    MasterFields = 'CustomerID'
    FetchOptions.AssignedValues = [evMode, evDetailCascade]
    FetchOptions.Mode = fmAll
    FetchOptions.DetailCascade = True
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Adapter = taOrders
    Left = 192
    Top = 80
  end
  object FDSchemaAdapter: TFDSchemaAdapter
    Left = 112
    Top = 24
  end
  object taOrders: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter
    DatSTableName = 'qOrders'
    Left = 186
    Top = 136
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 240
    Top = 24
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 288
    Top = 128
  end
end
