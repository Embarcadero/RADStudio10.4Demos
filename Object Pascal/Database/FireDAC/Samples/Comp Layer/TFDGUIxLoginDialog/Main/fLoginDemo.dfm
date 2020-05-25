inherited Form1: TForm1
  Left = 358
  Top = 193
  Caption = 'Login Demo - Disconnect'
  ClientHeight = 377
  ClientWidth = 494
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  ExplicitWidth = 510
  ExplicitHeight = 416
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 494
    ExplicitWidth = 494
    inherited bvlTitle: TBevel
      Width = 436
      ExplicitWidth = 444
    end
    inherited imgAnyDAC: TImage
      Left = 436
      ExplicitLeft = 444
    end
    inherited lblTitle: TLabel
      Width = 124
      Caption = 'Login Demo'
      ExplicitWidth = 124
    end
  end
  inherited pnlMain: TPanel
    Width = 494
    Height = 268
    ExplicitWidth = 494
    ExplicitHeight = 268
    object Label3: TLabel [0]
      Left = 6
      Top = 85
      Width = 150
      Height = 13
      Alignment = taRightJustify
      Caption = 'FireDAC Login Dialog properties'
    end
    object Bevel1: TBevel [1]
      Left = 160
      Top = 92
      Width = 339
      Height = 9
      Shape = bsTopLine
    end
    object Label1: TLabel [2]
      Left = 5
      Top = 157
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'VisibleItems'
    end
    object btnConnect: TButton [3]
      Left = 6
      Top = 53
      Width = 76
      Height = 21
      Caption = 'Connect'
      TabOrder = 9
      OnClick = btnConnectClick
    end
    object btnDisconnect: TButton [4]
      Left = 107
      Top = 53
      Width = 76
      Height = 21
      Caption = 'Disconnect'
      TabOrder = 10
      OnClick = btnDisconnectClick
    end
    inherited pnlConnection: TPanel
      Width = 494
      Height = 48
      TabOrder = 8
      ExplicitWidth = 494
      ExplicitHeight = 48
      inherited lblUseConnectionDef: TLabel
        Width = 126
        ExplicitWidth = 126
      end
    end
    object chLoginPrompt: TCheckBox
      Left = 202
      Top = 55
      Width = 97
      Height = 17
      BiDiMode = bdLeftToRight
      Caption = 'Login prompt'
      Checked = True
      Ctl3D = True
      ParentBiDiMode = False
      ParentCtl3D = False
      State = cbChecked
      TabOrder = 0
    end
    object chChangePassword: TCheckBox
      Left = 5
      Top = 109
      Width = 145
      Height = 17
      Caption = 'ChangeExpiredPassword'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object chHistory: TCheckBox
      Left = 5
      Top = 133
      Width = 97
      Height = 17
      Caption = 'HistoryEnabled'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object edLoginRetries: TLabeledEdit
      Left = 267
      Top = 106
      Width = 32
      Height = 21
      EditLabel.Width = 62
      EditLabel.Height = 13
      EditLabel.Caption = 'LoginRetries:'
      LabelPosition = lpLeft
      TabOrder = 3
      Text = '3'
    end
    object udLoginRetries: TUpDown
      Left = 299
      Top = 106
      Width = 16
      Height = 21
      Associate = edLoginRetries
      Max = 10
      Position = 3
      TabOrder = 4
    end
    object mmVisibleItems: TMemo
      Left = 5
      Top = 173
      Width = 189
      Height = 90
      Lines.Strings = (
        'Database=DB'
        'User_Name'
        'Password')
      TabOrder = 5
    end
    object chHistoryWithPassword: TCheckBox
      Left = 202
      Top = 133
      Width = 129
      Height = 17
      Caption = 'HistoryWithPassword'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object Memo1: TMemo
      Left = 202
      Top = 173
      Width = 294
      Height = 89
      Color = clInfoBk
      Lines.Strings = (
        'VisibleItems is a list of Connection Definitions param names, '
        'which will be allowed to enter in Login Dialog. If the list is '
        'empty, then all end user params will be accesible.'
        ''
        'VisibleItems allows to specify custom labels for params:'
        '<param>=<label>')
      TabOrder = 7
    end
  end
  inherited pnlButtons: TPanel
    Top = 321
    Width = 494
    ExplicitTop = 321
    ExplicitWidth = 494
    inherited bvlButtons: TBevel
      Width = 494
      ExplicitWidth = 502
    end
    inherited btnClose: TButton
      Left = 423
      ExplicitLeft = 423
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 358
    Width = 494
    ExplicitTop = 358
    ExplicitWidth = 494
  end
end
