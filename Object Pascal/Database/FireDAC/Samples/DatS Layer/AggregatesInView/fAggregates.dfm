inherited frmAggregates: TfrmAggregates
  Left = 322
  Top = 266
  Width = 580
  Height = 419
  Caption = 'Aggregates'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 572
    inherited bvlTitle: TBevel
      Width = 514
    end
    inherited imgAnyDAC: TImage
      Left = 514
    end
    inherited lblTitle: TLabel
      Width = 119
      Caption = 'Aggregates'
    end
  end
  inherited pnlMain: TPanel
    Width = 572
    Height = 295
    inherited pnlControlButtons: TPanel
      Width = 572
      Height = 73
      object btnCreateTable: TButton
        Left = 6
        Top = 6
        Width = 97
        Height = 25
        Caption = '1. Create table'
        TabOrder = 1
        OnClick = btnCreateTableClick
      end
      object btnCreateView: TButton
        Left = 109
        Top = 6
        Width = 97
        Height = 25
        Caption = '2. Create view'
        Enabled = False
        TabOrder = 2
        OnClick = btnCreateViewClick
      end
      object btnInsert: TButton
        Left = 212
        Top = 6
        Width = 97
        Height = 25
        Caption = '3. Insert a row'
        Enabled = False
        TabOrder = 3
        OnClick = btnInsertClick
      end
      object Memo1: TMemo
        Left = 0
        Top = 37
        Width = 572
        Height = 36
        Align = alBottom
        Color = clInfoBk
        Lines.Strings = (
          
            'This demo shows how to create DatS aggregates, create DatS views' +
            ', fill data.'
          
            'For details see fAggregates unit. First, press "Create table", t' +
            'hen "Create view" and "Insert a row".')
        TabOrder = 0
      end
    end
    inherited Console: TMemo
      Top = 73
      Width = 572
      Height = 222
    end
  end
  inherited pnlButtons: TPanel
    Top = 348
    Width = 572
    inherited bvlButtons: TBevel
      Width = 572
    end
    inherited btnClose: TButton
      Left = 493
    end
  end
end
