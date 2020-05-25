inherited frmMain: TfrmMain
  Left = 419
  Top = 175
  Caption = 'TFDEventAlerter'
  ClientHeight = 472
  ClientWidth = 422
  Font.Name = 'MS Sans Serif'
  ExplicitWidth = 438
  ExplicitHeight = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 422
    ExplicitWidth = 422
    inherited bvlTitle: TBevel
      Width = 374
      ExplicitWidth = 379
    end
    inherited imgAnyDAC: TImage
      Left = 374
      Width = 48
      ExplicitLeft = 379
      ExplicitWidth = 48
    end
    inherited lblTitle: TLabel
      Width = 253
      Caption = 'Working with DB events'
      ExplicitWidth = 253
    end
  end
  inherited pnlMain: TPanel
    Width = 422
    Height = 363
    ExplicitWidth = 422
    ExplicitHeight = 363
    inherited pnlConnection: TPanel
      Width = 422
      ExplicitWidth = 422
      inherited lblUseConnectionDef: TLabel
        Width = 126
        ExplicitWidth = 126
      end
    end
    object Memo1: TMemo
      Left = 6
      Top = 131
      Width = 412
      Height = 224
      Anchors = [akLeft, akTop, akRight, akBottom]
      ScrollBars = ssVertical
      TabOrder = 1
      WordWrap = False
    end
    object btnRegister: TButton
      Left = 6
      Top = 102
      Width = 130
      Height = 23
      Caption = '1.) Register events'
      Enabled = False
      TabOrder = 2
      OnClick = btnRegisterClick
    end
    object btnFire: TButton
      Left = 147
      Top = 102
      Width = 130
      Height = 23
      Caption = '2.) Fire events !'
      Enabled = False
      TabOrder = 3
      OnClick = btnFireClick
    end
    object btnUnregister: TButton
      Left = 288
      Top = 102
      Width = 130
      Height = 23
      Caption = '3.) Unregister events'
      Enabled = False
      TabOrder = 4
      OnClick = btnUnregisterClick
    end
  end
  inherited pnlButtons: TPanel
    Top = 416
    Width = 422
    ExplicitTop = 416
    ExplicitWidth = 422
    inherited bvlButtons: TBevel
      Width = 422
      ExplicitWidth = 427
    end
    inherited btnClose: TButton
      Left = 343
      Top = 6
      ExplicitLeft = 343
      ExplicitTop = 6
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 453
    Width = 422
    ExplicitTop = 453
    ExplicitWidth = 422
  end
  object rgEventKinds: TRadioGroup
    Left = 6
    Top = 99
    Width = 412
    Height = 47
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Supported event kinds:'
    TabOrder = 4
    OnClick = rgEventKindsClick
  end
  object qryFireEvents: TFDQuery
    Connection = dmlMainComp.dbMain
    Left = 180
    Top = 264
  end
  object FDEventAlerter1: TFDEventAlerter
    Connection = dmlMainComp.dbMain
    Options.Timeout = 1000
    OnAlert = FDEventAlerter1Alert
    OnTimeout = FDEventAlerter1Timeout
    Left = 176
    Top = 208
  end
end
