object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 543
  ClientWidth = 558
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 427
    Width = 558
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 97
    ExplicitWidth = 470
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 558
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object GbxBeaconData: TGroupBox
      Left = 176
      Top = 13
      Width = 369
      Height = 60
      Caption = 'Associated Beacon Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 16
        Width = 25
        Height = 13
        Caption = 'GUID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 257
        Top = 16
        Width = 27
        Height = 13
        Caption = 'Major'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 312
        Top = 16
        Width = 26
        Height = 13
        Caption = 'Minor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object SEdMajor: TSpinEdit
        Left = 257
        Top = 30
        Width = 49
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 10
      end
      object EdGUID: TMaskEdit
        Left = 10
        Top = 30
        Width = 241
        Height = 21
        EditMask = '{CCCCCCCC-CCCC-CCCC-CCCC-CCCCCCCCCCCC};1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 38
        ParentFont = False
        TabOrder = 0
        Text = '{B9407F30-F5F8-466E-AFF9-25556B57FE6D}'
      end
      object SEdMinor: TSpinEdit
        Left = 312
        Top = 30
        Width = 49
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 2
        Value = 1
      end
    end
    object BtnStartStop: TButton
      Left = 16
      Top = 15
      Width = 154
      Height = 58
      Caption = 'Start'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnStartStopClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 430
    Width = 558
    Height = 113
    Align = alBottom
    Caption = 'Panel2'
    TabOrder = 1
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 556
      Height = 111
      Align = alClient
      TabOrder = 0
    end
  end
  object PnImage: TPanel
    Left = 0
    Top = 81
    Width = 558
    Height = 346
    Align = alClient
    BevelInner = bvLowered
    BevelKind = bkTile
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    object Image1: TImage
      Left = 2
      Top = 2
      Width = 550
      Height = 338
      Align = alClient
      Center = True
      Proportional = True
      Stretch = True
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 543
      ExplicitHeight = 348
    end
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
  object DesktopTetherManager: TTetheringManager
    OnPairedFromLocal = DesktopTetherManagerPairedFromLocal
    OnPairedToRemote = DesktopTetherManagerPairedToRemote
    OnNewManager = DesktopTetherManagerNewManager
    OnUnPairManager = DesktopTetherManagerUnPairManager
    Password = 'Desktop'
    Text = 'DesktopTetherManager'
    Enabled = False
    AllowedAdapters = 'Network'
    Left = 40
    Top = 280
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
