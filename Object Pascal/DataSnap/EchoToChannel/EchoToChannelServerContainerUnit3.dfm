object ServerContainer3: TServerContainer3
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 271
  Width = 415
  object DSServer1: TDSServer
    Left = 96
    Top = 11
  end
  object DSTCPServerTransport1: TDSTCPServerTransport
    PoolSize = 0
    Server = DSServer1
    Filters = <>
    Left = 96
    Top = 73
  end
  object DSHTTPService1: TDSHTTPService
    Server = DSServer1
    Filters = <>
    HttpPort = 8080
    Left = 96
    Top = 135
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    OnCreateInstance = DSServerClass1CreateInstance
    Server = DSServer1
    Left = 200
    Top = 11
  end
end
