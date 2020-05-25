object CMClientModule: TCMClientModule
  OldCreateOrder = False
  Height = 271
  Width = 415
  object CMCSQLConnection: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/')
    Left = 48
    Top = 40
    UniqueId = '{B20CFA38-BEDE-497B-B520-6C8FD3B34392}'
  end
end
