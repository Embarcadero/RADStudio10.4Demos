object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Server app'
  ClientHeight = 608
  ClientWidth = 907
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 46
    Width = 907
    Height = 562
    Align = alClient
    Proportional = True
    Stretch = True
    ExplicitLeft = 127
    ExplicitTop = 64
    ExplicitWidth = 922
    ExplicitHeight = 489
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 907
    Height = 46
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 32
      Top = 11
      Width = 113
      Height = 25
      Action = actFullShot
      TabOrder = 0
    end
    object Button2: TButton
      Left = 151
      Top = 11
      Width = 113
      Height = 25
      Action = actStartCast
      TabOrder = 1
    end
    object Button3: TButton
      Left = 270
      Top = 11
      Width = 113
      Height = 25
      Action = actStopCast
      TabOrder = 2
    end
  end
  object DesktopTetherManager: TTetheringManager
    OnRequestManagerPassword = DesktopTetherManagerRequestManagerPassword
    Password = 'Desktop'
    Text = 'DesktopTetherManager'
    AllowedAdapters = 'Network_V4'
    Left = 40
    Top = 280
  end
  object ActionManager1: TActionManager
    Left = 40
    Top = 224
    StyleName = 'Platform Default'
    object actFullShot: TAction
      Caption = 'TakeFullScreenShot'
      OnExecute = actFullShotExecute
    end
    object actStartCast: TAction
      Caption = 'StartLiveCast'
      OnExecute = actStartCastExecute
    end
    object actStopCast: TAction
      Caption = 'StopLiveCast'
      OnExecute = actStopCastExecute
    end
  end
  object TetheringAppProfile1: TTetheringAppProfile
    Manager = DesktopTetherManager
    Text = 'TetheringAppProfile1'
    Group = 'TetherDesktop'
    Actions = <
      item
        Name = 'acFullShot'
        IsPublic = True
        Action = actFullShot
        NotifyUpdates = False
      end
      item
        Name = 'acStartCast'
        IsPublic = True
        Action = actStartCast
        NotifyUpdates = False
      end
      item
        Name = 'acStopCast'
        IsPublic = True
        Action = actStopCast
        NotifyUpdates = False
      end>
    Resources = <
      item
        Name = 'BmpCast'
        IsPublic = True
        ResType = Stream
      end>
    Left = 40
    Top = 336
  end
  object tmCast: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = tmCastTimer
    Left = 40
    Top = 176
  end
end
