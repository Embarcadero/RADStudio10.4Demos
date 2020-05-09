//---------------------------------------------------------------------------

#ifndef MainFormUH
#define MainFormUH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Menus.hpp>
#include <Vcl.ToolWin.hpp>
#include <Vcl.Dialogs.hpp>
#include <WebView2.hpp>
#include <Winapi.ActiveX.hpp>
#include <Vcl.Edge.hpp>
//---------------------------------------------------------------------------
class TfrmMain : public TForm
{
__published:    // IDE-managed Components
    TPanel *pnlWebViewHost;
    TToolBar *tbToolbar;
    TToolButton *tbBack;
    TToolButton *tbForward;
    TToolButton *tbReload;
    TToolButton *tbCancel;
    TEdit *edtAddress;
    TToolButton *tbGo;
    TMainMenu *MainMenu;
    TMenuItem *mniFile;
    TMenuItem *mniFileSaveScreenShot;
    TMenuItem *mniFileGetDocumentTitle;
    TMenuItem *mniFileGetBrowserVersion;
    TMenuItem *mniScript;
    TMenuItem *mniScriptSubscribeToCDPEvent;
    TMenuItem *mniWindow;
    TMenuItem *mniWindowCreateNewWindow;
    TMenuItem *mniWindowCreateWebView;
    TMenuItem *mniWindowCloseWebView;
    TMenuItem *mniWindowCloseWindow;
    TMenuItem *mniView;
    TMenuItem *mniViewGetBounds;
    TMenuItem *mniViewWebViewArea;
    TMenuItem *mniViewWebViewArea25Percent;
    TMenuItem *mniViewWebViewArea50Percent;
    TMenuItem *mniViewWebViewArea75Percent;
    TMenuItem *mniViewWebViewArea100Percent;
    TMenuItem *mniViewWebViewZoom;
    TMenuItem *mniViewWebViewZoom50Percent;
    TMenuItem *mniViewWebViewZoom100Percent;
    TMenuItem *mniViewWebViewZoom200Percent;
    TMenuItem *mniViewSetFocus;
    TMenuItem *mniViewTabIn;
    TMenuItem *mniViewReverseTabIn;
    TMenuItem *mniProcess;
    TMenuItem *mniProcessCrashBrowser;
    TMenuItem *mniProcessBrowserInfo;
    TMenuItem *mniSettings;
    TMenuItem *mniSettingsToggleStatusBar;
    TMenuItem *mniSettingsToggleFullscreen;
    TMenuItem *mniSettingsToggleDevTools;
    TMenuItem *mniSettingsToggleBlockImages;
    TMenuItem *mniSettingsJavaScriptDialogs;
    TMenuItem *mniSettingsJavaScriptDialogsCustom;
    TMenuItem *mniSettingsJavaScriptDialogsDefault;
    TSaveDialog *dlgSaveFile;
    TMenuItem *mniScriptInjectScript;
    TEdgeBrowser *EdgeBrowser;
    void __fastcall FormResize(TObject *Sender);
    void __fastcall tbBackClick(TObject *Sender);
    void __fastcall tbForwardClick(TObject *Sender);
    void __fastcall tbReloadClick(TObject *Sender);
    void __fastcall tbCancelClick(TObject *Sender);
    void __fastcall edtAddressKeyPress(TObject *Sender, System::WideChar &Key);
    void __fastcall tbGoClick(TObject *Sender);
    void __fastcall mniFileSaveScreenShotClick(TObject *Sender);
    void __fastcall mniFileGetDocumentTitleClick(TObject *Sender);
    void __fastcall mniFileGetBrowserVersionClick(TObject *Sender);
    void __fastcall mniScriptSubscribeToCDPEventClick(TObject *Sender);
    void __fastcall mniWindowCloseWebViewClick(TObject *Sender);
    void __fastcall mniWindowCreateWebViewClick(TObject *Sender);
    void __fastcall mniWindowCreateNewWindowClick(TObject *Sender);
    void __fastcall mniWindowCloseWindowClick(TObject *Sender);
    void __fastcall mniViewGetBoundsClick(TObject *Sender);
    void __fastcall mniViewWebViewArea25PercentClick(TObject *Sender);
    void __fastcall mniViewWebViewArea50PercentClick(TObject *Sender);
    void __fastcall mniViewWebViewArea75PercentClick(TObject *Sender);
    void __fastcall mniViewWebViewArea100PercentClick(TObject *Sender);
    void __fastcall mniViewWebViewZoom50PercentClick(TObject *Sender);
    void __fastcall mniViewWebViewZoom100PercentClick(TObject *Sender);
    void __fastcall mniViewWebViewZoom200PercentClick(TObject *Sender);
    void __fastcall mniViewSetFocusClick(TObject *Sender);
    void __fastcall mniViewTabInClick(TObject *Sender);
    void __fastcall mniViewReverseTabInClick(TObject *Sender);
    void __fastcall mniProcessBrowserInfoClick(TObject *Sender);
    void __fastcall mniProcessCrashBrowserClick(TObject *Sender);
    void __fastcall mniSettingsToggleFullscreenClick(TObject *Sender);
    void __fastcall mniSettingsToggleStatusBarClick(TObject *Sender);
    void __fastcall mniSettingsToggleDevToolsClick(TObject *Sender);
    void __fastcall mniSettingsToggleBlockImagesClick(TObject *Sender);
    void __fastcall mniSettingsJavaScriptDialogsDefaultClick(TObject *Sender);
    void __fastcall mniSettingsJavaScriptDialogsCustomClick(TObject *Sender);
    void __fastcall mniScriptInjectScriptClick(TObject *Sender);
    void __fastcall EdgeBrowserCapturePreviewCompleted(TCustomEdgeBrowser* Sender, HRESULT AResult);
    void __fastcall EdgeBrowserContainsFullScreenElementChanged(TCustomEdgeBrowser* Sender, bool ContainsFullScreenElement);
    void __fastcall EdgeBrowserContentLoading(TCustomEdgeBrowser* Sender, bool IsErrorPage, TUInt64 NavigationID);
    void __fastcall EdgeBrowserCreateWebViewCompleted(TCustomEdgeBrowser* Sender, HRESULT AResult);
    void __fastcall EdgeBrowserDevToolsProtocolEventReceived(TCustomEdgeBrowser* Sender, const String CDPEventName, const String ParameterObjectAsJson);
    void __fastcall EdgeBrowserDocumentTitleChanged(TCustomEdgeBrowser* Sender, const String ADocumentTitle);
    void __fastcall EdgeBrowserExecuteScript(TCustomEdgeBrowser* Sender, HRESULT AResult, const System::UnicodeString AResultObjectAsJson);
    void __fastcall EdgeBrowserFrameNavigationStarting(TCustomEdgeBrowser* Sender, TNavigationStartingEventArgs* Args);
    void __fastcall EdgeBrowserHistoryChanged(TCustomEdgeBrowser* Sender);
    void __fastcall EdgeBrowserNavigationStarting(TCustomEdgeBrowser* Sender, TNavigationStartingEventArgs* Args);
    void __fastcall EdgeBrowserNavigationCompleted(TCustomEdgeBrowser* Sender, bool IsSuccess, TOleEnum WebErrorStatus);
    void __fastcall EdgeBrowserNewWindowRequested(TCustomEdgeBrowser* Sender, TNewWindowRequestedEventArgs *Args);
    void __fastcall EdgeBrowserPermissionRequested(TCustomEdgeBrowser* Sender, TPermissionRequestedEventArgs *Args);
    void __fastcall EdgeBrowserProcessFailed(TCustomEdgeBrowser* Sender, TOleEnum FailureType);
    void __fastcall EdgeBrowserScriptDialogOpening(TCustomEdgeBrowser* Sender, TScriptDialogOpeningEventArgs *Args);
    void __fastcall EdgeBrowserSourceChanged(TCustomEdgeBrowser* Sender, bool IsNewDocument);
    void __fastcall EdgeBrowserWebMessageReceived(TCustomEdgeBrowser* Sender, TWebMessageReceivedEventArgs *Args);
    void __fastcall EdgeBrowserWebResourceRequested(TCustomEdgeBrowser* Sender, TWebResourceRequestedEventArgs *Args);
    void __fastcall EdgeBrowserWindowCloseRequested(TObject *Sender);
    void __fastcall EdgeBrowserZoomFactorChanged(TCustomEdgeBrowser* Sender, double AZoom);
    void __fastcall EdgeBrowserFrameNavigationCompleted(TCustomEdgeBrowser *Sender, bool IsSuccess, TOleEnum WebErrorStatus);

private:    // User declarations
    bool FAllowFullScreen;
    bool FBlockImages;
    void ActivateHintNOW(String Txt, TPoint Pt);
public:        // User declarations
    __fastcall TfrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMain *frmMain;
//---------------------------------------------------------------------------
#endif
