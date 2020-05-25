object ServerContainer: TServerContainer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 271
  Width = 415
  object DSServer: TDSServer
    Left = 96
    Top = 11
  end
  object DSTCPServerTransport: TDSTCPServerTransport
    Server = DSServer
    Filters = <>
    Left = 96
    Top = 73
  end
  object DSServerClass: TDSServerClass
    OnGetClass = DSServerClassGetClass
    Server = DSServer
    Left = 200
    Top = 11
  end
  object DSAuthenticationManager: TDSAuthenticationManager
    OnUserAuthenticate = DSAuthenticationManagerUserAuthenticate
    OnUserAuthorize = DSAuthenticationManagerUserAuthorize
    Roles = <>
    Left = 264
    Top = 72
  end
  object DSHTTPService: TDSHTTPService
    HttpPort = 8080
    Server = DSServer
    Filters = <>
    AuthenticationManager = DSAuthenticationManager
    Left = 88
    Top = 159
  end
end
