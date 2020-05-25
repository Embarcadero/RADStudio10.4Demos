inherited frmAddTables: TfrmAddTables
  Left = 340
  Top = 185
  Width = 521
  Height = 425
  Caption = 'Add tables'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 513
    inherited bvlTitle: TBevel
      Width = 455
    end
    inherited imgAnyDAC: TImage
      Left = 455
    end
    inherited lblTitle: TLabel
      Width = 110
      Caption = 'Add tables'
    end
  end
  inherited pnlMain: TPanel
    Width = 513
    Height = 301
    inherited pnlControlButtons: TPanel
      Width = 513
      Height = 97
      object btnCreateTables: TButton
        Left = 6
        Top = 8
        Width = 76
        Height = 25
        Caption = 'Create tables'
        TabOrder = 1
        OnClick = btnCreateTablesClick
      end
      object btnAddConstr: TButton
        Left = 88
        Top = 8
        Width = 105
        Height = 25
        Caption = 'Add constraints'
        TabOrder = 2
        OnClick = btnAddConstrClick
      end
      object Memo1: TMemo
        Left = 0
        Top = 40
        Width = 513
        Height = 57
        Align = alBottom
        Color = clInfoBk
        Lines.Strings = (
          
            'This demo shows how to create DatS tables, define DatS constrain' +
            'ts, fill data.'
          'For details see fAddTables unit.')
        TabOrder = 0
      end
    end
    inherited Console: TMemo
      Top = 97
      Width = 513
      Height = 204
    end
  end
  inherited pnlButtons: TPanel
    Top = 354
    Width = 513
    inherited bvlButtons: TBevel
      Width = 513
    end
    inherited btnClose: TButton
      Left = 434
    end
  end
end
