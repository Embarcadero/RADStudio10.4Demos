Box2D.Box2DHello[]()
# Box2D.Box2DHello 


A "Hello World" example for the [Box2D](http://docwiki.embarcadero.com/RADStudio/en/Box2D) third party add-on.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 Main Form](#Main_Form)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **SurfSpotFinderApp** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Physics\Box2DHello`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Physics/Box2DHello](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Physics/Box2DHello)

## Description 

A "Hello World" example for the [Box2D](http://docwiki.embarcadero.com/RADStudio/en/Box2D) third party add-on.The application uses the following controls:

* `Button1`: Fires the `Button1ClickHandler`.
* `Memo1`: Displays the output of the application.

## How to Use the Sample 


1.  Navigate to one of the locations given above and open **FlatBox2DObjPasHelloWorld.dproj**.
2.  Press **F9** or choose **Run > Run**.
3.  Press "Run Simulation".
The output displays 60 readings of the coordinates and the angle of a dynamic object over time.
## Implementation 


### Main Form 

The **MainForm** unit implements the following event handler:
* `Button1ClickHandler`: Initializes a world, a ground body, and a box object. It creates the box object at coordinates (0, 4), which means that the box object is "in the air". It iterates through 60 steps of the simulation and in each step it passes the coordinates and the angle of the box object to the `Log` method.
The **MainForm** unit also implements the following methods:
* `Log`: Displays the output of the simulation in the `Memo1` control.

## Uses 


* [FMX.Graphics](http://docwiki.embarcadero.com/Libraries/en/FMX.Graphics)

* [FMX.Memo.TMemo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo)

## See Also 


* [Box2D](http://docwiki.embarcadero.com/RADStudio/en/Box2D)
* [Using Box2D in Delphi Applications](http://docwiki.embarcadero.com/RADStudio/en/Using_Box2D_in_Delphi_Applications)
* [Using Box2D in C++Builder Applications](http://docwiki.embarcadero.com/RADStudio/en/Using_Box2D_in_C%2B%2BBuilder_Applications)

* [Box2D User Manual"](http://box2d.org/manual.pdf)





