Data.Cloud Explorer Sample[]()
# Data.Cloud Explorer Sample 


This sample shows how to create a Cloud Explorer application.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **CloudExplorer** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to **Object Pascal\Database\CloudAPI\CloudExplorer**.
* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/CloudAPI/CloudExplorer/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/CloudAPI/CloudExplorer/).

## Description 

The Cloud Explorer application demonstrates how to use the API to: 
*  Connect to accounts.
*  Transfer files between your local machine and the cloud (Amazon S3 and Azure Blob Service).
*  Log the errors and debug the HTTP traffic using a proxy program.

## How to Use the Sample 


1.  Navigate to **Start | Programs | Embarcadero RAD Studio Rio | Samples** and go to **Object Pascal\DataSnap\Cloud\CloudExplorer**.
2.  Open the **CloudExplorer.dproj** project.
3.  Build the **CloudExplorer.dproj** project.
4.  Run the application by clicking **Run > Run** in the IDE or by pressing **F9**.
5.  With the Cloud Explorer application you can:

* **Add Accounts**

*  On the Accounts tab, choose the cloud service type (Azure or Amazon).
*  Enter a unique display name for the new account.
*  For an Amazon account, set the Account name to your Access Key ID, and the Account Key to your Secret Access Key.
*  For an Azure account, set the account name and key.
*  Click the Add button.

* **Connect to an Account**

*  Choose the connection you want to connect to in the Cloud drop-down box.
*  On the Files tab, you will see the list of Containers (for Azure) or Buckets (for Amazon) at the root of the storage account:

*  You can double-click a container or bucket to drill into it and see its contents.
*  The contents are navigated as a virtual directory structure, with slash characters denoting folder names.

*  You can specify a path in the text field above the file list and click Enter to be taken to that location.

* **Transfer Files**

*  You can drag and drop a file from your local machine to the cloud (within a bucket/container).
*  You can right-click a file or directory/bucket/container and choose to upload or download it.
*  Active transfers will be shown on the transfers tab.

* **Log and Proxy**

*  You can enable Info and Error logging on the logging tab.
*  If you want to debug the HTTP traffic, you can check "Use Proxy" on the Log tab, and run a proxy program such as Fiddler.

## Files 

The files used by this sample are:

|**File**           |**Contains**                                                                                                                 |
|-------------------|-----------------------------------------------------------------------------------------------------------------------------|
|**CloudAccountsIO**|Unit that provides support for importing and exporting the accounts into a CloudAccounts.json file.                          |
|**CloudExplorerUI**|The main form, which is the user interface for the Cloud Explorer Demo.                                                      |
|**CloudPopulator** |Unit that provides the methods and types for file transfer between the local machine and the cloud for both Amazon and Azure.|
|**CloudAccounts**  |JSON file that holds information about accounts.                                                                             |


> **Note:** OpenSSL libraries (libeay32.dll and ssleay32.dll) are required on your path in order for this sample to work.


## Uses 


* [Data.Cloud.CloudAPI Unit](http://docwiki.embarcadero.com/Libraries/en/Data.Cloud.CloudAPI)
* [Data.Cloud.AmazonAPI Unit](http://docwiki.embarcadero.com/Libraries/en/Data.Cloud.AmazonAPI)

## See Also 


* [Developing Cloud Applications](http://docwiki.embarcadero.com/RADStudio/en/Developing_Cloud_Applications)
* [www.openssl.org](http://www.openssl.org/)
* [Data.Cloud API Test](http://docwiki.embarcadero.com/CodeExamples/en/Data.Cloud_API_Test)





