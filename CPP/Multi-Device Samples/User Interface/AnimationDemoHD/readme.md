FMX.AnimationDemoHD Sample[]()
# FMX.AnimationDemoHD Sample 


This sample illustrates how to create HD animations with FireMonkey.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)

* [8.1 Samples](#Samples)


## Location 

You can find the **AnimationDemoHD** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `CPP\Multi-Device Samples\User Interface\AnimationDemoHD`

* **GitHub Repository:**

* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/AnimationDemoHD](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/AnimationDemoHD)

## Description 

The **AnimationDemoHD** sample animates several visual objects on a FireMonkey form. To this end, the sample uses [TColorAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TColorAnimation), [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation), [TPathAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TPathAnimation), and [TBitmapAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TBitmapAnimation). 
## How to Use the Sample 


1.  Navigate to the location given above, and open **AnimationDemoHD.cbproj**.
2.  Select the target platform.
3.  Press F9 or choose **Run > Run**.
4.  See the different animations.

## Files 



|**File in C++**                                  |**Contains**                                   |
|-------------------------------------------------|-----------------------------------------------|
|**AnimationDemoHD.cbproj**                       |The project itself.                            |
|**aniform.fmx**                                  |The main form where the components are located.|
|**AnimationDemoHDPCH.h**, **AnimationDemoHD.cpp**|Used to define and implement the sample.       |


## Classes 

**TForm1** is the main form that represents the main window of the sample. It contains the following components:
*  Three [TAniIndicator](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TAniIndicator) objects labeled as **AniIndicator1**, **AniIndicator2** and **AniIndicator3**.
*  A [TEllipse](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TEllipse) object labeled as **Ellipse1** that contains:

*  A [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) object labeled as **FloatAnimation1**.
*  A [TText](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TText) object labeled as **Text1**.

*  A [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) object labeled as **Image1** that contains:

*  A [TBitmapAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TBitmapAnimation) object labeled as **BitmapAnimation1**.
*  A [TText](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TText) object labeled as **Text4**.

*  A [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object labeled as **Label1**.
*  A [TPath](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TPath) object labeled as **Path1**.
*  A [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) object labeled as **Rectangle1** that contains:

*  A [TColorAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TColorAnimation) object labeled as **ColorAnimation1**.
*  A [TText](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TText) object labeled as **Text2**.

*  A [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) object labeled as **Rectangle2** that contains:

*  A [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) object labeled as **FloatAnimation2**.
*  A [TText](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TText) object labeled as **Text3**.

*  A [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) object labeled as **Rectangle3** that contains:

*  A [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) object labeled as **FloatAnimation4**.
*  A [TText](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TText) object labeled as **Text5**.

*  A [TRoundRect](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRoundRect) object labeled as **RoundRect1** that contains:

*  A [TPathAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TPathAnimation) object labeled as **PathAnimation1**.
*  A [TText](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TText) object labeled as **Text6**.

*  A [TText](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TText) object labeled as **Text7**.
*  A [TPathAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TPathAnimation) object labeled as **PathAnimation2**.

## Implementation 


*  The sample uses:

* [TAniIndicator](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TAniIndicator) to represent an animated spinning indicator used for illustrating an indefinite waiting time for application processes.
* [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) to display text in FireMonkey forms.
* [TEllipse](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TEllipse) to define a 2D ellipse shape.
* [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) to define a 2D rectangle shape.
* [TRoundRect](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRoundRect) to define a 2D rectangle shape with rounded corners.
* [TText](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TText) to define 2D text object.
* [TPath](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TPath) to define 2D path-type shapes representing groups of connected curves and lines.
* [TPathAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TPathAnimation) to move a visual object on a specified [path](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TPath).
* [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) to display and define 2D image components.
* [TBitmapAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TBitmapAnimation) to change the display of an image over time.
* [TColorAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TColorAnimation) to change the color of a FireMonkey object over time.
* [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) attached to a [3D object](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D) in order to animate it.
When you run the application, you see several animated FireMonkey objects. The animations do the following:
* **FloatAnimation1** is attached to **Ellipse1**. It has the [PropertyName](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TCustomPropertyAnimation.PropertyName) set to `RotationAngle` with the [StartValue](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation.StartValue) set to `0` and the [StopValue](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation.StopValue) set to `360`. This means that the ellipse rotates from 0 degrees to 360 degrees. Moreover, Its [Loop](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TAnimation.Loop) property is set to `True`, in order to repeat the animation.
* **FloatAnimation2** is attached to **Rectangle2**. It has the [PropertyName](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TCustomPropertyAnimation.PropertyName) set to `Opacity`, which means that the animation customizes the transparency of the rectangle. Moreover, the [Loop](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TAnimation.Loop) property of the animation is set to `True`, which means that the animation is repeatedly executed.
* **FloatAnimation4** is attached to **Rectangle3**. It has the [PropertyName](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TCustomPropertyAnimation.PropertyName) property set to `Position.X`, which means that the animation moves the rectangle through the X axis.
* **PathAnimation1** is attached to **RoundRect1**. It makes the round rectangle follow the path determined by the **Path1** object. The [duration](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TPathAnimation.Duration) property of the animation indicates that the rectangle completes the path in 6 seconds.
* **PathAnimation2** is attached to **Text7**. It makes the text follow the path determined by the **Path1** object. The [duration](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TPathAnimation.Duration) property of the animation indicates that the text completes the path in 3 seconds.
* **ColorAnimation1** is attached to **Rectangle1**. It has the [PropertyName](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TCustomPropertyAnimation.PropertyName) property set to `Fill.Color`. It fills the shape with a certain color.
* **BitmapAnimation1** is attached to **Image1**. It has the [PropertyName](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TCustomPropertyAnimation.PropertyName) property set to `Bitmap` and the [Trigger](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TAnimation.Trigger) and [TriggerInverse](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TAnimation.TriggerInverse) properties set to `IsMouseOver=true` and `IsMouseOver=false`, respectively. This means that **Image1** changes when the mouse is on the image. The inverse of the animation starts when the mouse leaves the image.

## Uses 


* [FMX.StdCtrls.TAniIndicator](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TAniIndicator)
* [FMX.Objects.TText](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TText)
* [FMX.StdCtrls.TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
* [FMX.Objects.TEllipse](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TEllipse)
* [FMX.Objects.TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle)
* [FMX.Objects.TRoundRect](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRoundRect)
* [FMX.Objects.TPath](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TPath)
* [FMX.Objects.TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage)
* [FMX.Ani.TColorAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TColorAnimation)
* [FMX.Ani.TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation)
* [FMX.Controls.TPathAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TPathAnimation)
* [FMX.Ani.TBitmapAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TBitmapAnimation)

## See Also 


* [FireMonkey 3D](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_3D)
* [Tutorial: Creating a FireMonkey 3D Application](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Creating_a_FireMonkey_3D_Application)

* [Creating the User Interface](http://docwiki.embarcadero.com/RADStudio/en/Creating_the_User_Interface_(FireMonkey_3D_Tutorial))
* [Creating a 2D Interface in a 3D Application](http://docwiki.embarcadero.com/RADStudio/en/Creating_a_2D_Interface_in_a_3D_Application_(FireMonkey_3D_Tutorial))
* [Creating a FireMonkey 3D Application with Animation Effects](http://docwiki.embarcadero.com/RADStudio/en/Creating_a_FireMonkey_3D_Application_with_Animation_Effects)

* [Using FireMonkey Animation Effects](http://docwiki.embarcadero.com/RADStudio/en/Using_FireMonkey_Animation_Effects)

### Samples 


* [FireMonkey 3D Animation](http://docwiki.embarcadero.com/CodeExamples/en/FMX.AnimationDemo3D_Sample) sample
* [FireMonkey 3D GUI](http://docwiki.embarcadero.com/CodeExamples/en/FMX.GUI3d_Sample) sample
* [FireMonkey First App3D](http://docwiki.embarcadero.com/CodeExamples/en/FMX.FirstApp3D_Sample) sample
* [FireMonkey TFmxObject AnimateFloat](http://docwiki.embarcadero.com/CodeExamples/en/FMXTFmxObjectAnimateFloat_%28C%2B%2B%29) (C++)
* [FireMonkey Attach TAnimation](http://docwiki.embarcadero.com/CodeExamples/en/FMXAttachTAnimation_%28C%2B%2B%29) (C++)





