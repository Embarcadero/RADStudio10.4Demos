FMX.ShaderFilters Sample[]()
# FMX.ShaderFilters Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Classes](#Classes)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)

This sample illustrates how to apply visual effects to images with FireMonkey.
## Location 

You can find the **ShaderFilters** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\ShaderFilters`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ShaderFilters](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ShaderFilters)

## Description 

This application uses images on a form and applies several visual effects on them with [TSplitter](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSplitter) and [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation).
## How to Use the Sample 


1.  Navigate to the location given above, and open **ShaderFilters.dproj**.
2.  Press F9 or choose **Run > Run**. To apply a specified effect to the image, select an item from the list of effects in the left.

## Classes 

**New FireMonkey Image Show** represents the main window of the sample. It contains the following components:
*  Three [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) objects
*  Three [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) objects
*  Two [TSplitter](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSplitter) objects
*  Two [TPanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel) objects
*  A [TAniIndicator](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TAniIndicator)
*  Two [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) objects
*  A [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
*  A [TStyleBook](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TStyleBook)
*  Two [TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout) objects

## Implementation 


*  The first **TListBox** displays the main categories of effects.
*  When you select a category of effects from the first **TListBox**, a list with several specific effects is displayed in the second **TListBox**.
*  When you select a specific item from the list of effects, the respective effect is applied to the image.
*  The second **TListBox** is subordinated to the first one. The second **TListBox** displays the effects subordinated to the category selected from the first **TListBox**.
*  The selected effect is applied to the **Source** and **Target** images and a preview of the result is displayed on the **Dest** area.
*  Some of the effects have additional characteristics (**BlurAmount, BrushSize**, and so on). When you select one of these effects, the options are displayed in the third **TListBox**. Use the **TScrollBar** to change the characteristics of the effect.
*  The effects from the **Transition** main category have an additional button labeled as **Play**/**Pause**. Click this button to preview the picture transition.
*  When you click the **Benchmark** button, the label next to the button displays the amount of time that passes until the effect is applied to the picture.
*  Some of the effects use [TSelectionPoint](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TSelectionPoint) selection points to locate areas of effects. For example, the **Transition -> Line Transition** effect shows three selection points, which can be used to move color gradient boundaries. The **Distortion -> Pinch** effect shows a selection point, which can be used to move the pinched region showing a magnified background. See how the `Shape: TSelectionPoint;` object is used.

## Uses 


* [FMX.Objects.TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage)
* [FMX.ListBox.TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
* [FMX.StdCtrls.TSplitter](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSplitter)
* [FMX.StdCtrls.TPanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel)
* [FMX.StdCtrls.TAniIndicator](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TAniIndicator)
* [FMX.StdCtrls.TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)
* [FMX.StdCtrls.TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
* [FMX.Controls.TStyleBook](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TStyleBook)
* [FMX.Layouts.TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout)

## See Also 


* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)
* [FireMonkey Image Effects](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Image_Effects)

### Samples 


* [FireMonkey Image Filters](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ImageFilters_Sample) sample





