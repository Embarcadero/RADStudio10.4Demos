inherited frmMetaTables: TfrmMetaTables
  Left = 337
  Top = 230
  Width = 679
  Height = 518
  Caption = 'Meta info about tables'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 671
    inherited bvlTitle: TBevel
      Width = 613
    end
    inherited imgAnyDAC: TImage
      Left = 613
    end
    inherited lblTitle: TLabel
      Width = 236
      Caption = 'Meta info about tables'
    end
  end
  inherited pnlMain: TPanel
    Width = 671
    Height = 394
    inherited pnlConnection: TPanel
      Width = 671
      Height = 129
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
      object Label1: TLabel [1]
        Left = 362
        Top = 57
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Table:'
      end
      object btnFetch: TButton [2]
        Left = 542
        Top = 51
        Width = 76
        Height = 25
        Cursor = crHandPoint
        Caption = 'Fetch'
        Enabled = False
        TabOrder = 5
        OnClick = btnFetchClick
      end
      inherited cbDB: TComboBox
        TabOrder = 3
      end
      object rgMain: TRadioGroup
        Left = 6
        Top = 43
        Width = 190
        Height = 33
        Cursor = crHandPoint
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'mkTables'
          'mkTableFields')
        TabOrder = 0
        OnClick = rgMainClick
      end
      object edtWildCard: TLabeledEdit
        Left = 249
        Top = 53
        Width = 107
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'WildCard:'
        LabelPosition = lpLeft
        TabOrder = 1
        Text = '%ustom%'
      end
      object cbTable: TComboBox
        Left = 397
        Top = 53
        Width = 137
        Height = 21
        Enabled = False
        ItemHeight = 13
        TabOrder = 2
        Items.Strings = (
          'Categories'
          'Customers'
          'Orders'
          'Products')
      end
      object mmInfo: TMemo
        Left = 5
        Top = 84
        Width = 659
        Height = 33
        Anchors = [akLeft, akRight, akBottom]
        Color = clInfoBk
        Lines.Strings = (
          
            'To fetch meta information click Fetch button. In the WildCard ed' +
            'it type the required template for selecting info. Use the radio ' +
            'buttons group '
          'to select the kind of meta info fetching.')
        TabOrder = 4
      end
    end
    inherited Console: TMemo
      Left = 5
      Top = 124
      Width = 660
      Height = 263
    end
  end
  inherited pnlButtons: TPanel
    Top = 447
    Width = 671
    inherited bvlButtons: TBevel
      Width = 671
    end
    inherited btnClose: TButton
      Left = 592
    end
  end
end
