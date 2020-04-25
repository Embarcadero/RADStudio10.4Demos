RTL.HttpAsyncDownload Sample[]()
# RTL.HttpAsyncDownload Sample 


This is an example of how to use the [HTTP Client](http://docwiki.embarcadero.com/Libraries/en/System.Net.HttpClient) API to download a file using an asynchronous HTTP request.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 Stop / Restart the Download](#Stop_.2F_Restart_the_Download)

* [4 Implementation](#Implementation)

* [4.1 TFormDownloadDemo](#TFormDownloadDemo)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **HttpDownload** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* `Object Pascal\RTL\HttpAsyncDownload`
* `CPP\RTL\HttpAsyncDownloadDemo`

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/RTL/HttpAsyncDownload](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/RTL/HttpAsyncDownload)
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/RTL/HttpAsyncDownloadDemo/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/RTL/HttpAsyncDownloadDemo/)

## Description 

This application uses the [HTTP Client](http://docwiki.embarcadero.com/Libraries/en/System.Net.HttpClient) API to download a file. The download is an asynchronous call that does not block the application.The application uses the following controls:

* `EditFileName`: Allows you to specify the name of the file.
* `EditURL`: Allows you to provide a URL of a file.
* `BStartDownload`: Fires the `BStartDownloadClick` event handler.
* `LabelGlobalSpeed`: Displays the average download speed.
* `ImageList1`: Holds the "stop" button image.
* `BStopDownload`: Fires the `ButtonCancelClick` event handler.
* `ProgressBarDownload`: Displays the progress of the download.
* `Memo1`: Displays the messages from the application for the user.

## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **HttpAsyncDownloadDemo.dproj**.
*  C++: **HttpAsyncDownloadDemoCPP.cbproj**.

2.  Press **F9** or choose **Run > Run**.
3.  Enter the file name for the file that you want to download.
4.  Enter the URL of the file that you want to download.
5.  Click the **Start download** button control.
The location where the file is downloaded depends on the operating system. On Windows, the location is the `MyDocuments` folder. See [GetDocumentsPath](http://docwiki.embarcadero.com/Libraries/en/System.IOUtils.TPath.GetDocumentsPath) for more information.
### Stop / Restart the Download 

To stop the download of the file, press the "stop" button (the red square) next to the progress bar. When the download is complete or if you stop the download of the file, you can restart the download of the file by pressing the `Start Download` button. 
## Implementation 

This application creates an instance of [THTTPClient](http://docwiki.embarcadero.com/Libraries/en/System.Net.HttpClient.THTTPClient) to:
*  Connect to the server.
*  Receive response data for one or more requests from the server.
*  Start the download of the file with an asynchronous HTTP request.

### TFormDownloadDemo 

On initialization, the `FormCreate`:
*  Creates the instance of [THTTPClient](http://docwiki.embarcadero.com/Libraries/en/System.Net.HttpClient.THTTPClient).
*  Sets the [OnReceiveData](http://docwiki.embarcadero.com/Libraries/en/System.Net.HttpClient.THTTPClient.OnReceiveData) event.
The application defines the following event handlers: 
* `ButtonCancelClick`: Disables the button control that fires this handler and calls `IAsyncResult.Cancel` to stop asynchronous transfer.
* `BStartDownloadClick`: Disables the `BStartDownload` button control and calls `SampleDownload`. After the download is completed (or aborted), `BStartDownloadClick` enables the `BStartDownload` button control.
The application also defines the following methods: 
* `SampleDownload`:

*  Sends an HTTP request to the specified URL using the [HEAD](http://docwiki.embarcadero.com/Libraries/en/System.Net.HttpClient.THTTPClient.Head) HTTP request method.
*  Adds the response from the server to the TMemo: the [StatusCode](http://docwiki.embarcadero.com/Libraries/en/System.Net.HttpClient.IHTTPResponse.StatusCode) and the [StatusText](http://docwiki.embarcadero.com/Libraries/en/System.Net.HttpClient.IHTTPResponse.StatusText).
*  Creates the file that is going to be dowloaded.
*  Starts the download process by calling [BeginGet](http://docwiki.embarcadero.com/Libraries/en/System.Net.HttpClient.THTTPClient.BeginGet) which starts an asynchronous HTTP request using the GET HTTP request method.
*  Specifies [Min](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TProgressBar.Min) and [Max](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TProgressBar.Max) values for the `ProgressBarDownload` control.

* `ReceiveDataEvent`:

*  This method is called when the [OnReceiveData](http://docwiki.embarcadero.com/Libraries/en/System.Net.HttpClient.THTTPClient.OnReceiveData) from the [THTTPClient](http://docwiki.embarcadero.com/Libraries/en/System.Net.HttpClient.THTTPClient) fires.
*  The [OnReceiveData](http://docwiki.embarcadero.com/Libraries/en/System.Net.HttpClient.THTTPClient.OnReceiveData) event handler fires while your HTTP client receives response data for one or more requests, and it indicates the current progress of the response download for the specified request.
*  Calculates the speed of the download and updates the [current position](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TProgressBar.Value) of the `ProgressBarDownload` control accordingly.
*  Updates the text from the `LabelGlobalSpeed` control with the current speed.

## Uses 


* [System.Net.URLClient](http://docwiki.embarcadero.com/Libraries/en/System.Net.URLClient)
* [System.Net.HttpClient](http://docwiki.embarcadero.com/Libraries/en/System.Net.HttpClient)
* [System.Net.HttpClientComponent](http://docwiki.embarcadero.com/Libraries/en/System.Net.HttpClientComponent)

## See Also 


* [System.Net.HttpClient.THTTPClient](http://docwiki.embarcadero.com/Libraries/en/System.Net.HttpClient.THTTPClient)
* [Using an HTTP Client](http://docwiki.embarcadero.com/RADStudio/en/Using_an_HTTP_Client)





