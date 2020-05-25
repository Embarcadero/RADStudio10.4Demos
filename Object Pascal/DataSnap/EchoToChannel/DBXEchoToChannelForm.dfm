object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'DBX EchoToChannel Client'
  ClientHeight = 285
  ClientWidth = 362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    362
    285)
  PixelsPerInch = 96
  TextHeight = 12
  object LabelManagerId: TLabel
    Left = 50
    Top = 6
    Width = 72
    Height = 12
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'LabelManagerId'
  end
  object Label1: TLabel
    Left = 6
    Top = 6
    Width = 43
    Height = 12
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Client ID:'
  end
  object Label2: TLabel
    Left = 6
    Top = 84
    Width = 21
    Height = 12
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Log:'
  end
  object ButtonConnect: TButton
    Left = 6
    Top = 25
    Width = 79
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Connect'
    TabOrder = 0
    OnClick = ButtonConnectClick
  end
  object ButtonDisconnect: TButton
    Left = 95
    Top = 25
    Width = 78
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Disconnect'
    TabOrder = 1
    OnClick = ButtonDisconnectClick
  end
  object Memo1: TMemo
    Left = 6
    Top = 101
    Width = 350
    Height = 152
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
  end
  object ButtonClearLog: TButton
    Left = 299
    Top = 262
    Width = 57
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akRight, akBottom]
    Caption = 'Clear'
    TabOrder = 5
    OnClick = ButtonClearLogClick
  end
  object ButtonEcho: TButton
    Left = 299
    Top = 55
    Width = 57
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Echo'
    TabOrder = 3
    OnClick = ButtonEchoClick
  end
  object Edit1: TEdit
    Left = 6
    Top = 55
    Width = 277
    Height = 20
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    TabOrder = 2
    Text = 'Text to Echo'
  end
  object DSClientCallbackChannelManager1: TDSClientCallbackChannelManager
    DSHostname = 'localhost'
    DSPort = '211'
    CommunicationProtocol = 'tcp/ip'
    ChannelName = 'Echo'
    ManagerId = '14293.185643.93700'
    Left = 440
    Top = 105
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 432
    Top = 9
  end
end
