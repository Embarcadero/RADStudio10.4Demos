object AdminDM: TAdminDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 492
  Width = 761
  object FDIBSecurity1: TFDIBSecurity
    DriverLink = FDPhysIBDriverLink1
    Protocol = ipTCPIP
    Host = 'localhost'
    UserName = 'SYSDBA'
    Password = 'masterkey'
    Left = 110
    Top = 200
  end
  object FDIBBackup1: TFDIBBackup
    OnError = FDIBBackup1Error
    AfterExecute = FDIBBackup1AfterExecute
    DriverLink = FDPhysIBDriverLink1
    OnProgress = FDIBBackup1Progress
    Left = 254
    Top = 200
  end
  object FDIBValidate1: TFDIBValidate
    OnError = FDIBValidate1Error
    AfterExecute = FDIBValidate1AfterExecute
    DriverLink = FDPhysIBDriverLink1
    OnProgress = FDIBValidate1Progress
    Left = 382
    Top = 200
  end
  object FDIBRestore1: TFDIBRestore
    OnError = FDIBRestore1Error
    AfterExecute = FDIBRestore1AfterExecute
    DriverLink = FDPhysIBDriverLink1
    OnProgress = FDIBRestore1Progress
    Left = 318
    Top = 222
  end
  object FDMemTableUsers: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 110
    Top = 264
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 190
    Top = 32
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 78
    Top = 32
  end
end
