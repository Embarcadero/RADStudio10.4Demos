object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'TWebBrowser Sample'
  ClientHeight = 179
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    315
    179)
  PixelsPerInch = 120
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 16
    Top = 16
    Width = 281
    Height = 145
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = ' Create a browser window '
    TabOrder = 0
    DesignSize = (
      281
      145)
    object btnBrowserIEOnly: TButton
      Left = 16
      Top = 24
      Width = 249
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = 'IE WebBrowser'
      TabOrder = 0
      OnClick = btnBrowserIEOnlyClick
    end
    object btnBrowserEdgeIfAvailable: TButton
      Left = 16
      Top = 64
      Width = 249
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Edge WebView2 (if available, else IE)'
      TabOrder = 1
      OnClick = btnBrowserEdgeIfAvailableClick
    end
    object btnBrowserEdgeOnly: TButton
      Left = 16
      Top = 103
      Width = 249
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Edge WebView2 (only)'
      TabOrder = 2
      OnClick = btnBrowserEdgeOnlyClick
    end
  end
end
