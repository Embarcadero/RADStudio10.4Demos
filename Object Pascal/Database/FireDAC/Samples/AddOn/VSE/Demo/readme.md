FireDAC.VSE Demo Sample[]()
# FireDAC.VSE Demo Sample 


This sample shows the use of a **FireDAC** database connection and how to populate a database with data using an [XML document](http://en.wikipedia.org/wiki/XML).
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 Tutorials](#Tutorials)


## Location 

You can find the **Project1** project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* **Object Pascal\Database\FireDAC\Samples\AddOn\VSE\Demo**

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/AddOn/VSE/Demo/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/AddOn/VSE/Demo/)

## Description 


*  The application creates a table (_test_vs_) and inserts data from an **XML document** using a **FireDAC** database connection.

> **Note:** The connection to the database does not require authentication.


## How to Use the Sample 


1.  Navigate to the location given above and open **Project1.dproj**.
2.  Press **F9** or choose **Run > Run**.
3.  Click the **Button1** button and the grid will be populated with data.
4.  Click the **Button1** button again to deactivate the [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) component and stop showing the data.

## Files 



|**File**                   |**Contains**                                                                                    |
|---------------------------|------------------------------------------------------------------------------------------------|
|**Demo\Project1.dproj**    |Contains the project itself.                                                                    |
|**Demo\Unit1.dfm**         |Contains the code of the main form.                                                             |
|**Demo\Unit1.pas**         |Contains the main form and the main code.                                                       |
|**FireDAC.Comp.VSE.pas**   |Contains the code for the _ VSE _ class used for parsing the XML document.                      |
|**FireDAC.Comp.VSEXML.pas**|Contains the code for the _ VSEXML _ class used for [XPath](http://ro.wikipedia.org/wiki/XPath).|


## Implementation 


*  When the [TForm](http://docwiki.embarcadero.com/Libraries/en/Vcl.Forms.TForm) is created, a [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) executes a DROP query against the _ test_vs _ table, creates the table, and populates it with data from an XML document.
*  The XML document is written at the beginning of the [implementation](http://docwiki.embarcadero.com/RADStudio/en/Language_Overview) part in the project.

```
 <Transaction>
   <Request>
      <OrderNumber>123456</OrderNumber>
      <ShippingMethod>123456</ShippingMethod>
   </Request>
   <Response>
      <StatusCode>200</StatusCode>
      <StatusMesg>Order accepted</StatusMesg>
      <RefNumber>S0123456</RefNumber>
   </Response>
 </Transaction>

```


*  Click the **Button1** button on the main form to display (or not) the data in a [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid), using a [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery), a [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource), a [TFDGUIxWaitCursor](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxWaitCursor), and a [TFDPhysSQLiteDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink).

*  The [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) executes a SELECT query against the _ test_vs _ table and displays the results in a [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid).

*  The project uses procedures which are found in the **FireDAC.Comp.VSE.pas** and **FireDAC.Comp.VSEXML.pas** units to interact with the XML document.

*  In the [TForm](http://docwiki.embarcadero.com/Libraries/en/Vcl.Forms.TForm) creation procedure, a **TFDVSEXMLManager** (the _FVS_ code variable) is instantiated and two **TFDVSESchema** (the _oSch_ code variable) are created.
*  The two **TFDVSESchema** variables have the following **TFDVSECMLFieldDefs** fields: _Name_, _DataType_, _Size_, and _XPathExpression_. One **TFDVSESchema** is used for **Request** and the other one for **Response**. They are used for parsing the XML document.
*  The _FVS_ Manager also adds a **TFDVSESessions** to allow the [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) to execute the query.

## Uses 


* [FireDAC.Comp.Client.TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [FireDAC.Comp.Client.TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)
* [FireDAC.Comp.UI.TFDGUIxWaitCursor](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxWaitCursor)
* [FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink)
* [Data.DB.TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)
* [Vcl.DBGrids.TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid)

## Tutorials 


* [Tutorial: Using FireDAC from a Multi-Device Application on Desktop Platforms](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_FireDAC_from_a_Multi-Device_Application_on_Desktop_Platforms)





