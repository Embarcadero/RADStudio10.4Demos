RTL.BoostArchiveDemo Sample[]()
# RTL.BoostArchiveDemo Sample 


This sample demonstrates how to use the [Boost](http://www.boost.org/) C++ library.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 See Also](#See_Also)


## Location 

You can find the **BoostArchiveDemo** sample project at:
* **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples** and then navigate to:

* `CPP\RTL\BoostArchiveDemo`

* **GitHub Repository:**

* **C++:**[http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/RTL/BoostArchiveDemo](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/RTL/BoostArchiveDemo)

## Description 

The **BoostArchiveDemo** sample demonstrates how to use the [Boost](http://www.boost.org/) C++ library. Concretely, the intent of this sample is to serve as a tutorial for users of the [Serialization](http://www.boost.org/doc/libs/1_59_0/libs/serialization/doc/index.html) package to illustrate most of the facilities of the package. To this end, this sample models the bus system of a small city, including multiple bus stops, bus routes and schedules
## How to Use the Sample 


1.  Navigate to the location given above and open `BoostArchiveDemo.cbproj`.
2.  Select a target platform in the **[Projects Window](http://docwiki.embarcadero.com/RADStudio/Denali/en/Projects_Window)**.
3.  Press `F9` or choose **Run > Run**.
The **Boost** library is not installed with the default RAD Studio installation. If you do not have the **Boost** library installed when runnig this sample, the following compilation error appears:`[bcc64 Fatal Error] MainUnit.cpp(27): 'boost/archive/tmpdir.hpp' file not found`See this page [to install Boost](http://docwiki.embarcadero.com/RADStudio/Denali/en/Boost).
## Files 



| File                                          | Contains          |
|-----------------------------------------------|-------------------|
|`BoostArchiveDemo.cbproj``BoostArchiveDemo.cpp`|The project itself.|
|`MainUnit.h``MainUnit.cpp``MainUnit.fmx`       |The main form.     |


## See Also 


* [Installing Boost](http://docwiki.embarcadero.com/RADStudio/Denali/en/Boost).
* [Boost](http://www.boost.org/)
* [Serialization](http://www.boost.org/doc/libs/1_59_0/libs/serialization/doc/index.html)





