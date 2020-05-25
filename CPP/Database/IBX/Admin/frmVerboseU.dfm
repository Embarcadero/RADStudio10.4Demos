object frmVerbose: TfrmVerbose
  Left = 0
  Top = 0
  Caption = 'Verbose Output'
  ClientHeight = 379
  ClientWidth = 567
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object stbStatusBar: TStatusBar
    Left = 0
    Top = 359
    Width = 567
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
    ExplicitLeft = -33
    ExplicitWidth = 600
  end
  object edOutput: TRichEdit
    Left = 0
    Top = 0
    Width = 567
    Height = 359
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
    ExplicitLeft = -33
    ExplicitWidth = 600
    ExplicitHeight = 365
  end
end
