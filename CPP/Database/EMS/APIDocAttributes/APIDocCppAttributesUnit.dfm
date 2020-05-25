object SampleAttributesCppResource1: TSampleAttributesCppResource1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 298
  Width = 498
  object EmployeeConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=EMPLOYEE')
    Connected = True
    LoginPrompt = False
    Left = 84
    Top = 29
  end
  object EmployeeTable: TFDQuery
    Connection = EmployeeConnection
    SchemaAdapter = FDSchemaAdapterEmployees
    FetchOptions.AssignedValues = [evItems, evCache]
    ResourceOptions.AssignedValues = [rvStoreItems]
    SQL.Strings = (
      'SELECT * FROM EMPLOYEE')
    Left = 84
    Top = 77
  end
  object FDSchemaAdapterEmployees: TFDSchemaAdapter
    ResourceOptions.AssignedValues = [rvStoreItems]
    ResourceOptions.StoreItems = [siData]
    Left = 80
    Top = 168
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 72
    Top = 240
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 232
    Top = 232
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 232
    Top = 136
  end
end
