object frmBrowser: TfrmBrowser
  Left = 0
  Top = 0
  Caption = 'TWebBrowser Sample'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tbToolbar: TToolBar
    Left = 0
    Top = 0
    Width = 635
    Height = 21
    AutoSize = True
    ButtonHeight = 21
    ButtonWidth = 47
    Caption = 'tbToolbar'
    Color = clBtnFace
    ParentColor = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = False
    TabOrder = 0
    Wrapable = False
    object tbBack: TToolButton
      Left = 0
      Top = 0
      Caption = 'Back'
      Enabled = False
      OnClick = tbBackClick
    end
    object tbForward: TToolButton
      Left = 47
      Top = 0
      Caption = 'Forward'
      Enabled = False
      OnClick = tbForwardClick
    end
    object tbReload: TToolButton
      Left = 94
      Top = 0
      Caption = 'Reload'
      Enabled = False
      OnClick = tbReloadClick
    end
    object tbCancel: TToolButton
      Left = 141
      Top = 0
      Caption = 'Cancel'
      Enabled = False
      OnClick = tbCancelClick
    end
    object edtAddress: TEdit
      Left = 188
      Top = 0
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
      OnKeyPress = edtAddressKeyPress
    end
    object tbGo: TToolButton
      Left = 309
      Top = 0
      Caption = 'Go'
      Enabled = False
      ImageIndex = 0
      OnClick = tbGoClick
    end
  end
  object WebBrowser: TWebBrowser
    Left = 0
    Top = 21
    Width = 635
    Height = 259
    Align = alClient
    TabOrder = 1
    OnCommandStateChange = WebBrowserCommandStateChange
    OnTitleChange = WebBrowserTitleChange
    OnBeforeNavigate2 = WebBrowserBeforeNavigate2
    OnNewWindow2 = WebBrowserNewWindow2
    OnNavigateComplete2 = WebBrowserNavigateComplete2
    OnDocumentComplete = WebBrowserDocumentComplete
    OnNavigateError = WebBrowserNavigateError
    OnNewWindow3 = WebBrowserNewWindow3
    ControlData = {
      4C000000813400006A1500000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 280
    Width = 635
    Height = 19
    Panels = <
      item
        Width = 60
      end
      item
        Alignment = taCenter
        Width = 100
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object Timer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = TimerTimer
    Left = 504
    Top = 104
  end
end
