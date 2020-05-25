VCL.InetWinSockets Sample[]()
# VCL.InetWinSockets Sample 


This Windows sockets sample is a package that installs the **Web.Win.Sockets** components in the Internet category on the Tool Palette. **Web.Win.Sockets** was removed from the product, but you can see the documentation for **Web.Win.Sockets** on the XE5 docwiki: [http://docwiki.embarcadero.com/RADStudio/XE5/en/Working_with_sockets_Index](http://docwiki.embarcadero.com/RADStudio/XE5/en/Working_with_sockets_Index)

## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **InetWinSockets** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to **Object Pascal\VCL\InetWinSockets**
* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/InetWinSockets/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/InetWinSockets/)

## Description 

This sample consists of a package (.bpl) that you can install in RAD Studio. The package installs three Web.Win.Sockets components in the Tool Palette. 
## How to Use the Sample 


1.  Navigate to **Start | Programs | Embarcadero RAD Studio Rio | Samples** and open **Object Pascal\VCL\InetWinSockets.dproj**.
2.  Right-click the .bpl in the Project Manager.
3.  Click **Install**.

## Files 



|**File**                 |**Contains**                                                                                                |
|-------------------------|------------------------------------------------------------------------------------------------------------|
|**InetWinSocketsReg.pas**|The code for registering the **InetWinSockets** components and their property editor                        |
|**inetwinsockets.dpk**   |The source code for the **InetWinSockets** package                                                          |
|**inetwinsockets.res**   |Resource file for the **InetWinSockets** package; contains the icons for the Tool Palette.                  |
|**SocketsEditor**        |The code for the sockets editor.                                                                            |
|**Web.Win.Sockets.pas**  |The source file for the deprecated **Web.Win.Sockets** unit, upon which the InetWinSockets package is built.|


## Implementation 

Installing the **InetWinSockets** package in the IDE installs three **Web.Win.Sockets** components (**TTcpClient**, **TTcpServer**, and **TUpdpSocket**) in the Internet category on the Tool Palette.
## Uses 


* **Web.Win.Sockets** (deprecated and included in this sample)

## See Also 


* [Working with Sockets (System.Win.ScktComp)](http://docwiki.embarcadero.com/RADStudio/en/Working_with_Sockets_Index)
* [Working with Sockets (Web.Win.Sockets (XE5)](http://docwiki.embarcadero.com/RADStudio/XE5/en/Working_with_sockets_Index)





