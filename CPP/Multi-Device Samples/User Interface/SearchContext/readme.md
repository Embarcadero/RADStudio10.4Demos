FMX.SearchContext Sample[]()
# FMX.SearchContext Sample 


This sample demonstrates how to create and use a search context, and how to use [FireMonkey image effects](http://docwiki.embarcadero.com/RADStudio/en/Using_FireMonkey_Image_Effects).
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)


## Location 

You can find the **SearchContext** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\SearchContext`
* `CPP\Multi-Device Samples\User Interface\SearchContext`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/SearchContext](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/SearchContext)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/SearchContext](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/SearchContext)

## Description 

By modifying a [TClearingEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TClearingEdit), a field with its associated icons will be highlighted through its [opacity](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TTextButtonObjectAppearance.Opacity) and [glow effects](http://docwiki.embarcadero.com/Libraries/en/FMX.Effects.TGlowEffect). It also uses a menu with options for loading data, managing data, and uploading new images using [Live Bindings](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio).Select **Options > Manage Data** to configure the search options. You may also double click the icon image to add more icons.

## How to Use the Sample 


1.  To run the example, open its project file:

* **Delphi:**`SearchContext.dproj`
* **C++:**`SearchContext_Cpp.cbproj`

2.  Press F9 or choose **Run > Run**.
3.  Start typing a search term that matches the beginning of one of the "INTERNET" or "SYSTEM" items, to see it highlighted.
**Note:** If you want to deploy this sample application, first you must:
1. [Add to the Deployment Manager](http://docwiki.embarcadero.com/RADStudio/en/Deployment_Manager_-_Adding_files) the `iconData.cds` file for any target platform.
2. [Add the MIDAS library](http://docwiki.embarcadero.com/RADStudio/en/Deployment_Manager_-_Add_Featured_Files) to the Deployment Manager as well for any target platform.

## Files 



| File                                        | Class                                                                     |
|---------------------------------------------|---------------------------------------------------------------------------|
| unitSearchMenuHelperCpp                     | The TSearchItem class, the TSearchBand class, the TSearchBandManager class|
| formMain                                    |* **Delphi:** The `TfrmManageData` class.* **C++:** The `TfrmData` class.  |
| dataData                                    | The TdtmdlData Class                                                      |
| formMain                                    | the TfrmMain Class                                                        |
|SearchContext (Delphi)SearchContext_Cpp (C++)| The project itself                                                        |


## Classes 


* **TSearchItem** is a form of [TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout), which represents an item with its specifics and it contains:

*  a TSearchState enum variable called **FSearchState**
* [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) called **BackGroundRec**
* [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) called **Image**
* [TGlowEffect](http://docwiki.embarcadero.com/Libraries/en/FMX.Effects.TGlowEffect) called **GlowPartial**
* [TStringList](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TStringList) called **FSearchText**
* [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) called **FooterLabel**
* [TCircle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TCircle) called **BackGroundGlow**
* [TNotifyEvent](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TNotifyEvent) called **FOnDblClick**

* **TSearchBand** is a form of [TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout) and it contains:

* [TGridLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TGridLayout) called **FItemGrid**
* [TObjectList](http://docwiki.embarcadero.com/Libraries/en/System.Generics.Collections.TObjectList) called **FSearchItems**
* [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) called **FBandTitle**

* **TSearchBandManager** is a form of [TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout) and it contains:

* [TObjectList](http://docwiki.embarcadero.com/Libraries/en/System.Generics.Collections.TObjectList) called **FSearchBands**

* **TdtmdlData** is a form of [TDataModule](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TDataModule) and it contains:

* [TClientDataSet](http://docwiki.embarcadero.com/Libraries/en/Datasnap.DBClient.TClientDataSet) called **cdsIconData** and it contains:

* [TIntegerField](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TIntegerField) called **cdsIconDataID**
*  Two [TStringField](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TStringField) called **cdsIconDataCategory** and **cdsIconDataDescription**
* [TMemoField](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TMemoField) called **cdsIconDataSearchTerms**
* [TBlobField](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TBlobField) called **cdsIconDataIcon**

* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource) called **dsIconData**

* **TfrmData** is a secondary form, accesible through the **Options > Manage Data** command. It is a version of [TForm](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TForm) and it contains:

* [TImageControl](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TImageControl) called **ImageControl1**
*  Four [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) called **Label1**, **Label2**, **Label3**, and **Label4**
*  Two [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) called **Edit1** and **Edit2**
* [TMemo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo) called **ReflectionEffect1**
* [TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog) called **Memo1**
* [TBindSourceDB](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.DBScope.TBindSourceDB) called **BindSourceDB1**
* [TBindingsList](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindingsList) called **BindingsList1**
*  Four [TLinkControlToField](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TLinkControlToField) called **LinkControlToField1**, **LinkControlToField2**, **LinkControlToField3**, and **LinkControlToField4**
* [TBindNavigator](http://docwiki.embarcadero.com/Libraries/en/Fmx.Bind.Navigator.TBindNavigator) called **NavigatorBindSourceDB1**

* **TfrmMain** is the main form that constitutes the user interface. It is a version of [TForm](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TForm) and it contains:

*  Two [TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout) called **Layout1** and **Layout2**
* [TReflectionEffect](http://docwiki.embarcadero.com/Libraries/en/FMX.Effects.TReflectionEffect) called **ReflectionEffect1**
* [TClearingEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TClearingEdit) called **edtSearch**
* [TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog) called **OpenDialog1**
* [TVertScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TVertScrollBox) called **VertScrollBox1**
* [TMainMenu](http://docwiki.embarcadero.com/Libraries/en/FMX.Menus.TMainMenu) called **MainMenu1** contains :

*  Four [TMenuItem](http://docwiki.embarcadero.com/Libraries/en/FMX.Menus.TMenuItem) called **MenuItem4**, **miLoadData**, **miLoadImages**, and **miManageData**

*  TSearchBandManager called **SearchBandManager**

## Implementation 

When you run the application, the main window of the sample is displayed:
*  Select the **Options > Load Data** command to load the data. This also happens by default at the form creation.
*  Select the **Options > Load Images** command to open a browse dialog, where you can select and open a new cdsIconData, after closing the former one.
*  Select the **Options > Manage Data** command to open a [TForm](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TForm), where using [TBindNavigator](http://docwiki.embarcadero.com/Libraries/en/Fmx.Bind.Navigator.TBindNavigator) you can add, delete, and navigate through items.
*  Search for a word and observe the [TGlowEffect](http://docwiki.embarcadero.com/Libraries/en/FMX.Effects.TGlowEffect) and [Opacity](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TTextButtonObjectAppearance.Opacity) change around the icons where the text matches either the label or one of its associated search terms. There can be no glow, partial glow (when a part of the word coresponds), and full glow.
*  Double-click on an icon to display its corresponding list of search terms.

## Uses 


* [FMX.Menus.TMainMenu](http://docwiki.embarcadero.com/Libraries/en/FMX.Menus.TMainMenu)
* [FMX.Dialogs.TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog)
* [FMX.Layouts.TVertScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TVertScrollBox)
* [FMX.StdCtrls.TPanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel)
* [FMX.Edit.TClearingEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TClearingEdit)
* [FMX.Layouts.TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout)
* [FMX.Effects.TReflectionEffect](http://docwiki.embarcadero.com/Libraries/en/FMX.Effects.TReflectionEffect)
* [Data.Bind.DBScope.TBindSourceDB](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.DBScope.TBindSourceDB)
* [Data.Bind.Components.TBindingsList](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindingsList)
* [Data.Bind.Components.TLinkControlToField](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TLinkControlToField)
* [Fmx.Bind.Navigator.TBindNavigator](http://docwiki.embarcadero.com/Libraries/en/Fmx.Bind.Navigator.TBindNavigator)
* [FMX.Dialogs.TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog)
* [FMX.Memo.TMemo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo)
* [FMX.Edit.TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit)
* [FMX.StdCtrls.TImageControl](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TImageControl)
* [Datasnap.DBClient.TClientDataSet](http://docwiki.embarcadero.com/Libraries/en/Datasnap.DBClient.TClientDataSet)
* [Data.DB.TIntegerField](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TIntegerField)
* [Data.DB.TStringField](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TStringField)
* [Data.DB.TMemoField](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TMemoField)
* [Data.DB.TBlobField](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TBlobField)
* [Data.DB.TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)
* [FMX.Objects.TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle)
* [FMX.Objects.TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage)
* [FMX.Effects.TGlowEffect](http://docwiki.embarcadero.com/Libraries/en/FMX.Effects.TGlowEffect)
* [FMX.Objects.TCircle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TCircle)
* [System.Classes.TStringList](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TStringList)
* [System.Classes.TNotifyEvent](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TNotifyEvent)
* [FMX.Layouts.TGridLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TGridLayout)
* [System.Generics.Collections.TObjectList](http://docwiki.embarcadero.com/Libraries/en/System.Generics.Collections.TObjectList)





