inherited frmClients: TfrmClients
  Left = 312
  Top = 173
  Width = 617
  Height = 561
  Caption = 'Monitor clients'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 609
    inherited bvlTitle: TBevel
      Width = 551
    end
    inherited imgAnyDAC: TImage
      Left = 551
    end
    inherited lblTitle: TLabel
      Width = 156
      Caption = 'Monitor clients'
    end
  end
  inherited pnlMain: TPanel
    Width = 609
    Height = 437
    inherited pnlConnection: TPanel
      Width = 609
      Height = 69
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
      object rgClients: TRadioGroup
        Left = 168
        Top = 4
        Width = 289
        Height = 37
        Caption = 'Monitor client'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'No monitoring'
          'Remote'
          'Flat file')
        TabOrder = 1
      end
      object mmInfo: TMemo
        Left = 6
        Top = 47
        Width = 597
        Height = 22
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clInfoBk
        Lines.Strings = (
          'If you wish see the Moni Remote client work run FDMonitor tool')
        ReadOnly = True
        TabOrder = 2
      end
    end
    inherited Console: TMemo
      Top = 90
      Width = 598
      Height = 340
    end
    object Panel1: TPanel
      Left = 0
      Top = 69
      Width = 609
      Height = 19
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '  Flat file records:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 2
    end
  end
  inherited pnlButtons: TPanel
    Top = 490
    Width = 609
    inherited bvlButtons: TBevel
      Width = 609
    end
    inherited btnClose: TButton
      Left = 530
    end
  end
  object FDMoniRemoteClientLink1: TFDMoniRemoteClientLink
    Left = 328
    Top = 264
  end
  object FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink
    Left = 424
    Top = 264
  end
end
