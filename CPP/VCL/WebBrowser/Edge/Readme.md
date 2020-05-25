EdgeBrowser demo
================

This sample C++ application demonstrates the use of the `TEdgeBrowser` VCL component.

`TEdgeBrowser` is a successor to `TWebBrowser`. Where `TWebBrowser` uses the Internet Explorer WebBrowser control as its browser UI, `TEdgeBrowser` uses Edge browser's WebView2 control. Because if this `TEdgeBrowser` relies on:

1.  the Edge browser being installed
2.  the WebView2 control loader DLL being available (part of the Microsoft WebView2 SDK)

Please see the documentation for `TEdgeBrowser` for full details on how to get it up and running with the Edge (Chromium) browser and the WebView2 browser control

The sample includes event handlers for all of the `TEdgeBrowser` component's events and these mostly surface events of the WebView2 control itself.

WebView2 documentation can be found at:

*   https://docs.microsoft.com/en-us/microsoft-edge/hosting/webview2
*   https://docs.microsoft.com/en-us/microsoft-edge/hosting/webview2/gettingstarted
*   https://docs.microsoft.com/en-us/microsoft-edge/hosting/webview2/reference-webview2