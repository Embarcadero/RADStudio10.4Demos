VCL.Controls Sample[]()
# VCL.Controls Sample 


This sample demonstrates how to create and use custom VCL components. The application proves that you can easily modify the implementation for controls that already exist on the palette.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **Controls** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to **CPP\VCL\Controls**.
* **C:\Users\Public\Documents\Embarcadero\Studio\\Samples\CPP\VCL\Controls**.
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/Controls/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/Controls/).

## Description 

The application creates and installs the C++ version of the visual components that already exist in the **Samples** category on the **[Tool Palette](http://docwiki.embarcadero.com/RADStudio/en/Tool_Palette)**, plus some new ones.These are the new components that this sample application adds to the **Tool Palette**:

*  TCTrayIcon
*  TPerformanceGraph
*  TCSpinButton
*  TCSpinEdit
*  TCColorGrid
*  TCGauge
*  TCDirectoryOutline
*  TCCalendar
*  TPie

## How to Use the Sample 

To run the example, complete the following steps:
1.  Navigate to the location given above.
2.  Load `bcbsmp.bpl`.
3.  Load `dclbcbsmp.bpl`.(By convention, `dcl` is the prefix for component designer packages.)
4.  Build `bcbsmp.bpl`.
5.  Install `dclbcbsmp.bpl` to install the components.
**Note**: In order to be able to install this project, go to **Component > Install Packages** and deselect **Embarcadero Sample Controls Design Time Package**.
## Files 



|**File**    |**Contains**                                                           |
|------------|-----------------------------------------------------------------------|
|**ccalendr**|The **TCCalendar** class                                               |
|**cdiroutl**|The **TCDirectoryOutline** class                                       |
|**cgauges** |The **TCGauge** class and other helper classes                         |
|**cgrid**   |The **TCColorGrid** class                                              |
|**cspin**   |The **TCSpinButton** and **TCSpinEdit** classes                        |
|**perfgrap**|The **TPerformanceGraph** class                                        |
|**pies**    |The **TPie** class and **TAngle** helper class                         |
|**trayicon**|The **TCTrayIcon** class                                               |
|**piereg**  |The code for registering the **TPie** component and its property editor|
|**smpreg**  |The code for registering the rest of the components                    |


## Classes 


* **TCCalendar** implements a month calendar; it is a version of [TCalendar](http://docwiki.embarcadero.com/Libraries/en/Vcl.Samples.Calendar.TCalendar).
* **TCDirectoryOutline** implements a directory hierarchy; it is a version of [TDirectoryOutline](http://docwiki.embarcadero.com/Libraries/en/Vcl.Samples.DirOutln.TDirectoryOutline).
* **TBltBitmap** is a helper class for **TCGauge**.
* **TCGauge** implements a measurement tool; it is a version of [TGauge](http://docwiki.embarcadero.com/Libraries/en/Vcl.Samples.Gauges.TGauge).
* **TCColorGrid** implements a grid that allows the user to select a foreground color and a background color.
* **TCSpinButton** implements a spin button; it is a version of [TSpinButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.Samples.Spin.TSpinButton).
* **TCSpinEdit** implements a spin edit; it is a version of [TSpinEdit](http://docwiki.embarcadero.com/Libraries/en/Vcl.Samples.Spin.TSpinEdit).
* **TPerformanceGraph** implements a performance graph.
* **TAngles** is a helper class for **TPie**.
* **TPie** implements a pie component.
* **TCTrayIcon** implements a tray icon; it is a version of [TTrayIcon](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TTrayIcon).

## Uses 


* [TGraphicControl](http://docwiki.embarcadero.com/Libraries/en/Vcl.Controls.TGraphicControl)
* [TPropertyEditor](http://docwiki.embarcadero.com/Libraries/en/DesignEditors.TPropertyEditor)
* [TComponentEditor](http://docwiki.embarcadero.com/Libraries/en/DesignEditors.TComponentEditor)
* [RegisterComponents](http://docwiki.embarcadero.com/Libraries/en/System.Classes.RegisterComponents)
* [RegisterPropertyEditor](http://docwiki.embarcadero.com/Libraries/en/DesignIntf.RegisterPropertyEditor)
* [RegisterComponentEditor](http://docwiki.embarcadero.com/Libraries/en/DesignIntf.RegisterComponentEditor)

## See Also 


* [Component Writer's Guide](http://docwiki.embarcadero.com/RADStudio/en/Component_Writer%27s_Guide_Index)
* [Making Components Available at Design Time - Overview](http://docwiki.embarcadero.com/RADStudio/en/Making_Components_Available_at_Design_Time_-_Overview)





