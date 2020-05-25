FireDAC.TFDBatchMove Sample[]()
# FireDAC.TFDBatchMove Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)

This sample demonstrates the functionality of the TFDBatchMove component to move data between txt files and tables using datasets.
## Location 

You can find the **TFDBatchMove** sample project at:
* **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples** and then navigate to:

* **Object Pascal\DataBase\FireDAC\Samples\Comp Layer\TFDBatchMove\Main**.

* **GitHub Repository for Delphi:**[http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDBatchMove/Main](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDBatchMove/Main).

## Description 

This sample shows how to use the TFDBatchMove component to move information between different sources and destinations:
*  Text to table
*  Table to table
*  Table to text
This component allows the user to process unattended data movement with log register and error control.
## How to Use the Sample 


1.  Navigate to the location given above and open:

*  Delphi: **Main.dproj**

2.  Press **F9** or choose **Run > Run**.
3.  Select one of the following connections from the **Use Connection Definition** drop-down menu: **Access_Demo**, **Access_Demo_Pooled**, **SQLite_Demo** or **SQLite_Demo_Pooled**.
4.  Click the three buttons to fully test the component behaviour:

*  Click **1. Move text to table** to load the data from the Data.txt file into a table.
*  Click **2. Move table to table** to move the dataset from one table to a different one.
*  Click **3. Move table to text** to move the table content to an output file **DataOut.txt**.

## Implementation 

**1. Move text to table** button:This button loads the content from a txt file located at **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples**\Object Pascal\DataBase\FireDAC\Samples\Comp Layer\TFDBatchMove\Main\data.txt into a table from the selected DBMS.
The sample adds the **FireDAC.Comp.BatchMove.Text** unit to the interface uses section to allow the creation of a text reader **TFDBatchMoveTextReader** and a dataset writer **TFDBatchMoveDataSetWriter**.

*  Sets the **FileName** property of **TFDBatchMoveTextReader** with the location of **data.txt**. This is the file used to load the data to the table. Also several **DataDef** properties are adjusted according to the text file format.

* ` DataDef.Separator := ','; ` It defines the separator used to separate the fields in the text file.
* ` DataDef.WithFieldNames := True; ` It specifies that the field name is included in the first row of the text file.

*  Uses the **Dataset** property of **TFDBatchMoveDataSetWriter** to set the destination dataset. Also **Optimise** property is set to False to allow the dataset content to be visualized using TDBGrid.
The **GuessFormat** method is called before loading the data to automatically recognize the text file structure. Then the demo executes the **TFDBatchMove** component and shows the loaded data using a query in the TDBGrid.**2. Move table to table** button:
This button moves the data between two different tables on the same DBMS.
The sample creates a **TFDBatchMoveDataSetReader** dataset reader and a **TFDBatchMoveDataSetWriter** dataset writer.

*  Uses the **Dataset** property of **TFDBatchMoveDataSetReader** to set the source dataset, **qryLoaded**.
*  Uses the **Dataset** property of **TFDBatchMoveDataSetWriter** to set the destination dataset, **qryMoved**.
It executes the TFDBatchMove component and shows the query of both datasets on the TDBGrid.**3. Move table to text** button:
This button copies the data from the table source to an output file located at the application's path. It creates the destination file: **DataOut.txt**.
The sample creates a **TFDBatchMoveDataSetReader** dataset reader and a **TFDBatchMoveTextWriter** text writer.

*  Uses the **Dataset** property of **TFDBatchMoveDataSetReader** to set the source dataset, **qryLoaded**.
*  Sets the **FileName** property of **TFDBatchMoveTextWriter** to set the output file name and path: **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples**\Object Pascal\DataBase\FireDAC\Samples\Comp Layer\TFDBatchMove\Main\DataOut.txt.
It executes the TFDBatchMove component to create the file and save the data to the output file.
## Uses 


* [FireDAC.Comp.BatchMove.TFDBatchMove](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Comp.BatchMove.TFDBatchMove)
* [FireDAC.Comp.Client.TFDQuery](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Comp.Client.TFDQuery)
* [Data.DB.TDataSource](http://docwiki.embarcadero.com/Libraries/Denali/en/Data.DB.TDataSource)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/Denali/en/FireDAC)
* [FireDAC.Comp.BatchMove.Text.TFDBatchMoveTextWriter](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Comp.BatchMove.Text.TFDBatchMoveTextWriter)
* [FireDAC.Comp.BatchMove.Text.TFDBatchMoveTextReader](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Comp.BatchMove.Text.TFDBatchMoveTextReader)
* [FireDAC.Comp.BatchMove.DataSet.TFDBatchMoveDataSetWriter](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Comp.BatchMove.DataSet.TFDBatchMoveDataSetWriter)
* [FireDAC.Comp.BatchMove.DataSet.TFDBatchMoveDataSetReader](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Comp.BatchMove.DataSet.TFDBatchMoveDataSetReader)
* [FireDAC.Comp.BatchMove.SQL.TFDBatchMoveSQLReader](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Comp.BatchMove.SQL.TFDBatchMoveSQLReader)
* [FireDAC.Comp.BatchMove.SQL.TFDBatchMoveSQLWriter](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Comp.BatchMove.SQL.TFDBatchMoveSQLWriter)





