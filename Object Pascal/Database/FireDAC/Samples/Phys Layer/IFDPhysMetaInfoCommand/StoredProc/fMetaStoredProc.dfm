inherited frmMetaStoredProc: TfrmMetaStoredProc
  Left = 310
  Top = 204
  Width = 787
  Height = 533
  Caption = 'Meta info about packages, stored procs'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 779
    inherited bvlTitle: TBevel
      Width = 721
    end
    inherited imgAnyDAC: TImage
      Left = 721
    end
    inherited lblTitle: TLabel
      Width = 392
      Caption = 'Meta info about package, stored proc'
    end
  end
  inherited pnlMain: TPanel
    Width = 779
    Height = 409
    inherited pnlConnection: TPanel
      Width = 779
      Height = 151
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
      object btnFetch: TButton [1]
        Left = 6
        Top = 86
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
        Top = 44
        Width = 270
        Height = 33
        Cursor = crHandPoint
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'mkPackages'
          'mkProcs'
          'mkProcArgs')
        TabOrder = 0
        OnClick = rgMainClick
      end
      object edtWildCard: TLabeledEdit
        Left = 332
        Top = 87
        Width = 121
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'WildCard:'
        LabelPosition = lpLeft
        TabOrder = 1
      end
      object edtProcName: TLabeledEdit
        Left = 488
        Top = 55
        Width = 121
        Height = 21
        EditLabel.Width = 25
        EditLabel.Height = 13
        EditLabel.Caption = 'Proc:'
        Enabled = False
        LabelPosition = lpLeft
        TabOrder = 2
      end
      object edtPackage: TLabeledEdit
        Left = 332
        Top = 55
        Width = 121
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Package:'
        LabelPosition = lpLeft
        TabOrder = 3
      end
      object mmInfo: TMemo
        Left = 6
        Top = 118
        Width = 769
        Height = 33
        Anchors = [akLeft, akRight, akBottom]
        Color = clInfoBk
        Lines.Strings = (
          
            'To fetch meta information click Fetch button. In the WildCard ed' +
            'it type the required template for selecting info. Use the radio ' +
            'buttons group to select the kind of '
          'meta info fetching.')
        TabOrder = 5
      end
    end
    inherited Console: TMemo
      Top = 157
      Width = 768
      Height = 245
    end
  end
  inherited pnlButtons: TPanel
    Top = 462
    Width = 779
    inherited bvlButtons: TBevel
      Width = 779
    end
    inherited btnClose: TButton
      Left = 699
      Width = 76
    end
  end
end
