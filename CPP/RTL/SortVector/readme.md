RTL.SortVector Sample[]()
# RTL.SortVector Sample 


This sample demonstrates how to sort a vector using the [sort](http://www.cplusplus.com/reference/algorithm/sort) function of C++
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

You can find the **SortVector** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `CPP\RTL\SortVector`

* **GitHub Repository:**

* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/RTL/SortVector](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/RTL/SortVector)

## Description 

The **SortVector** sample demostrates how to sort a random vector of integers. First, the sample generates the random vector and then, sorts it into ascending order. It uses two [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) objects to display both the random and the sorted vector. Each item of each [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) object is used to display each number.
## How to Use the Sample 


1.  Navigate to the location given above and open `SortVector.cbproj`.
2.  Select a target platform in the **[Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window)**.
3.  Press `F9` or choose **Run > Run**.

## Files 



| File                              | Contains                                            |
|-----------------------------------|-----------------------------------------------------|
|`SortVector.cbproj``SortVector.cpp`|The project itself.                                  |
|`UIForm.h``UIForm.cpp``UIForm.fmx` |The main form.                                       |
|`Unit2.h``Unit2.cpp`               |The main functions used to generate and sort vectors.|


## Classes 

**TForm3** is the main form that represents the main window of the sample. It contains the following components:
*  Two [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) objects labeled as **ListBox1** and **ListBox2**.
*  Two [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) objects labeled as **Button1** and **Button2**.

## Implementation 


*  The sample uses [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) to
*  The sample uses [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) to enable or activate a function such as generating random numebrs.
When you run the application, the sample shows two buttons: **Generate Numbers** and **Sort**. When you click on **GenerateNumbers**, the sample generates a list of 10000 integer random numbers. While generating the vector of random numbers, each number is added to an item of **ListBox1**. Therefore **ListBox1** shows the all the random numbers. Once the vector of random numbers has been created, you can click on the **Sort** button in order to sort the vector into ascending order. To this end, the sample uses the [sort](http://www.cplusplus.com/reference/algorithm/sort) function of C++. The ordered vector is shown in **ListBox2**
## Uses 


* [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)
* [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
* [sort](http://www.cplusplus.com/reference/algorithm/sort)

## See Also 


* [Modern C++ Features Supported by RAD Studio Clang-enhanced C++ Compilers](http://docwiki.embarcadero.com/RADStudio/en/Modern_C%2B%2B_Features_Supported_by_RAD_Studio_Clang-enhanced_C%2B%2B_Compilers)
* [Standard Template Library (STL)](http://docwiki.embarcadero.com/RADStudio/en/Dinkumware_Standard_C%2B%2B_Library)

### Samples 


* [Generic vector sort](http://docwiki.embarcadero.com/CodeExamples/en/Generic_vector_sort_%28C%2B%2B%29) (C++)





