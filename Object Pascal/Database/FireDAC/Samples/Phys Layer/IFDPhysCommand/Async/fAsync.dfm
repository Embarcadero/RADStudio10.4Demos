inherited frmAsync: TfrmAsync
  Left = 359
  Top = 214
  Height = 440
  Caption = 'Async Execute'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 282
      Caption = 'Async Command Execution'
    end
  end
  inherited pnlMain: TPanel
    Height = 316
    inherited pnlConnection: TPanel
      Height = 91
      object Label1: TLabel [1]
        Left = 351
        Top = 46
        Width = 38
        Height = 13
        Caption = 'Timeout'
      end
      object btnExecute: TButton [2]
        Left = 478
        Top = 59
        Width = 76
        Height = 25
        Caption = 'Execute'
        Enabled = False
        TabOrder = 3
        OnClick = btnExecuteClick
      end
      object rgMode: TRadioGroup
        Left = 7
        Top = 44
        Width = 339
        Height = 39
        Caption = 'Async execution mode'
        Columns = 4
        ItemIndex = 2
        Items.Strings = (
          'Blocking'
          'Non blocking'
          'Cancel dialog'
          'Async')
        TabOrder = 1
      end
      object edtTimeout: TEdit
        Left = 351
        Top = 62
        Width = 121
        Height = 21
        TabOrder = 2
        Text = '$FFFFFFFF'
      end
    end
    inherited Console: TMemo
      Top = 92
      Width = 616
      Height = 216
    end
  end
  inherited pnlButtons: TPanel
    Top = 369
  end
end
