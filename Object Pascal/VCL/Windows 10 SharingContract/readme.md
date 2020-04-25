VCL.Windows 10 SharingContract Sample[]()
# VCL.Windows 10 SharingContract Sample 


This sample shows how to use the RAD Studio [ShareContract](http://docwiki.embarcadero.com/Libraries/en/Vcl.ShareContract) API to share content using the Windows 10 [Share charm](http://windows.microsoft.com/en-us/windows-8/charms-tutorial). The sample shows the sharing of some strings and images. After a sharing request, Windows shows the sharing compatible applications in the Windows Share charm.

## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 Content Format](#Content_Format)
* [4.2 Initializing the Sharing Process](#Initializing_the_Sharing_Process)
* [4.3 Events](#Events)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **Windows 10 SharingContract** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples**, and then navigate to:

* `Object Pascal\VCL\Windows 10 SharingContract`
* `CPP\VCL\Windows 10 SharingContract`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/Windows%2010%20SharingContract](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/Windows%2010%20SharingContract)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/Windows%2010%20SharingContract](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/Windows%2010%20SharingContract)

## Description 

The sample consists of two projects with the same behaviour, **ShareContractComponent** that uses the [TSharingContract](http://docwiki.embarcadero.com/Libraries/en/Vcl.ShareContract.TSharingContract) component, and **ShareContractFramework** that uses the framework **System.Win.ShareContract**.The demo shows how to transfer content to the Share charm on Windows 10. After starting the sharing process, the Share charm appears with the target applications that support the data being shared.

## How to Use the Sample 


1.  Navigate to the location given above, and open:

* For Delphi: **ProjectGroupSharingContract**.
* For C++: **CPP_SharingContract**.

2.  Select one of the projects from the [Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window): **ShareContractComponent** or **ShareContractFramework**.**Note:** The two projects have the same functionality, one using the component, and the other using the framework.
3.  Select 32-bit Windows or 64-bit Windows as the target platform.**Note:** This sample is only compatible with **Windows 10**.
4.  Press F9 or choose **Run > Run**.
5.  Click **Share**.
6.  Choose an application to share the content with.

## Implementation 

The sample shows how to share content with another application, on Windows 10. The implementation of the sharing operation is done, either by using the [TSharingContract](http://docwiki.embarcadero.com/Libraries/en/Vcl.ShareContract.TSharingContract) component or by using the framework **System.Win.ShareContract**.
### Content Format 

This sample covers how to send shared content in a variety of formats, for example:
* [Text](http://docwiki.embarcadero.com/Libraries/en/Vcl.ShareContract.TCustomSharingContract.DataText)
* [Web link](http://docwiki.embarcadero.com/Libraries/en/Vcl.ShareContract.TCustomSharingContract.ContentSourceWebLink)
* [Application link](http://docwiki.embarcadero.com/Libraries/en/Vcl.ShareContract.TCustomSharingContract.ContentSourceApplicationLink)
* [Images](http://docwiki.embarcadero.com/Libraries/en/Vcl.ShareContract.TCustomSharingContract.ImageFile)
* [30x30 Logo](http://docwiki.embarcadero.com/Libraries/en/Vcl.ShareContract.TCustomSharingContract.LogoFile)
* [HTML content](http://docwiki.embarcadero.com/Libraries/en/Vcl.ShareContract.TCustomSharingContract.HTML)
* [Package Family Name](http://docwiki.embarcadero.com/Libraries/en/Vcl.ShareContract.TCustomSharingContract.PackageName)
**Note:** You can define the properties for the visual component, either by code or using the [Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector) at design time.
### Initializing the Sharing Process 

The demo starts sharing after clicking **Share**. The [InitSharing](http://docwiki.embarcadero.com/Libraries/en/Vcl.ShareContract.TCustomSharingContract.InitSharing) method starts the process.The [InitSharing](http://docwiki.embarcadero.com/Libraries/en/Vcl.ShareContract.TCustomSharingContract.InitSharing) method is defined in the [OnClick](http://docwiki.embarcadero.com/Libraries/en/Vcl.Controls.TControl.OnClick) event of the [Tbutton](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton).
For Delphi:
*  Using the TSharingContract visual component

```
procedure TFShareComponent.ButtonShareClick(Sender: TObject);
begin
  (...)
  // Launch Sharing process. Shows applications that can receive our shared information.
  ShareContractComponent.InitSharing;
end;

```



*  Using the framework

```
procedure TFormSharingContract.ButtonShareClick(Sender: TObject);
begin
  (...)
  // Launch Sharing process. Shows applications that can receive our shared information.
  FShareWrapper.InitSharing;
end;

```



For C++:
*  Using the TSharingContract visual component

```
void __fastcall TFormSharingComponent::ButtonShareClick(TObject *Sender)
{
  (...)
  // Launch Sharing process-> Shows applications that can receive our shared information->
  SharingContract->InitSharing();
}

```



*  Using the framework

```
void __fastcall TForm1::ButtonShareClick(TObject *Sender)
{
  (...)
  // Launch Sharing process-> Shows applications that can receive our shared information->
  FShareWrapper->InitSharing();
}

```




### Events 

The [OnAppChosen](http://docwiki.embarcadero.com/Libraries/en/Vcl.ShareContract.TCustomSharingContract.OnAppChosen) event triggers after selecting the target application to receive the shared information. In the sample, it adds a line to the [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo) with the name of the application.For Delphi:
```
procedure TFShareComponent.ShareContractComponentAppChosen(const Sender: TObject; const AManager: IDataTransferManager;
  const Args: ITargetApplicationChosenEventArgs);
begin
  // With this event we can know which application is going to receive our data.
  Memo1.Lines.Add('Application Chosen: ' + args.ApplicationName.ToString);
end;

```



For C++:
```
void __fastcall TFormSharingComponent::SharingContractAppChosen(TObject * const Sender, IDataTransferManager * const AManager,
      ITargetApplicationChosenEventArgs * const Args)
{
  // With this event we can know which application is going to receive our data.
  Memo1->Lines->Add("Application Chosen: " + TWindowsString::HStringToString(Args->ApplicationName));
}

```



The [OnTransferImage](http://docwiki.embarcadero.com/Libraries/en/Vcl.ShareContract.TCustomSharingContract.OnTransferImage) triggers when sharing an image.
## Uses 


* [Vcl.ShareContract](http://docwiki.embarcadero.com/Libraries/en/Vcl.ShareContract)
* [TSharingContract](http://docwiki.embarcadero.com/Libraries/en/Vcl.ShareContract.TSharingContract)
* [OnAppChosen](http://docwiki.embarcadero.com/Libraries/en/Vcl.ShareContract.TCustomSharingContract.OnAppChosen)
* [OnTransferImage](http://docwiki.embarcadero.com/Libraries/en/Vcl.ShareContract.TCustomSharingContract.OnTransferImage)
*  System.Win.ShareContract

## See Also 


* [Sharing Content Using the Sharing Contract](http://docwiki.embarcadero.com/RADStudio/en/Sharing_Content_Using_the_Sharing_Contract)
* [Share Contract](https://msdn.microsoft.com/nl-nl/library/hh464906.aspx#share_contract)
* [Guidelines for sharing content](https://msdn.microsoft.com/en-us/library/windows/apps/xaml/hh465251.aspx)
* [Sharing and receiving content](https://msdn.microsoft.com/nl-nl/library/hh758314.aspx)
* [Share charm](http://windows.microsoft.com/en-us/windows-8/charms-tutorial)





