RTL.HttpDownload Sample[]()
# RTL.HttpDownload Sample 


This is a sample that shows the use of the [HTTP Client](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Net.HttpClient) API, specifically how to implement a multi-threaded download.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 Stop / Restart the Download](#Stop_.2F_Restart_the_Download)

* [4 Implementation](#Implementation)

* [4.1 TFormDownloadDemo](#TFormDownloadDemo)
* [4.2 TDownloadThread](#TDownloadThread)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **HttpDownload** sample project at:
* **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples** and then navigate to either:

* `Object Pascal\RTL\HttpDownload`
* `CPP\RTL\HttpDownload`

* **GitHub Repository for Delphi:**[http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/RTL/HttpDownload](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/RTL/HttpDownload)
* **GitHub Repository for C++:**[http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/RTL/HttpDownload/](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/RTL/HttpDownload/)

## Description 

This application uses the [HTTP Client](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Net.HttpClient) API to download a file. It separates a file into 4 parts and uses multiple threads to download the parts simultaneously.The application uses the following controls:

* `EditFileName`: Allows you to specify the name of the file.
* `EditURL`: Allows you to provide a URL of a file.
* `BStartDownload`: Fires the `BStartDownloadClick` event handler.
* `LabelGlobalSpeed`: Displays the average download speed.
* `ImageList1`: Holds the "stop" button images.
* `Button1`, `Button2`, `Button3`, `Button4`: Fire the `ButtonCancelClick` event handler.
* `ProgressBarPart1`, `ProgressBarPart2`, `ProgressBarPart3`, `ProgressBarPart4`: Display the progress of the download of the corresponding file part.
* `Label1`, `Label2`, `Label3`, `Label4`: Display the download speed of the corresponding file part.
* `Memo1`: Displays the messages from the application for the user.

## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **HttpDownloadDemo.dproj**.
*  C++: **HttpDownloadDemo.cbproj**.

2.  Press **F9** or choose **Run > Run**.
3.  Enter the file name for the file that you want to download.
4.  Enter the URL of the file that you want to download.
5.  Click the **Start download** button control.
**Note:** The implementation of the multi-threaded download requires the resume-download feature. If the file that you wish to download is on a server that does not support the resume-download feature, the application will display a message "Server has NOT resumed download feature".The location where the file is downloaded depends on the operating system. On Windows, the location is the `MyDocuments` folder. See [GetDocumentsPath](http://docwiki.embarcadero.com/Libraries/Denali/en/System.IOUtils.TPath.GetDocumentsPath) for more information.
### Stop / Restart the Download 

To stop the download of a part of the file, press the "stop" button (the red square) next to the corresponding progress bar. When the download is complete or if you stop the download of all 4 parts of the file, you can restart the download of the file by pressing the `Start Download` button. 
## Implementation 

This application uses an instance of [THTTPClient](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Net.HttpClient.THTTPClient) to:
*  connect to the server
*  check if the server supports the resume-download feature
*  start the download of the file.
This application also implements a custom class **TDownloadThread** to handle the simultaneous download of parts of the file.
### TFormDownloadDemo 

On initialization, the `FormCreate` groups the button controls, the progress bar controls and the labels into corresponding arrays.
*  The application defines the following event handlers:

* `ButtonCancelClick`: Disables the button control that fires this handler.
* `BStartDownloadClick`: Disables the `BStartDownload` button control and calls `SampleDownload`. After the download is completed (or aborted), `BStartDownloadClick` enables the `BStartDownload` button control.
* `ReceiveThreadDataEvent`: Occurs when an instance of **TDownloadThread** receives data from its HTTP client. This handler checks whether the download is aborted. If not, it updates the progress bar control and the speed label control. It also calls the [ProcessMessages](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Forms.TApplication.ProcessMessages) method, which allows the application to refresh other controls while the download threads run. **TDownloadThread.ReceiveDataEvent** is the dispatcher of this event.

*  The application also defines the following methods:

* `SampleDownload`: Creates an instance of HTTP client and checks whether the server that hosts the file at the provided URL supports resume-download feature. If yes, the method does the following:

*  Reserves the space for the file to be downloaded.
*  Splits the file into four parts and assigns each part to a new instance of **TDownloadThread**.
*  Starts the download (calls the [Start](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Classes.TThread.Start) method of each thread).
*  Waits until the download is completed and updates the `LabelGlobalSpeed` control with the calculated average speed of the download.
Otherwise, the application aborts the download process and displays the following text in the `Memo1` control: "Server has NOT resumed download feature".

### TDownloadThread 

**TDownloadThread** is a descendant of [TThread](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Classes.TThread). This class handles the multi-threading functionality of the application.
* **TDownloadThread** defines the following methods:

* `Create` is the constructor.
* `Destroy` is the destructor.
* `Execute` is the implementation of the [Execute](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Classes.TThread.Execute) method that runs when a thread is run. `Execute` creates its own instance of [THTTPClient](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Net.HttpClient.THTTPClient) and assigns the [OnReceiveData](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Net.HttpClient.THTTPClient.OnReceiveData) event of that client to the `ReceiveDataEvent` method.
* `ReceiveDataEvent` is the dispatcher on the custom **TDownloadThreadDataEvent** event. This dispatcher also calculates the current speed of the download.

## Uses 


* [System.Net.URLClient](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Net.URLClient)
* [System.Net.HttpClient](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Net.HttpClient)
* [System.Net.HttpClientComponent](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Net.HttpClientComponent)

## See Also 


* [System.Net.HttpClient.THTTPClient](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Net.HttpClient.THTTPClient)
* [System.Classes.TThread](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Classes.TThread)
* [Using an HTTP Client](http://docwiki.embarcadero.com/RADStudio/Denali/en/Using_an_HTTP_Client)





