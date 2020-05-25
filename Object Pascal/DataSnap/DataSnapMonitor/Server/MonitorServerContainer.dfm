object CMServerContainer: TCMServerContainer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 233
  Width = 262
  object CMServer: TDSServer
    Left = 40
    Top = 11
  end
  object CMServerTransport: TDSTCPServerTransport
    PoolSize = 0
    Server = CMServer
    Filters = <>
    AuthenticationManager = CMAuthManager
    Left = 40
    Top = 73
  end
  object CMServerClass: TDSServerClass
    OnGetClass = CMServerClassGetClass
    Server = CMServer
    Left = 136
    Top = 11
  end
  object CMAuthManager: TDSAuthenticationManager
    OnUserAuthorize = CMAuthManagerUserAuthorize
    Roles = <>
    Left = 168
    Top = 88
  end
  object CMHTTPService: TDSHTTPService
    Server = CMServer
    DSPort = 0
    Filters = <>
    SessionTimeout = 0
    HttpPort = 8089
    Left = 40
    Top = 143
  end
end
