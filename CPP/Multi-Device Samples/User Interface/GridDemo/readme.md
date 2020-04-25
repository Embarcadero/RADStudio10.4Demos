FMX.GridDemo Sample[]()
# FMX.GridDemo Sample 


This sample illustrates how to use grids in your applications. The **GridDemo** sample illustrates using several grid features on different platforms, if you run **GridDemo** under iOS, then it uses the native iOS grid control.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)

* [2.1 How to Build and Run the Sample](#How_to_Build_and_Run_the_Sample)

* [3 Implementation](#Implementation)
* [4 Classes](#Classes)
* [5 See Also](#See_Also)


## Location 

You can find the **GridDemo** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\GridDemo`
* `CPP\Multi-Device Samples\User Interface\GridDemo`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/GridDemo](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/GridDemo)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/GridDemo](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/GridDemo)

## Description 

The **GridDemo** sample contains three tabs:
* **TStringGrid** tab contains the **StringGrid1** string grid control of the [TStringGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TStringGrid) type.
* **TGrid** tab contains the **Grid1** grid control of the [TGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TGrid) type.
* **Grid and LiveBinding** tab contains the **Grid2** grid control of the [TGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TGrid) type using LiveBinding.

### How to Build and Run the Sample 

To build and run this application: 
1.  Navigate to one of the locations given above and open:

*  Delphi: **GridDemo.dproj**.
*  C++: **GridDemo.cbproj**.

2.  Press CTRL+SHIFT+F9 or select **Run > Run Without Debugging**.

## Implementation 

When you run the application, the sample window with three following tabs opens: **TStringGrid**, **TGrid**, and **Grid and LiveBinding**. Also, there is the **Options** button, and a box with a list of events that occured in grid controls: 
*  The **Options** button displays controls showing the current [grid options](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TGridOption) and other grid properties. These controls are shown on the right of the main form. The options define the way how three used grids look, as well as their behavior. For example, checking ON the [ColumnResize](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TGridOption) option makes the width of columns in the grids resizable with the mouse.
 Notice the disabled [ControlType](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.Presentation.TPresentedControl.ControlType) property is set to [Platform](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControlType). It means that on each platform FireMonkey checks whether the platform has a native grid implementation and tries to use it.  Under iOS platform, **GridDemo** uses the native iOS grid control, you can find the iOS implementation of grid controls here: `C:\Program Files (x86)\Embarcadero\Studio\\Source\fmx\FMX.Grid.iOS.pas`
*  The box next to the **Options** button on the right top of the main form shows all events that occurred in grid controls.
 To display the list of events in a box, click in a grid area.
*  The **TStringGrid** tab contains the [StringGrid1](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TStringGrid) string grid that includes 9 columns from **CheckColumn1** (of the [TCheckColumn](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TCheckColumn) type) till **TimeColumn1** (of the [TTimeColumn](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TTimeColumn) type). These columns you can see in the **Structure View** under the **StringGrid1** node.
 The **FormCreate** method calls **InitStringValue** in the`for I := 0 to StringGrid1.RowCount - 1 do` loop to initialize cells in the **StringGrid1** grid. See the code in the `{$REGION String grid updating}`[region](http://docwiki.embarcadero.com/RADStudio/en/Regions). The value printed in the **String** column prompts the type of the feature demonstrated in the corresponding row. Fore example, the `Progress 50%` prompts that this row demonstrates progress bar properties. Namely, the cell in the `Column` column displaying `'500'` is the [Value](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TProgressBar.Value) of the progress bar. The cell in the `Progress` column displays the progress bar itself. 
*  The **TGrid** tab contains the [Grid1](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TGrid) grid with 10 columns. These columns are initialized in the
`{$REGION Grid updating}`[region](http://docwiki.embarcadero.com/RADStudio/en/Regions) of the **FormCreate** method. Notice the last **TImageColumn** column. Double-click a cell in this column. The **Open** dialog box opens. Browse for a folder containing some images. Select an image and click **Open**. The selected image appears in the cell. 
*  The **Grid and LiveBinding** tab contains the [Grid2](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TGrid) grid that contains 8 columns. This grid used the LiveBinding to bound these columns (in the grid) to columns in the **FDMemTable1** dataset of the [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) type.

## Classes 

The **GridDemo** sample contains the following most important components: 
* [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl)
* [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem)
* [TStringGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TStringGrid)
* [TGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TGrid)
* [TStringColumn](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TStringColumn)
* [TColumn](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TColumn)
* [TProgressColumn](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TProgressColumn)
* [TCurrencyColumn](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TCurrencyColumn)
* [TCheckColumn](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TCheckColumn)
* [TDateColumn](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TDateColumn)
* [TTimeColumn](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TTimeColumn)
* [TPopupColumn](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TPopupColumn)
* [TGlyphColumn](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TGlyphColumn)
* [TTreeView](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TTreeView)
* [TBindNavigator](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TBindNavigator)
* [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TFDMemTable)
* [Data.DB.TCurrencyField](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TCurrencyField)
* [TIntegerField](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TIntegerField)
* [TStringField](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TStringField)
* [TDateField](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDateField)
* [TTimeField](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TTimeField)

## See Also 


* [LiveBindings in RAD Studio](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio)
* [Mobile Tutorial: Using LiveBindings to Populate a ListBox in Mobile Applications (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_LiveBindings_to_Populate_a_ListBox_in_Mobile_Applications_(iOS_and_Android))
* [Tutorial: Using TPrototypeBindSource and the LiveBindings Designer](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_TPrototypeBindSource_and_the_LiveBindings_Designer)
* [Tutorial: Using LiveBindings in FireMonkey Applications](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_LiveBindings_in_FireMonkey_Applications)





