RTL.JSON Workbench Sample[]()
# RTL.JSON Workbench Sample 


This sample shows how to use the new [JSON](http://docwiki.embarcadero.com/Libraries/en/System.JSON) units provided in RAD Studio to write JSON objects, to format JSON-like text and to serialize JSON in BSON.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 JSON Formatter](#JSON_Formatter)
* [3.2 JSON to BSON](#JSON_to_BSON)

* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)

* [6.1 Converters Unit](#Converters_Unit)
* [6.2 Writers Unit](#Writers_Unit)
* [6.3 Json Formatter](#Json_Formatter_2)

* [6.3.1 Beautify](#Beautify)
* [6.3.2 Minify](#Minify)
* [6.3.3 To Delphi](#To_Delphi)
* [6.3.4 To Writer](#To_Writer)

* [6.4 Json to Bson](#Json_to_Bson_2)

* [7 Uses](#Uses)
* [8 See Also](#See_Also)


## Location 

You can find the **JSON Workbench** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples**, and then navigate to:

* `Object Pascal\RTL\Json`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/RTL/Json](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/RTL/Json)

## Description 

The sample consists of a JSON workbench that provides different utilities for testing the new JSON framework. The **JSON Formatter** tab provides utilities to format and convert JSON-like text. 
The **JSON to BSON** tab allows serializing JSON to BSON, and vice versa.

## How to Use the Sample 


1.  Navigate to the location given above, and open **JsonWorkbench**.
2.  Select 32-bit Windows or 64-bit Windows as the target platform.
3.  Press F9 or choose **Run > Run**.

### JSON Formatter 

Use the **Json Formatter** tab for formatting and converting JSON-like content. Each button provides a different utility: 

* **Beautify:** Formats the JSON-like content provided, into a more structured format, using indentation for same name-value pairs level.
* **Minify:** Formats the JSON-like content provided, into a valid JSON block by removing all whitespaces and comments.
* **To Delphi:** Converts the JSON object to a Delphi String object.
* **To Writer:** Generates the Delphi code snippet to create the JSON object provided.

*  Check **Use Builders** to generate the Delphi code snippet according to the built-in JSON builder, defined in the [Builders](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders) unit. **Note:** To create a project using the built-in JSON builder, you need to include the [Builders](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders) unit in the **Uses** section.
*  Uncheck **Use Builders** to generate the Delphi code snippet using the base [System.JSON.Writers](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Writers) class directly.

### JSON to BSON 

Use **JSON to Bson** tab to serialize JSON to BSON, and vice versa. Click the arrows to start the serialization process in both ways.

## Files 



|**File**             |**Contains**                                               |
|---------------------|-----------------------------------------------------------|
|**fmWorkBench.dproj**|The project itself.                                        |
|**fmWorkBench.fmx**  |The main form.                                             |
|**fmWorkBench.pas**  |The main unit.                                             |
|**Writers.pas**      |The unit with extended classes for JSON writer and readers.|
|**Converters.pas**   |The unit with functions to convert and format JSON data.   |


## Classes 



|**Class Name**                                                                              |**Description**                                                                                                                                                                                                                             |
|--------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|[System.JSON.BSON](http://docwiki.embarcadero.com/Libraries/en/System.JSON.BSON)        |API to work with data in [BSON](http://bsonspec.org/) format.                                                                                                                                                                               |
|[System.JSON.Builders](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders)|Wrapper around [TJsonWriter](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Writers.TJsonWriter) to build a JSON array or object, with support for nested arrays and nested objects.**Note:** The sample does not use the unit.|
|[System.JSON.Readers](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Readers)  |Base class that provides logic to access to serialized JSON data.                                                                                                                                                                           |
|[System.JSON.Types](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Types)      |JSON and JSON extended token types.                                                                                                                                                                                                         |
|[System.JSON.Utils](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Utils)      |Utilities for handling and converting text between String and JSON.                                                                                                                                                                         |
|[System.JSON.Writers](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Writers)  |Base class that provides logic to serialize JSON data.                                                                                                                                                                                      |


## Implementation 

The sample shows how to use the new RAD Studio [JSON](http://docwiki.embarcadero.com/Libraries/en/System.JSON) framework.
### Converters Unit 

**Converters.pas** is a helper unit that implements all the functions for convertion and formatting. Some functions are used to apply a format to a JSON object, or to convert the JSON object. All the functions read the JSON object with a JSON reader and then iterate the String object received to analyse and format/convert the String token by token. The result provided is also a String object.

### Writers Unit 

**Writers.pas** extends [JsonTextReader](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Readers.TJsonTextReader) and [JsonTextWriter](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Writers.TJsonTextWriter) classes that are used to read and write JSON text as a String.**Writers.pas** extends the base classes [TJsonReader](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Readers.TJsonReader) and [TJsonWriter](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Writers.TJsonWriter) to implement the TJSONBuilderGenerator and TJSONWriterGenerator class objects used by the Writer utility of the workbench.

### Json Formatter 

The tab has different utilites to format and convert JSON data.All the utilities use the **LoadCode** function to load the JSON object from the [TMemo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo) in the left-hand side of the application. The **LoadCode** fuction calls the [EvaluateJavaScript](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TCustomWebBrowser.EvaluateJavaScript) method from the [TWebBrowser](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TWebBrowser) to add the custom JavaScript code to the HTML page in the right-hand side of the application.

#### Beautify 

The **Beautify** utility generates formatted easy-to-read JSON from a JSON object. It beauties JSON data programmatically, applying indentation to same name-value pairs level.It calls **JsonReformat** from **Converters.pas** with **Indented** set as `True`. 

```
TConverters.JsonReformat(mInput.Text, True)

```



#### Minify 

The **Minify** utility formats JSON data programmatically to a unique text block without whitespaces and indentation. It calls **JsonReformat** from **Converters.pas** with **Indented** set as `False`.

```
TConverters.JsonReformat(mInput.Text, False)

```



#### To Delphi 

**To Delphi** provides the Delphi code snippet to create a String object with the same data as the JSON object provided.It calls **Json2DelphiCode**. **Json2DelphiCode** function calls **JsonReformat** function with **Indented** as `True`.

#### To Writer 

**To Writer** generates as an output the source Delphi code snippet that creates the JSON object provided.**Use Builders** checkbox:

*  Enabled: It calls **Json2JsonBuilderCode** from **Converters.pas** to generate the Delphi code snippet according to the built-in JSON builder. The [TJSONObjectBuilder](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders.TJSONObjectBuilder) class is less verbose than [TJsonWriter](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Writers.TJsonWriter), and more intuitive.
*  Disabled: It calls **Json2JsonWriterCode** from **Converters.pas** to generate the Delphi code snippet using [TJsonWriter](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Writers.TJsonWriter) class from [System.JSON.Writers](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Writers) to write the JSON object.

### Json to Bson 

BSON is a binary-encoded serialization of JSON-like documents. BSON is designed to be lightweight, transversable and efficient. [MongoDB](https://www.mongodb.org/) uses BSON to storage data and as a network transfer data.The sample serializes a JSON object to BSON (Binary JSON), and vice versa.

*  To serialize JSON to BSON, it calls **Json2BsonString** and **Bytes2String** from **Converters.pas**.
*  To serialize BSON to JSON, it calls **BsonString2Json** and **String2Bytes** from **Converters.pas**.

## Uses 


* [System.JSON.BSON](http://docwiki.embarcadero.com/Libraries/en/System.JSON.BSON)
* [System.JSON.Writers](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Writers)
* [System.JSON.Readers](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Readers)
* [System.JSON.Types](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Types)
* [System.JSON.Builders](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders)
* [System.JSON.Utils](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Utils)

## See Also 


* [JSON](http://docwiki.embarcadero.com/RADStudio/en/JSON)
* [Readers and Writers JSON Framework](http://docwiki.embarcadero.com/RADStudio/en/Readers_and_Writers_JSON_Framework)
* [JSON Official Site](http://json.org/)
* [BSON Standard Specification Version 1.0](http://bsonspec.org/spec.html)
* [MongoDB](https://www.mongodb.org/)





