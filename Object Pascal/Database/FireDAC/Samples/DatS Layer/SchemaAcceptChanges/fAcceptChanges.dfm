inherited frmAcceptChanges: TfrmAcceptChanges
  Left = 315
  Top = 197
  Caption = 'Schema Accept/Reject changes'
  ClientHeight = 466
  ClientWidth = 642
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  ExplicitWidth = 658
  ExplicitHeight = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 642
    ExplicitWidth = 642
    inherited bvlTitle: TBevel
      Width = 584
      ExplicitWidth = 592
    end
    inherited imgAnyDAC: TImage
      Left = 584
      ExplicitLeft = 592
    end
    inherited lblTitle: TLabel
      Width = 237
      Caption = 'Schema Accept/Reject'
      ExplicitWidth = 237
    end
  end
  inherited pnlMain: TPanel
    Width = 642
    Height = 376
    ExplicitWidth = 642
    ExplicitHeight = 376
    inherited pnlConnection: TPanel
      Width = 642
      Height = 81
      ExplicitWidth = 642
      ExplicitHeight = 81
      inherited lblUseConnectionDef: TLabel
        Width = 126
        ExplicitWidth = 126
      end
      object btnChange: TButton [1]
        Left = 6
        Top = 49
        Width = 76
        Height = 25
        Caption = 'Change rows'
        Enabled = False
        TabOrder = 1
        OnClick = btnChangeClick
      end
      object btnAccept: TButton [2]
        Left = 91
        Top = 49
        Width = 76
        Height = 25
        Caption = 'Accept'
        Enabled = False
        TabOrder = 2
        OnClick = btnAcceptClick
      end
      object btnReject: TButton [3]
        Left = 176
        Top = 49
        Width = 76
        Height = 25
        Caption = 'Reject'
        Enabled = False
        TabOrder = 3
        OnClick = btnRejectClick
      end
      object btnJournal: TButton [4]
        Left = 261
        Top = 49
        Width = 76
        Height = 25
        Caption = 'Journal'
        Enabled = False
        TabOrder = 4
        OnClick = btnJournalClick
      end
    end
    inherited Console: TMemo
      Top = 81
      Width = 640
      Height = 295
      ExplicitTop = 81
      ExplicitWidth = 640
      ExplicitHeight = 295
    end
  end
  inherited pnlButtons: TPanel
    Top = 429
    Width = 642
    ExplicitTop = 429
    ExplicitWidth = 642
    inherited bvlButtons: TBevel
      Width = 642
      ExplicitWidth = 650
    end
    inherited btnClose: TButton
      Left = 571
      ExplicitLeft = 571
    end
  end
end
