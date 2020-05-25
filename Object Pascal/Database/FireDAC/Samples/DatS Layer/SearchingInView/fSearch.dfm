inherited frmSearch: TfrmSearch
  Left = 385
  Top = 261
  Width = 572
  Height = 581
  Caption = 'Searching in View'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 564
    inherited bvlTitle: TBevel
      Width = 506
    end
    inherited imgAnyDAC: TImage
      Left = 506
    end
    inherited lblTitle: TLabel
      Width = 185
      Caption = 'Searching in View'
    end
  end
  inherited pnlMain: TPanel
    Width = 564
    Height = 457
    inherited pnlConnection: TPanel
      Width = 564
      Height = 153
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
      object Label3: TLabel [1]
        Left = 149
        Top = 52
        Width = 216
        Height = 13
        Caption = 'ShipperID            CompanyName          Phone'
      end
      object Label4: TLabel [2]
        Left = 109
        Top = 124
        Width = 89
        Height = 13
        Alignment = taRightJustify
        Caption = 'Locate expression:'
      end
      object btnFindSorted: TButton [3]
        Left = 11
        Top = 57
        Width = 76
        Height = 25
        Caption = 'Find sorted'
        Enabled = False
        TabOrder = 5
        OnClick = btnFindSortedClick
      end
      object btnLocate: TButton [4]
        Left = 11
        Top = 121
        Width = 76
        Height = 25
        Caption = 'Locate'
        Enabled = False
        TabOrder = 6
        OnClick = btnLocateClick
      end
      object btnFindUnSorted: TButton [5]
        Left = 11
        Top = 88
        Width = 76
        Height = 25
        Caption = 'Find unsorted'
        Enabled = False
        TabOrder = 7
        OnClick = btnFindUnSortedClick
      end
      inherited cbDB: TComboBox
        TabOrder = 4
      end
      object edtShipperId: TLabeledEdit
        Left = 149
        Top = 71
        Width = 29
        Height = 21
        EditLabel.Width = 35
        EditLabel.Height = 13
        EditLabel.Caption = 'Values:'
        LabelPosition = lpLeft
        TabOrder = 0
        Text = '1'
      end
      object edtCompanyName: TEdit
        Left = 232
        Top = 71
        Width = 97
        Height = 21
        TabOrder = 1
        Text = 'Speedy Express'
      end
      object edtPhone: TEdit
        Left = 336
        Top = 71
        Width = 106
        Height = 21
        TabOrder = 2
        Text = '(503) 555-9831'
      end
      object cbLocate: TComboBox
        Left = 203
        Top = 121
        Width = 137
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        Text = 'ShipperID = 2'
        Items.Strings = (
          'ShipperID = 2'
          'CompanyName = '#39'Federal Shipping'#39)
      end
    end
    inherited Console: TMemo
      Top = 153
      Width = 554
      Height = 300
    end
  end
  inherited pnlButtons: TPanel
    Top = 510
    Width = 564
    inherited bvlButtons: TBevel
      Width = 564
    end
    inherited btnClose: TButton
      Left = 485
    end
  end
end
