inherited frmAutoInc: TfrmAutoInc
  Left = 339
  Top = 168
  Caption = 'Auto inc fields'
  ClientHeight = 472
  ClientWidth = 540
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  ExplicitWidth = 556
  ExplicitHeight = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 540
    ExplicitWidth = 540
    inherited bvlTitle: TBevel
      Width = 482
      ExplicitWidth = 490
    end
    inherited imgAnyDAC: TImage
      Left = 482
      ExplicitLeft = 490
    end
    inherited lblTitle: TLabel
      Width = 155
      Caption = 'Auto Inc Fields'
      ExplicitWidth = 155
    end
  end
  inherited pnlMain: TPanel
    Width = 540
    Height = 382
    ExplicitWidth = 540
    ExplicitHeight = 382
    inherited pnlConnection: TPanel
      Width = 540
      Height = 107
      ExplicitWidth = 540
      ExplicitHeight = 107
      inherited lblUseConnectionDef: TLabel
        Width = 126
        ExplicitWidth = 126
      end
      object btnInsert: TButton [1]
        Left = 125
        Top = 46
        Width = 76
        Height = 25
        Caption = 'Insert rows'
        Enabled = False
        TabOrder = 3
        OnClick = btnInsertClick
      end
      inherited cbDB: TComboBox
        TabOrder = 2
      end
      object edtSeed: TLabeledEdit
        Left = 80
        Top = 46
        Width = 33
        Height = 21
        EditLabel.Width = 65
        EditLabel.Height = 13
        EditLabel.Caption = 'AutoIncSeed:'
        LabelPosition = lpLeft
        TabOrder = 0
        Text = '-1'
      end
      object edtStep: TLabeledEdit
        Left = 80
        Top = 75
        Width = 33
        Height = 21
        EditLabel.Width = 62
        EditLabel.Height = 13
        EditLabel.Caption = 'AutoIncStep:'
        LabelPosition = lpLeft
        TabOrder = 1
        Text = '-1'
      end
    end
    inherited Console: TMemo
      Left = 5
      Top = 103
      Width = 538
      Height = 277
      ExplicitLeft = 5
      ExplicitTop = 103
      ExplicitWidth = 538
      ExplicitHeight = 277
    end
  end
  inherited pnlButtons: TPanel
    Top = 435
    Width = 540
    ExplicitTop = 435
    ExplicitWidth = 540
    inherited bvlButtons: TBevel
      Width = 540
      ExplicitWidth = 548
    end
    inherited btnClose: TButton
      Left = 469
      ExplicitLeft = 469
    end
  end
end
