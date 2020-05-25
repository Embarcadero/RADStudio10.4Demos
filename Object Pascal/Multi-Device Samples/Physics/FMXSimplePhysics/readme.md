FMX.SimplePhysics Sample[]()
# FMX.SimplePhysics Sample 


This sample demostrates how to use the [Box2D](http://docwiki.embarcadero.com/RADStudio/en/Using_Box2D_in_Delphi_Applications) physics engine with FireMonkey controls in Delphi applications.
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

You can find the **FMSimplePhysics** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Physics\FMXSimplePhysics`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Physics/FMXSimplePhysics](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Physics/FMXSimplePhysics)

## Description 

The **FMSimplePhysics** sample shows you how to create a simulation based on the laws of the physics using [Box2D](http://docwiki.embarcadero.com/RADStudio/en/Box2D). This sample simulates the effect of gravity applied to the FireMonkey controls of the form. Therefore, the controls of the form fall from the top of the form to the bottom. Moreover, the controls bounce and collide with each other when they reach the bottom of the form.
## How to Use the Sample 


1.  Navigate to the location given above and open `FMSimplePhysics.dproj`.
2.  Select the target platform.
3.  Press **F9** or choose **Run > Run**.
4.  Interact with the sample:

*  Click the **Drop** button to start the physics simulation. All the components on the form fall to the bottom.
*  Click **Reset** to reset the form. Place all the components in a random position along the top of the form.

## Files 



| File in Delphi                             | Contains                                                                                                                    |
|--------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
|`FMSimplePhysics.dproj``FMSimplePhysics.dpr`|The project itself.                                                                                                          |
|`uFormFmxPhysics.pas``uFormFmxPhysics.fmx`  |The main form.                                                                                                               |
|`uFmxPhysicsDemo.pas`                       |The main unit.                                                                                                               |
|`uCustomSimulation.pas`                     |The basic simulation unit.                                                                                                   |
|`uFlatBox2DSimulation.pas`                  |The unit that provides [Box2D](http://docwiki.embarcadero.com/RADStudio/en/Box2D) features to the basic simulation unit. |
|`uSimulationFmxCtrls.pas`                   |The unit that defines the simulation class implemented in this sample.                                                       |
|`uSimulationFmxCtrls.pas`                   |The unit that implements a Helper class of [TControl](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl).|


## Classes 

**TFormFmxPhysics** is the main form that represents the main window of the sample. It contains the following components: 
*  A [TToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) object called **ToolBar1** that contains the following components:

*  A [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) called **ButtonPhysics** with the [Text](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton.Text) property set to `Drop`.
*  A [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) called **ResetBtn** with the [Text](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton.Text) property set to `Reset`.

*  A [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) object with the [Text](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton.Text) property set to `Button`.
*  A [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox) object with the [Text](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox.Text) property set to `CheckBox`.
*  A [TPanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel) object called **Panel1** that contains the following components:

*  A [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object with the [Text](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel.Text) property set to `Panel`.
*  Two [TSpeedButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton) objects.

*  A [TProgressBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TProgressBar) object.
*  A [TRadioButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TRadioButton) object.
*  Two [TScrollBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TScrollBar) objects.
*  A [TComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox) object.
*  A [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object with the [Text](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel.Text) property set to `I'm a label`.
*  A [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) object with the [Text](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit.Text) property set to `some text`.
*  A [TTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar) object.

## Implementation 

When you run the application, the form of the sample displays all the controls listed above. The sample implements an [OnClick](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton.OnClick) event for each of the following buttons:
* **Drop** - the event of this button briefly animates the FireMonkey components of the form. This event uses [Box2D](http://docwiki.embarcadero.com/RADStudio/en/Box2D) features to simulate the effect of gravity applied to the controls of the form.
* **Reset** - the event of this button resets the form. Therefore, all the components of the form are placed in a random position along the top of the form.

## Uses 


* [FMX.StdCtrls.TToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar)
* [FMX.StdCtrls.TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)
* [FMX.StdCtrls.TCheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox)
* [FMX.StdCtrls.TPanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel)
* [FMX.StdCtrls.TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
* [FMX.StdCtrls.TSpeedButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton)
* [FMX.StdCtrls.TProgressBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TProgressBar)
* [FMX.StdCtrls.TRadioButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TRadioButton)
* [FMX.StdCtrls.TScrollBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TScrollBar)
* [FMX.ListBox.TComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox)
* [FMX.Edit.TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit)
* [FMX.StdCtrls.TTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar)

## See Also 


* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)
* [FireMonkey Application Design](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Application_Design)
* [Using Box2D in Delphi Applications](http://docwiki.embarcadero.com/RADStudio/en/Using_Box2D_in_Delphi_Applications).

### Samples 


* [Box2D Hello](http://docwiki.embarcadero.com/CodeExamples/en/Box2D.Box2DHello) sample
* [Box2D TestBed](http://docwiki.embarcadero.com/CodeExamples/en/Box2D.TestBed) sample





