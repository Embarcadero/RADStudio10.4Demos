FireDAC.PostgreSQL Ranges Sample[]()
# FireDAC.PostgreSQL Ranges Sample 


This sample demonstrates how to use [range types](http://www.postgresql.org/docs/current/static/rangetypes.html) on a [PostgreSQL](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_PostgreSQL_(FireDAC)) database using [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC).
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **Ranges** project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\DBMS Specific\PostgreSQL\Ranges`

* **GitHub Repository**:

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/PostgreSQL/Ranges](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/PostgreSQL/Ranges)

## Description 

The **Ranges** sample shows you how to use [range types](http://www.postgresql.org/docs/current/static/rangetypes.html) on a [PostgreSQL](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_PostgreSQL_(FireDAC)) database to represent many element values in a single range value. [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC) represents a range type column as a [ftADT](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TADTField) field with 3 subfields:
* **lbound** - lower range bound.
* **hbound** - upper range bound.
* **flags** - range flags.
**Note**: Columns of range type are read-only. This sample updates them using SQL commands.To get range column attributes, this sample uses the following code:
```
var
 l: Xxxx;
 // ...
 l := FDQuery1.FieldByName('<range column name>.<subfield>').AsXxxx;

```


**Notes**:
* `<subfield>` can be set to `lbound`, `hbound` or `flags`.
*  This sample uses integer ranges. Therefore, on the above code, `Xxxx` is replaced by `Integer`. However, you can use other range types such as time and date ranges for scheduling purposes.

## How to Use the Sample 


1.  Navigate to the location given above and open `PGRanges.dproj`.
2.  Press **F9** or choose **Run > Run**.

## Files 



| File in Delphi               | Contains          |
|------------------------------|-------------------|
|`PGRanges.dproj``PGRanges.dpr`|The project itself.|
|`fMain.pas``fMain.fmx`        |The main form.     |


## Implementation 

Before running the sample, the main components are configured at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** as follows:
*  A [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) object named **FDConnection1**. This is the FireDAC connection object that the sample uses to connect to a DBMS. The sample sets the [ConnectionDefName](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.ConnectionDefName) property to `PG_Demo`.
**Note**: You can change the [ConnectionDefName](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.ConnectionDefName) property to connect to a different PostgreSQL server using a valid user name and password.
*  A [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) object named **FDQuery1**. This component implements a dataset capable of executing SQL queries. The sample sets:

*  The [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property to `FDConnection1` in order to specify the FireDAC connection object.
*  The [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery.SQL) property with the following SQL `SELECT` statements that define different integer ranges:

> ```
> SELECT int4range(null,2000, '(]') rng
> UNION ALL
> SELECT int4range(3000,4000, '[)') rng
> UNION ALL
> SELECT int4range(5000,6000, '[]') rng
> UNION ALL
> SELECT int4range(7000,null, '()') rng
> UNION ALL
> SELECT int4range(20,20, '()') rng
> 
> ```

**Notes**:
*  The parentheses or brackets of the third argument indicate whether the lower and upper bounds are exclusive or inclusive. "`[`" represents an inclusive lower bound while "`(`" represents an exclusive lower bound. The same way, "`]`" represents an inclusive upper bound while "`)`" represents an exclusive upper bound.
*  If you omit the lower bound of a range, it means that all points less than the upper bound are included in the range. Likewise, if you omit the upper bound of the range, then all points greater than the lower bound are included in the range. If both lower and upper bounds are omitted, all values of the element type are considered to be in the range.

*  A [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource) object named **DataSource1**. This component provides an interface between a dataset component and data-aware controls on a form. In this sample, it is used to provide communication between the dataset and the [grid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) where the dataset is displayed. To this end, the sample sets the following properties:

*  The **DataSet** property of **DataSource** is set to `FDQuery1`.
*  The **DataSource** property of **DBGrid1** is set to `DataSource1`.
When you run the application, you see:
*  A [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) that is used to display the different data ranges defined on the SQL command.
*  Three [TDBEdit](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBCtrls.TDBEdit) components that are used to display the **lbound**,**lbound** and **flags** fields of the range type.
*  Two [TLabel](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TLabel) components that are used to display the type of the range bounds.

## Uses 


* [FireDAC.Comp.Client.TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [FireDAC.Comp.Client.TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)
* [Data.DB.TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)
* [Vcl.DBGrids.TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid)
* [Vcl.DBCtrls.TDBEdit](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBCtrls.TDBEdit)
* [Vcl.StdCtrls.TLabel](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TLabel)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Connect to PostgreSQL (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_PostgreSQL_(FireDAC))





