object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Main Form'
  ClientHeight = 291
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDefault
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 16
  object tbToolbar: TToolBar
    Left = 0
    Top = 0
    Width = 633
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 55
    Caption = 'tbToolbar'
    ShowCaptions = True
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
      Left = 55
      Top = 0
      Caption = 'Forward'
      Enabled = False
      OnClick = tbForwardClick
    end
    object tbReload: TToolButton
      Left = 110
      Top = 0
      Caption = 'Reload'
      Enabled = False
      OnClick = tbReloadClick
    end
    object tbCancel: TToolButton
      Left = 165
      Top = 0
      Caption = 'Cancel'
      Enabled = False
      OnClick = tbCancelClick
    end
    object edtAddress: TEdit
      Left = 220
      Top = 0
      Width = 121
      Height = 24
      Enabled = False
      TabOrder = 0
      OnKeyPress = edtAddressKeyPress
    end
    object tbGo: TToolButton
      Left = 341
      Top = 0
      Caption = 'Go'
      Enabled = False
      ImageIndex = 0
      OnClick = tbGoClick
    end
  end
  object pnlWebViewHost: TPanel
    Left = 0
    Top = 29
    Width = 633
    Height = 262
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object EdgeBrowser: TEdgeBrowser
      Left = 0
      Top = 0
      Width = 633
      Height = 262
      Align = alClient
      TabOrder = 0
      TabStop = True
      OnCapturePreviewCompleted = EdgeBrowserCapturePreviewCompleted
      OnContainsFullScreenElementChanged = EdgeBrowserContainsFullScreenElementChanged
      OnContentLoading = EdgeBrowserContentLoading
      OnCreateWebViewCompleted = EdgeBrowserCreateWebViewCompleted
      OnDevToolsProtocolEventReceived = EdgeBrowserDevToolsProtocolEventReceived
      OnDocumentTitleChanged = EdgeBrowserDocumentTitleChanged
      OnExecuteScript = EdgeBrowserExecuteScript
      OnFrameNavigationStarting = EdgeBrowserFrameNavigationStarting
      OnFrameNavigationCompleted = EdgeBrowserFrameNavigationCompleted
      OnHistoryChanged = EdgeBrowserHistoryChanged
      OnNavigationStarting = EdgeBrowserNavigationStarting
      OnNavigationCompleted = EdgeBrowserNavigationCompleted
      OnNewWindowRequested = EdgeBrowserNewWindowRequested
      OnPermissionRequested = EdgeBrowserPermissionRequested
      OnProcessFailed = EdgeBrowserProcessFailed
      OnScriptDialogOpening = EdgeBrowserScriptDialogOpening
      OnSourceChanged = EdgeBrowserSourceChanged
      OnWebMessageReceived = EdgeBrowserWebMessageReceived
      OnWebResourceRequested = EdgeBrowserWebResourceRequested
      OnWindowCloseRequested = EdgeBrowserWindowCloseRequested
      OnZoomFactorChanged = EdgeBrowserZoomFactorChanged
    end
  end
  object MainMenu: TMainMenu
    Left = 272
    Top = 88
    object mniFile: TMenuItem
      Caption = '&File'
      object mniFileSaveScreenShot: TMenuItem
        Caption = 'Save Screenshot'
        ShortCut = 16467
        OnClick = mniFileSaveScreenShotClick
      end
      object mniFileGetDocumentTitle: TMenuItem
        Caption = 'Get Document Title'
        OnClick = mniFileGetDocumentTitleClick
      end
      object mniFileGetBrowserVersion: TMenuItem
        Caption = 'Get Browser Version'
        OnClick = mniFileGetBrowserVersionClick
      end
    end
    object mniScript: TMenuItem
      Caption = '&Script'
      object mniScriptInjectScript: TMenuItem
        Caption = 'Inject script'
        OnClick = mniScriptInjectScriptClick
      end
      object mniScriptSubscribeToCDPEvent: TMenuItem
        Caption = 'Subscribe to CDP event'
        OnClick = mniScriptSubscribeToCDPEventClick
      end
    end
    object mniWindow: TMenuItem
      Caption = '&Window'
      object mniWindowCloseWebView: TMenuItem
        Caption = 'Close WebView'
        ShortCut = 16471
        OnClick = mniWindowCloseWebViewClick
      end
      object mniWindowCreateWebView: TMenuItem
        Caption = 'Create WebView'
        OnClick = mniWindowCreateWebViewClick
      end
      object mniWindowCloseWindow: TMenuItem
        Caption = 'Close Window'
        ShortCut = 16465
        OnClick = mniWindowCloseWindowClick
      end
      object mniWindowCreateNewWindow: TMenuItem
        Caption = 'Create New Window'
        ShortCut = 16462
        OnClick = mniWindowCreateNewWindowClick
      end
    end
    object mniView: TMenuItem
      Caption = '&View'
      object mniViewGetBounds: TMenuItem
        Caption = 'Get WebView Bounds'
        OnClick = mniViewGetBoundsClick
      end
      object mniViewWebViewArea: TMenuItem
        Caption = 'WebView Area'
        object mniViewWebViewArea25Percent: TMenuItem
          Caption = '25%'
          OnClick = mniViewWebViewArea25PercentClick
        end
        object mniViewWebViewArea50Percent: TMenuItem
          Caption = '50%'
          OnClick = mniViewWebViewArea50PercentClick
        end
        object mniViewWebViewArea75Percent: TMenuItem
          Caption = '75%'
          OnClick = mniViewWebViewArea75PercentClick
        end
        object mniViewWebViewArea100Percent: TMenuItem
          Caption = '100%'
          OnClick = mniViewWebViewArea100PercentClick
        end
      end
      object mniViewWebViewZoom: TMenuItem
        Caption = 'WebView Zoom'
        object mniViewWebViewZoom50Percent: TMenuItem
          Caption = '0.5x'
          OnClick = mniViewWebViewZoom50PercentClick
        end
        object mniViewWebViewZoom100Percent: TMenuItem
          Caption = '1.0x'
          OnClick = mniViewWebViewZoom100PercentClick
        end
        object mniViewWebViewZoom200Percent: TMenuItem
          Caption = '2.0x'
          OnClick = mniViewWebViewZoom200PercentClick
        end
      end
      object mniViewSetFocus: TMenuItem
        Caption = 'Set Focus'
        OnClick = mniViewSetFocusClick
      end
      object mniViewTabIn: TMenuItem
        Caption = 'Tab In'
        OnClick = mniViewTabInClick
      end
      object mniViewReverseTabIn: TMenuItem
        Caption = 'Reverse Tab In'
        OnClick = mniViewReverseTabInClick
      end
    end
    object mniProcess: TMenuItem
      Caption = '&Process'
      object mniProcessBrowserInfo: TMenuItem
        Caption = 'Browser Process Info'
        OnClick = mniProcessBrowserInfoClick
      end
      object mniProcessCrashBrowser: TMenuItem
        Caption = 'Crash Browser Process'
        OnClick = mniProcessCrashBrowserClick
      end
    end
    object mniSettings: TMenuItem
      Caption = '&Settings'
      object mniSettingsToggleFullscreen: TMenuItem
        Caption = 'Toggle Fullscreen allowed'
        OnClick = mniSettingsToggleFullscreenClick
      end
      object mniSettingsToggleStatusBar: TMenuItem
        Caption = 'Toggle Status Bar enabled'
        OnClick = mniSettingsToggleStatusBarClick
      end
      object mniSettingsToggleDevTools: TMenuItem
        Caption = 'Toggle Dev Tools enabled'
        OnClick = mniSettingsToggleDevToolsClick
      end
      object mniSettingsToggleBlockImages: TMenuItem
        Caption = 'Toggle Block images'
        OnClick = mniSettingsToggleBlockImagesClick
      end
      object mniSettingsJavaScriptDialogs: TMenuItem
        Caption = 'JavaScript Dialogs'
        object mniSettingsJavaScriptDialogsDefault: TMenuItem
          Caption = 'Use Default Script Dialogs'
          OnClick = mniSettingsJavaScriptDialogsDefaultClick
        end
        object mniSettingsJavaScriptDialogsCustom: TMenuItem
          Caption = 'Use Custom Script Dialogs'
          OnClick = mniSettingsJavaScriptDialogsCustomClick
        end
      end
    end
  end
  object dlgSaveFile: TSaveDialog
    FileName = 'WebView2_Screenshot.png'
    Filter = 'PNG File|*.png'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 384
    Top = 85
  end
end
