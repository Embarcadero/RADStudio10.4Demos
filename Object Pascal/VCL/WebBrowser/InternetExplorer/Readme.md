WebBrowser demo
===============

This sample Delphi application demonstrates the use of the `TWebBrowser` VCL component.

`TWebBrowser` has traditionally been purely a driver for the Internet Explorer WebBrowser control, but as of RAD Studio 10.4 it has been enhanced to have 'dual personality' for the purposes of assisting with migration away from the dated IE control.

Whilst there is the new `TEdgeBrowser`, which makes use of the Edge browser's WebView2 browser control, this new component is not a plug-in replacement for a `TWebBrowser`. As such `TWebBrowser` can function to a certain extent using the Edge browser's WebView2 control thanks to use of an embedded `TEdgeBrowser` component. There is a new property, `SelectedEngine`, which is used to indicate which browser control you desire or require. Supported values are:

*   `TWebBrowser.TSelectedEngine.IEOnly` - the `TWebBrowser` functions as it always has, employing the IE WebBrowser control
*   `TWebBrowser.TSelectedEngine.EdgeIfAvailable` - the `TWebBrowser` uses the Edge WebView2 browser control if possible, otherwise it falls back to the traditional IE WebBrowser control
*   `TWebBrowser.TSelectedEngine.EdgeOnly` - the `TWebBrowser` attempts to use the Edge WebView2 browser control, however if this is not possible then no browsing is possible as there is no fallback option

Based upon the browser control that `TWebBrowser` is using the `ActiveEngine` property has these values:

*   `TWebBrowser.TActiveEngine.None` - no browser control is in use; if `EdgeOnly` was requested via `SelectedEngine` then the Edge browser could not be instantiated
*   `TWebBrowser.TActiveEngine.NoneYet` - no browser control is in use yet, but an attempt is being made to initialize the Edge WebView2 browser control
*   `TWebBrowser.TActiveEngine.IE` - the Internet Explorer WebBrowser browser control is in use
*   `TWebBrowser.TActiveEngine.Edge` - the Edge WebView2 browser control is in use

If `TWebBrowser` is to try to use the Edge WebView2 browser control (which it does using an instance of the `TEdgeBrowser` component class), then to work this will rely upon:

1.  the Edge browser being installed
2.  the WebView2 control loader DLL being available (part of the Microsoft WebView2 SDK)

Please see the documentation for `TEdgeBrowser` for full details on how to get it up and running with the Edge (Chromium) browser and the WebView2 browser control

The sample includes event handlers for a number of the `TWebBrowser` component's events showing how these can function regardless of which browser is active.
