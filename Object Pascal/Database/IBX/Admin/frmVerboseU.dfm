object frmVerbose: TfrmVerbose
  Left = 225
  Top = 107
  Width = 616
  Height = 423
  Caption = 'Verbose Output'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object stbStatusBar: TStatusBar
    Left = 0
    Top = 376
    Width = 608
    Height = 20
    Panels = <
      item
        Width = 120
      end
      item
        Alignment = taCenter
        Width = 60
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object edOutput: TRichEdit
    Left = 0
    Top = 0
    Width = 608
    Height = 376
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 1
  end
end
