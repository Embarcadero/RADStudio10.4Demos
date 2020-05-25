object DSServerContainer: TDSServerContainer
  OldCreateOrder = False
  Height = 205
  Width = 300
  object DSServer1: TDSServer
    Left = 40
    Top = 16
  end
  object DSTCPServerTransport1: TDSTCPServerTransport
    PoolSize = 0
    Server = DSServer1
    Filters = <>
    Left = 40
    Top = 72
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 40
    Top = 128
  end
  object DSProxyGenerator1: TDSProxyGenerator
    MetaDataProvider = DSServerMetaDataProvider1
    Writer = 'Object Pascal DBX'
    Left = 180
    Top = 80
  end
  object DSServerMetaDataProvider1: TDSServerMetaDataProvider
    Server = DSServer1
    Left = 184
    Top = 16
  end
end
