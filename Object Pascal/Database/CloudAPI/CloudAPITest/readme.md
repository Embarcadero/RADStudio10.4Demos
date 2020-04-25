Data.Cloud API Test[]()
# Data.Cloud API Test 


This is a sample that shows the use of the [Cloud API](http://docwiki.embarcadero.com/Libraries/en/Data.Cloud.CloudAPI).
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 Account Information and Access Keys](#Account_Information_and_Access_Keys)
* [3.2 Running the Sample](#Running_the_Sample)
* [3.3 More Information](#More_Information)

* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **CloudAPITest** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* `Object Pascal\Database\CloudAPI\CloudAPITest`

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/CloudAPI/CloudAPITest](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/CloudAPI/CloudAPITest)

## Description 

This application demonstrates the use [Cloud API](http://docwiki.embarcadero.com/Libraries/en/Data.Cloud.CloudAPI) to connect to a cloud service and perform different operations, such as cloud storage manipulation, cloud database manipulation and queue service usage.The application uses many UI controls, such as:

* [Buttons](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton)
* [Panels](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TPanel)
* [Combo boxes](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox)
* [Labels](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TLabel)
* [Page controls](http://docwiki.embarcadero.com/Libraries/en/Vcl.ComCtrls.TPageControl)
* [Tab sheets](http://docwiki.embarcadero.com/Libraries/en/Vcl.ComCtrls.TTabSheet)
* [List boxes](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TListBox)
* [Edits](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TEdit)
* [Check boxes](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TCheckBox)
* [Memos](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo)

## How to Use the Sample 

You need at least one of the following:
*  An [Amazon Web Services (AWS)](https://aws.amazon.com/) account.
*  A [Microsoft Azure](https://azure.microsoft.com/en-us/) account.

### Account Information and Access Keys 

To connect to either one of the cloud services, you need account information and access keys. For more information on how to find the account information and access keys, see:
*  Amazon: [Managing Access Keys](http://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html) section of the official documentation.
*  Azure: [Storage account - View, copy, and regenerate storage access keys](https://azure.microsoft.com/en-us/documentation/articles/storage-create-storage-account/#view-copy-and-regenerate-storage-access-keys)

### Running the Sample 


1.  Navigate to the locations given above and open:

*  Delphi: **Data.Cloud.CloudAPI.dproj**.

2.  Press **F9** or choose **Run > Run**.
3.  Under the **Accounts** tab, choose the account type, enter the requested information and click **Add Account**. Now you have a connection profile.
4.  Switch to either **Amazon** or **Azure** tab (depending on which you have access to).
5.  In the drop-down list on the top of the form, choose the correct connection profile.
6.  Choose from any of the available actions. Switch between the services in the tabs on the right (**Tables**,**Queues**,**Blobs**).
For some of the operations a dialog window appears that allows you to choose the output format: XML or non-XML. All the responses are shown in the output memo on the left side.
### More Information 

See the following pages for more information about the Cloud API and the usage of the Cloud API:
*  Amazon:

* [Data.Cloud.AmazonAPI](http://docwiki.embarcadero.com/Libraries/en/Data.Cloud.AmazonAPI)
* [Amazon and Cloud Computing with DataSnap](http://docwiki.embarcadero.com/RADStudio/en/Amazon_and_Cloud_Computing_with_DataSnap)

*  Azure:

* [Data.Cloud.AzureAPI](http://docwiki.embarcadero.com/Libraries/en/Data.Cloud.AzureAPI)
* [Azure and Cloud Computing with DataSnap](http://docwiki.embarcadero.com/RADStudio/en/Azure_and_Cloud_Computing_with_DataSnap)

*  Both:

* [Data.Cloud Explorer Sample](http://docwiki.embarcadero.com/CodeExamples/en/Data.Cloud_Explorer_Sample)
* [Cloud Computing with DataSnap](http://docwiki.embarcadero.com/RADStudio/en/Cloud_Computing_with_DataSnap)
* [Developing Cloud Applications](http://docwiki.embarcadero.com/RADStudio/en/Developing_Cloud_Applications)
* [Data.Cloud.CloudAPI](http://docwiki.embarcadero.com/Libraries/en/Data.Cloud.CloudAPI)

## Implementation 

This application defines 3 units:
* `CloudRefactorUI`: The main unit, implements the UI and all the event handlers for the user interaction.
* `CloudPopulator`: The implementation of the Cloud API with all the corresponding methods for the available operations.
* `CloudAccountsIO`: Handles the account information of the user-generated profiles and saves that information into a JSON file.

## Uses 


* [Data.Cloud.AzureAPI](http://docwiki.embarcadero.com/Libraries/en/Data.Cloud.AzureAPI)
* [Data.Cloud.AmazonAPI](http://docwiki.embarcadero.com/Libraries/en/Data.Cloud.AmazonAPI)
* [Data.Cloud.CloudAPI](http://docwiki.embarcadero.com/Libraries/en/Data.Cloud.CloudAPI)
* [System.Generics.Collections](http://docwiki.embarcadero.com/Libraries/en/System.Generics.Collections)
* [System.DateUtils](http://docwiki.embarcadero.com/Libraries/en/System.DateUtils)
* [Xml.XMLDoc](http://docwiki.embarcadero.com/Libraries/en/Xml.XMLDoc)
* [System.NetEncoding](http://docwiki.embarcadero.com/Libraries/en/System.NetEncoding)
* [System.JSON](http://docwiki.embarcadero.com/Libraries/en/System.JSON)

## See Also 


* [Developing Cloud Applications](http://docwiki.embarcadero.com/RADStudio/en/Developing_Cloud_Applications)
* [Cloud Computing with DataSnap](http://docwiki.embarcadero.com/RADStudio/en/Cloud_Computing_with_DataSnap)





