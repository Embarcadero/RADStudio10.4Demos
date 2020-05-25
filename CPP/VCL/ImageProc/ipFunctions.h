//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef ipFunctionsH
#define ipFunctionsH
//---------------------------------------------------------------------------
#include <Dialogs.hpp>
#include <math.h>


bool loadImage(const AnsiString filename, Graphics::TBitmap *bitmap);
void convertToGrayScale(TImage *image);
void sobel(TImage *image);
void negative(TImage *image);
void averageFilter(TImage *image);
void medianFilter(TImage *image);
void flipH(TImage *image);
void flipV(TImage *image);
void stretchHistogram(TImage *image);
void sobel2(TImage *image);
void addImages(TImage *ImgA, TImage *ImgB, TImage *Result);
void subtractImages(TImage *ImgA, TImage *ImgB, TImage *Result);
void averageImages(TImage *ImgA, TImage *ImgB, TImage *Result);
void oldPicture(TImage *Image);
void linearTransformation(TImage *image, Byte **auximage, float a,  int b);

#endif

