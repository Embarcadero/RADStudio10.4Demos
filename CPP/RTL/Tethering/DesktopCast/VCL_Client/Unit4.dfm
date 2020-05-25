object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Client App'
  ClientHeight = 462
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 65
    Width = 788
    Height = 397
    Align = alClient
    Proportional = True
    Stretch = True
    ExplicitLeft = -205
    ExplicitTop = -158
    ExplicitWidth = 825
    ExplicitHeight = 518
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 788
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -205
    ExplicitWidth = 825
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 788
      Height = 16
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 4
    end
    object Button1: TButton
      Left = 168
      Top = 34
      Width = 113
      Height = 25
      Action = actFullShot
      TabOrder = 0
    end
    object Button2: TButton
      Left = 287
      Top = 34
      Width = 113
      Height = 25
      Action = actStartCast
      TabOrder = 1
    end
    object Button3: TButton
      Left = 406
      Top = 34
      Width = 113
      Height = 25
      Action = actStopCast
      TabOrder = 2
    end
    object Button4: TButton
      Left = 8
      Top = 34
      Width = 113
      Height = 25
      Caption = 'Connect'
      TabOrder = 3
      OnClick = Button4Click
    end
  end
  object DesktopTheterManager: TTetheringManager
    OnRequestManagerPassword = DesktopTheterManagerRequestManagerPassword
    OnEndAutoConnect = DesktopTheterManagerEndAutoConnect
    Password = 'Desktop1'
    Text = 'DesktopTheterManager'
    AllowedAdapters = 'Network_V4'
    Left = 80
    Top = 332
  end
  object ActionManager1: TActionManager
    Left = 328
    Top = 200
    StyleName = 'Platform Default'
    object actFullShot: TAction
      Caption = 'TakeFullScreenShot'
    end
    object actStartCast: TAction
      Caption = 'StartLiveCast'
    end
    object actStopCast: TAction
      Caption = 'StopLiveCast'
    end
  end
  object TetheringAppProfile1: TTetheringAppProfile
    Manager = DesktopTheterManager
    Text = 'TetheringAppProfile1'
    Group = 'TetherDesktop'
    Actions = <
      item
        Name = 'acFullShot'
        IsPublic = True
        Kind = Mirror
        Action = actFullShot
        NotifyUpdates = False
      end
      item
        Name = 'acStartCast'
        IsPublic = True
        Kind = Mirror
        Action = actStartCast
        NotifyUpdates = False
      end
      item
        Name = 'acStopCast'
        IsPublic = True
        Kind = Mirror
        Action = actStopCast
        NotifyUpdates = False
      end>
    Resources = <
      item
        Name = 'BmpCast'
        IsPublic = True
        Kind = Mirror
        ResType = Stream
        OnResourceReceived = TetheringAppProfile1Resources0ResourceReceived
      end>
    Left = 80
    Top = 268
  end
  object tmCheckConnection: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = tmCheckConnectionTimer
    Left = 408
    Top = 296
  end
end
