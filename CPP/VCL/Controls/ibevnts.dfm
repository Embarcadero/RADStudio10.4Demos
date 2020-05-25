object IBEAEventsEditor: TIBEAEventsEditor
  Left = 292
  Top = 156
  BorderStyle = bsDialog
  Caption = 'EventAlerter Events'
  ClientHeight = 251
  ClientWidth = 306
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Name = 'Default'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 306
    Height = 251
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 0
    object Panel2: TPanel
      Left = 9
      Top = 8
      Width = 289
      Height = 201
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object RequestedEvents: TLabel
        Left = 10
        Top = 4
        Width = 88
        Height = 13
        Caption = 'Requested Events'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Default'
        Font.Style = []
        ParentFont = False
      end
      object cEvents: TStringGrid
        Left = 9
        Top = 22
        Width = 271
        Height = 171
        ColCount = 2
        DefaultRowHeight = 16
        RowCount = 15
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSizing, goColSizing, goEditing, goTabs, goAlwaysShowEditor]
        ScrollBars = ssVertical
        TabOrder = 0
        ColWidths = (
          27
          227)
      end
    end
    object bOK: TButton
      Left = 140
      Top = 219
      Width = 75
      Height = 25
      Caption = '&OK'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Name = 'Default'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 1
    end
    object bCancel: TButton
      Left = 220
      Top = 219
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Name = 'Default'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 2
    end
  end
end
