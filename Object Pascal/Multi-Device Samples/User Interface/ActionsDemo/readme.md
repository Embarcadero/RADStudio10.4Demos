FMX.ActionsDemo Sample[]()
# FMX.ActionsDemo Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)

This sample illustrates how to use FireMonkey actions. It demonstrates how to use the Action List editor to create action lists and to assign client controls to actions.
## Location 

You can find the **ActionsDemo** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\ActionsDemo`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ActionsDemo](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ActionsDemo)

## Description 

This sample uses FMX action lists to show how FMX actions can be used on FMX forms. 
## How to Use the Sample 


1.  Open the **ActionsDemo.dproj** sample project from the location given above.
2.  Press **F9** or choose **Run > Run**. The **Demo actions in FireMonkey** application opens.
3.  In this application, select **View > PanelValueRange** and **View > Display Active Form and Focused Control**.
4.  In the **PanelValueRange** pane, move sliders and test other controls. The **Display Active Form and Focused Control** form shows names of controls selected in the **PanelValueRange** pane.
5.  Try to activate actions associated to menu commands.
6.  Try to activate the virtual keyboard using the context menu.

## Implementation 


1.  From the **Project Manager**, open the UMainForm.pas file. The main form opens.
2.  In the **Structure** view, select **PanelValueRange**.
3.  In the [Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector_(IDE_Tutorial)), locate the **Visible** property and set it `True`. The controls placed in the **PanelValueRange** panel become visible.
4.  On the right side of the **MainForm** form you see the **MainMenu1** and **PopupMenu1** menus and the **FMXActionList1** action list objects.
5.  Double-click **FMXActionList1**; the [Action List editor](http://docwiki.embarcadero.com/RADStudio/en/Action_List_editor) opens. Check which standard actions are in the list. Select an action and view its properties in the **Object Inspector**.
6.  Double-click **MainMenu1**; [Items Designer](http://docwiki.embarcadero.com/RADStudio/en/Items_Designer) opens. Select a menu command and view its properties in the **Object Inspector**. Locate the **Action** property and check which FMX action is assigned to the menu command.
7.  In the **Form Designer**, in the **PanelValueRange** panel select a control having the **Value** property. In the **Object Inspector**, locate the **Action** property of the selected control; check that it is associated with the `ValueRangeAction1` FMX action. Select the **Value** property of the selected control and change its value. You see that values of all controls associated with this `ValueRangeAction1` action have changed.
8.  Expand the **Action** property of the selected control and view the properties of the action in the **Object Inspector**. At the bottom of the list of the action properties, locate the **Value** property of the action and change its value. Check that the value of the **Value** property of the control has changed accordingly. If these two **Value** properties have different values, then only the value highlighted with bold is stored in the .FMX file.

## Uses 


* [System.Actions](http://docwiki.embarcadero.com/Libraries/en/System.Actions)
* [FMX.StdActns](http://docwiki.embarcadero.com/Libraries/en/FMX.StdActns)
* [FMX.ActnList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList)
* [FMX.Menus](http://docwiki.embarcadero.com/Libraries/en/FMX.Menus)

## See Also 


* [FireMonkey Actions](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Actions)
* [FMX action lists](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList)
* [Action List editor](http://docwiki.embarcadero.com/RADStudio/en/Action_List_editor)





