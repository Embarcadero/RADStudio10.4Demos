inherited frmMetaIndices: TfrmMetaIndices
  Left = 361
  Top = 307
  Width = 632
  Height = 531
  Caption = 'Meta info about indices'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 624
    inherited bvlTitle: TBevel
      Width = 566
    end
    inherited imgAnyDAC: TImage
      Left = 566
    end
    inherited lblTitle: TLabel
      Width = 244
      Caption = 'Meta info about indices'
    end
  end
  inherited pnlMain: TPanel
    Width = 624
    Height = 407
    inherited pnlConnection: TPanel
      Width = 624
      Height = 157
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
      object btnFetch: TButton [1]
        Left = 6
        Top = 85
        Width = 76
        Height = 25
        Cursor = crHandPoint
        Caption = 'Fetch'
        Enabled = False
        TabOrder = 6
        OnClick = btnFetchClick
      end
      inherited cbDB: TComboBox
        TabOrder = 4
      end
      object rgMain: TRadioGroup
        Left = 6
        Top = 45
        Width = 190
        Height = 33
        Cursor = crHandPoint
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'mkIndexes'
          'mkIndexFields')
        TabOrder = 0
        OnClick = rgMainClick
      end
      object edtWildCard: TLabeledEdit
        Left = 245
        Top = 87
        Width = 121
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'WildCard:'
        LabelPosition = lpLeft
        TabOrder = 1
      end
      object edtIndexName: TLabeledEdit
        Left = 407
        Top = 54
        Width = 121
        Height = 21
        EditLabel.Width = 29
        EditLabel.Height = 13
        EditLabel.Caption = 'Index:'
        Enabled = False
        LabelPosition = lpLeft
        TabOrder = 2
        Text = '[]'
      end
      object edtTableName: TLabeledEdit
        Left = 245
        Top = 55
        Width = 121
        Height = 21
        EditLabel.Width = 30
        EditLabel.Height = 13
        EditLabel.Caption = 'Table:'
        LabelPosition = lpLeft
        TabOrder = 3
        Text = '[Customers]'
      end
      object mmInfo: TMemo
        Left = 6
        Top = 118
        Width = 612
        Height = 39
        Color = clInfoBk
        Lines.Strings = (
          
            'To fetch meta information click Fetch button. In the WildCard ed' +
            'it type the required template for selecting info. Use the radio '
          'buttons group to select the kind of meta info fetching.')
        TabOrder = 5
      end
    end
    inherited Console: TMemo
      Top = 162
      Width = 611
      Height = 239
    end
  end
  inherited pnlButtons: TPanel
    Top = 460
    Width = 624
    inherited bvlButtons: TBevel
      Width = 624
    end
    inherited btnClose: TButton
      Left = 545
    end
  end
end
