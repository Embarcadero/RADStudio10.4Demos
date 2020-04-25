VCL.ImageProc Sample[]()
# VCL.ImageProc Sample 


This sample demonstrates how to use [TImage](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TImage), [TBitmap](http://docwiki.embarcadero.com/Libraries/en/Vcl.Graphics.TBitmap), and other related components to manipulate characteristics of images, including contrast, negatives, and arithmetic operations.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)

* [7.1 Samples](#Samples)

* [8 See Also](#See_Also)


## Location 

You can find the **ImageProcessing** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to **CPP\VCL\ImageProc**
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/ImageProc/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/ImageProc/)

## Description 

This sample consists of an image editor. You can open up to three images at the same time and perform operations on them: adjust the brightness and contrast, flip the image, apply filters and effects, calculate the sum, difference, and average of two images. 
## How to Use the Sample 


1.  Navigate to **Start | Programs | Embarcadero RAD Studio Rio | Samples** and open **ImageProcessing.cbproj**.
2.  Press F9 or choose **Run > Run**.

## Files 



|**File**       |**Contains**                                                                                      |
|---------------|--------------------------------------------------------------------------------------------------|
|**About**      |The form for the about box to be displayed from the Help menu.                                    |
|**Arithmetic** |The form displayed when the user chooses to add, subtract, or calculate the average of two images.|
|**Brightness** |The dialog displayed to adjust the brightness and contrast.                                       |
|**ipFunctions**|Global functions necessary to manipulate images.                                                  |
|**MainForm**   |The form for the editor itself.                                                                   |
|**Threashold** |The form displayed when the user chooses to adjust the threshold.                                 |


## Classes 


* **TForm5** represents the class for the about box that is displayed from the Help menu.
* **TForm3** represents the class for the brightness/contrast form.
* **TForm1** implements the main form. It handles the visual and nonvisual components and the occurring events.
* **TForm4** implements the class for the threshold form.

## Implementation 


*  To select a line of pixels in an image, the [TBitmap.ScanLine](http://docwiki.embarcadero.com/Libraries/en/Vcl.Graphics.TBitmap.ScanLine) property is used, which returns an array of values. If the image is in grayscale, the array has the same length as the image width. If the image is in color, the array has 3 times the image width, each pixel being represented by three values – blue, green, and red, in that order.
*  The **Sobel** and **Sobel2** methods implement the sobel operator used in edge detection. In this application, edge detection is used to create the drawing and detailed drawing effects.
* **addImage**, **subtractImage**, and **averageImage** apply only to two grayscale images and calculate the sum, difference, or average of pixels in corresponding positions in the two images.
*  To adjust the brightness and contrast of an image, a linear transformation is applied to every pixel.
*  The auto-contrast is set by stretching the histogram.
*  For the old picture effect, every pixel is first converted to its gray correspondent, therefore blue, green, and red will have the same value. Then, a tone of yellow is added by subtracting a constant from the blue value.

## Uses 


* [TPicture](http://docwiki.embarcadero.com/Libraries/en/Vcl.Graphics.TPicture)
* [TBitmap](http://docwiki.embarcadero.com/Libraries/en/Vcl.Graphics.TBitmap)
* [TBitmap.ScanLine](http://docwiki.embarcadero.com/Libraries/en/Vcl.Graphics.TBitmap.ScanLine)
* [TImage](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TImage)
* [TImageList](http://docwiki.embarcadero.com/Libraries/en/Vcl.Controls.TImageList)
* [Vcl.ExtCtrls.TImage.Picture](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TImage.Picture)
* [TGraphic.SaveToFile](http://docwiki.embarcadero.com/Libraries/en/Vcl.Graphics.TGraphic.SaveToFile)
* [TGraphic.LoadFromFile](http://docwiki.embarcadero.com/Libraries/en/Vcl.Graphics.TGraphic.LoadFromFile)

### Samples 


* [FMX.AccessCameraApp Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.AccessCameraApp_Sample)

## See Also 


* [Sobel operator on Wikipedia](http://en.wikipedia.org/wiki/Sobel_operator)





