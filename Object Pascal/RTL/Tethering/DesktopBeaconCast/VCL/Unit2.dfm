object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Server app'
  ClientHeight = 608
  ClientWidth = 777
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
    Top = 265
    Width = 777
    Height = 343
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
    Width = 777
    Height = 265
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 48
      Width = 63
      Height = 13
      Caption = 'Beacon GUID'
    end
    object Label2: TLabel
      Left = 24
      Top = 93
      Width = 79
      Height = 13
      Caption = 'Beacon Major ID'
    end
    object Label3: TLabel
      Left = 216
      Top = 94
      Width = 78
      Height = 13
      Caption = 'Beacon Minor ID'
    end
    object Label4: TLabel
      Left = 105
      Top = 147
      Width = 72
      Height = 13
      Caption = 'Last sent GUID'
    end
    object LbLastSent: TLabel
      Left = 183
      Top = 147
      Width = 134
      Height = 13
      Caption = '* You have not sent a GUID'
    end
    object Button1: TButton
      Left = 32
      Top = 11
      Width = 113
      Height = 25
      Action = actFullShot
      TabOrder = 0
    end
    object EdGUID: TMaskEdit
      Left = 24
      Top = 67
      Width = 307
      Height = 21
      EditMask = '{CCCCCCCC-CCCC-CCCC-CCCC-CCCCCCCCCCCC};1;_'
      MaxLength = 38
      TabOrder = 1
      Text = '{B9407F30-F5F8-466E-AFF9-25556B57FE6D}'
    end
    object SEdMajor: TSpinEdit
      Left = 24
      Top = 112
      Width = 121
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 10
    end
    object SEdMinor: TSpinEdit
      Left = 216
      Top = 112
      Width = 121
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 1
    end
    object Button2: TButton
      Left = 24
      Top = 140
      Width = 75
      Height = 25
      Caption = 'Notify clients'
      TabOrder = 4
      OnClick = Button2Click
    end
    object Memo1: TMemo
      Left = 440
      Top = 24
      Width = 297
      Height = 209
      Lines.Strings = (
        'Memo1')
      TabOrder = 5
    end
  end
  object DesktopTetherManager: TTetheringManager
    OnPairedFromLocal = DesktopTetherManagerPairedFromLocal
    OnPairedToRemote = DesktopTetherManagerPairedToRemote
    OnRequestManagerPassword = DesktopTetherManagerRequestManagerPassword
    OnNewManager = DesktopTetherManagerNewManager
    OnUnPairManager = DesktopTetherManagerUnPairManager
    Password = 'Desktop'
    Text = 'DesktopTetherManager'
    AllowedAdapters = 'Network'
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
    object actSendGUID: TAction
      Caption = 'actSendGUID'
      OnExecute = actSendGUIDExecute
    end
  end
  object TetheringAppProfile1: TTetheringAppProfile
    Manager = DesktopTetherManager
    OnDisconnect = TetheringAppProfile1Disconnect
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
        Name = 'acNotifyGUID'
        IsPublic = True
        Action = actSendGUID
        NotifyUpdates = False
      end>
    Resources = <
      item
        Name = 'BmpCast'
        IsPublic = True
        ResType = Stream
      end
      item
        Name = 'BeaconGUID'
        IsPublic = True
      end>
    Left = 40
    Top = 336
  end
end
