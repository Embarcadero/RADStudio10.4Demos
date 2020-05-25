inherited frmMain: TfrmMain
  Left = 314
  Top = 197
  Caption = 'Batch'
  ClientHeight = 432
  ClientWidth = 512
  Font.Name = 'MS Sans Serif'
  ExplicitWidth = 528
  ExplicitHeight = 470
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 512
    ExplicitWidth = 512
    inherited bvlTitle: TBevel
      Width = 454
      ExplicitWidth = 462
    end
    inherited imgAnyDAC: TImage
      Left = 454
      ExplicitLeft = 462
    end
    inherited lblTitle: TLabel
      Width = 60
      Caption = 'Batch'
      ExplicitWidth = 60
    end
  end
  inherited pnlMain: TPanel
    Width = 512
    Height = 323
    ExplicitWidth = 512
    ExplicitHeight = 323
    inherited pnlConnection: TPanel
      Width = 512
      ExplicitWidth = 512
      inherited lblUseConnectionDef: TLabel
        Width = 126
        ExplicitWidth = 126
      end
      object Label1: TLabel [1]
        Left = 164
        Top = 22
        Width = 80
        Height = 13
        Caption = 'Records to insert'
      end
      inherited cbDB: TComboBox
        TabOrder = 1
      end
      object chbBlobs: TCheckBox
        Left = 327
        Top = 21
        Width = 97
        Height = 17
        Caption = 'Insert blobs'
        TabOrder = 0
      end
      object edtRecordsToInsert: TEdit
        Left = 250
        Top = 19
        Width = 65
        Height = 21
        TabOrder = 2
        Text = '10000'
      end
    end
    inherited Console: TMemo
      Width = 509
      Height = 274
      ExplicitWidth = 509
      ExplicitHeight = 274
    end
  end
  inherited pnlButtons: TPanel
    Top = 376
    Width = 512
    ExplicitTop = 376
    ExplicitWidth = 512
    inherited bvlButtons: TBevel
      Width = 512
      ExplicitWidth = 520
    end
    inherited btnClose: TButton
      Left = 431
      ExplicitLeft = 431
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 413
    Width = 512
    Height = 19
    Panels = <
      item
        Width = 270
      end
      item
        Width = 270
      end>
  end
end
