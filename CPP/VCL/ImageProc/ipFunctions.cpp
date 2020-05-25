//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#pragma hdrstop

#include "ipFunctions.h"

//---------------------------------------------------------------------------

#pragma package(smart_init)

// Sort function
void sort(Byte  vet[9])
{
  int i,j,aux;
  for(i=0;i<9;i++)
  {
    for(j=i+1; j<9; j++)
    {
      if(vet[j]>vet[i])
      {
        aux=vet[i];
        vet[i]=vet[j];
        vet[j]=aux;
      }
    }
  }
}

// Loads "filename" image to a TBitmap instance
bool loadImage(const AnsiString filename, Graphics::TBitmap *bitmap) {

   // Create an auxiliar TPicture object, and load it with the apropriate image
   TPicture *AuxPicture = new TPicture();
   try
   {
      AuxPicture->LoadFromFile(filename);
   }
   catch(const EInvalidGraphic &Err)
   {
      MessageDlg(Err.Message, mtError, TMsgDlgButtons() << TMsgDlgBtn::mbOK, 0);
      delete AuxPicture;
      return false;
   }

   // Remove current image, and loads the new one
   DeleteObject(bitmap->ReleaseHandle());
   bitmap->Assign(AuxPicture->Graphic);

   delete AuxPicture;
   return true;
}

//Converts a color image (RGB 24 bits) to a 8 bit grayscale image
void convertToGrayScale(TImage *image) {
  int x,y,i;
  Byte *p, grayLevel;
  //LOGPALETTE *logpal;
  for(y=0;y<image->Picture->Bitmap->Height; y++)
  {
    p =  (byte *) image->Picture->Bitmap->ScanLine[y];
    for(x=0;x<image->Picture->Bitmap->Width*3-1;x+=3)
    {
      //p[x] - Blue value (RGB)
      //p[x+1] - Green value (RGB)
      //p[x+2] - Red value (RGB)
      // Replace every value for the correspondent gray value (R*0.3+G0.59+B*0.3)
      p[x]=p[x+1]=p[x+2]= p[x]*0.11+p[x+1]*0.59+p[x+2]*0.3;
    }
  }
  image->Picture->Bitmap->PixelFormat=pf8bit;

  //Creates a new pallete for a grayscale image
  LOGPALETTE *newpal = (LOGPALETTE*) malloc(sizeof(LOGPALETTE) +255 * sizeof(PALETTEENTRY) );
  newpal->palVersion = 0x0300;
  newpal->palNumEntries = 256;

  for (i=0; i<256; i++)
  {
    newpal->palPalEntry[i].peRed   = i;
    newpal->palPalEntry[i].peGreen = i;
    newpal->palPalEntry[i].peBlue  = i;
    newpal->palPalEntry[i].peFlags = 0;
  }

  // Replace the existing pallete by the new one
  DeleteObject(image->Picture->Bitmap->ReleasePalette());
  image->Picture->Bitmap->Palette = CreatePalette(newpal);
  free(newpal);
}

// Calculate the gradient using Sobel operators.
void sobel(TImage *image)
{
    int x, y;
    int auxvalue1;
    int auxvalue2;
    int newvalue;
    Byte **matrix;
    Byte *pa, *pb, *pc, *p;


    //Declare a vector to hold the values for the new image
    matrix = (Byte **) calloc (image->Picture->Bitmap->Height,sizeof(int *));
    for(y = 0; y < image->Picture->Bitmap->Height; y++)
        matrix[y] = (Byte *) calloc (image->Picture->Bitmap->Width,sizeof(Byte *));

    //Scan the image vertically
    for (y = 0; y < image->Picture->Bitmap->Height; y++)
    {
        //If this is the first or the last line, just copy the value
        //to the new image
        if((y==0)||(y==image->Picture->Bitmap->Height-1))
        {
          pb = (byte *) image->Picture->Bitmap->ScanLine[y];
        }
        else
        {
          pa = (byte *) image->Picture->Bitmap->ScanLine[y-1];
          pb = (byte *) image->Picture->Bitmap->ScanLine[y];
          pc = (byte *) image->Picture->Bitmap->ScanLine[y+1];
                }

        //Scan the image horizontally
        for (x = 1; x < image->Picture->Bitmap->Width-1; x++)
        {
          if((x==0)||(x==image->Picture->Bitmap->Width-1)||
          (y==0)||(y==image->Picture->Bitmap->Height-1))
          {
             matrix[y][x]=pb[x];
          }
          else
          {
            auxvalue1= pa[x+1] - pa[x-1] +
                  2*pb[x+1] - 2*pb[x-1] +
                  pc[x+1] - pc[x-1];

            auxvalue2= pa[x-1] - pc[x-1] +
                  2*pa[x] - 2*pc[x] +
                  pc[x+1] - pc[x+1];

            newvalue = sqrt(pow(auxvalue1,2)+pow(auxvalue2,2));

            if(newvalue>255) matrix[y][x]=255;
            else if (newvalue<0) matrix[y][x]=0;
            else matrix[y][x] = newvalue;
          }
        }

    }

    //Loads
    for (y=0; y < image->Picture->Bitmap->Height-1;y++)
    {
        p = (byte *) image->Picture->Bitmap->ScanLine[y];

        for (x = 1; x < image->Picture->Bitmap->Width-1; x++)
        {
          p[x]=matrix[y][x];
        }
    }
}

//Replace each pixel p for its negative value (255 - p)
void negative(TImage *image)
{
    int x, y;
    Byte *p;
    int hValues; //Number of values the image have in each line (3 x width for colour images)
    if(image->Picture->Bitmap->PixelFormat==pf24bit)
      hValues = 3*image->Picture->Bitmap->Width;
    else
      hValues = image->Picture->Bitmap->Width;


    for (y = 0; y < image->Picture->Bitmap->Height; y++)
    {
        p = (byte *) image->Picture->Bitmap->ScanLine[y];
        for (x = 0; x < hValues; x++)
        {
           p[x]=255-p[x];
        }
    }
}

// Apply the average filter for noise reduction
void averageFilter(TImage *image)
{
    int x, y, i;
    int newvalue;
    Byte **matrix;
    Byte *pa, *pb, *pc, *p;


    //Declare a vector to hold the values for the new image
    matrix = (Byte **) calloc (image->Picture->Bitmap->Height,sizeof(int *));
    for(y = 0; y < image->Picture->Bitmap->Height; y++)
        matrix[y] = (Byte *) calloc (image->Picture->Bitmap->Width,sizeof(Byte *));

    //Scan the image vertically
    for (y = 0; y < image->Picture->Bitmap->Height; y++)
    {
        //If this is the first or the last line, just copy the value
        //to the new image
        if((y==0)||(y==image->Picture->Bitmap->Height-1))
        {
          pb = (byte *) image->Picture->Bitmap->ScanLine[y];
        }
        else
        {
          pa = (byte *) image->Picture->Bitmap->ScanLine[y-1];
          pb = (byte *) image->Picture->Bitmap->ScanLine[y];
          pc = (byte *) image->Picture->Bitmap->ScanLine[y+1];
        }

        //Scan the image horizontally
        for (x = 0; x < image->Picture->Bitmap->Width; x++)
        {
          //If we are at the first or last line, or at the first or
          //last column, simply copy the value to the new image
          if((x==0)||(x==image->Picture->Bitmap->Width-1)||
          (y==0)||(y==image->Picture->Bitmap->Height-1))
          {
             matrix[y][x]=pb[x];
          }
          else
          {
            newvalue=0;
            for(i=-1; i<2;i++)
            {
               newvalue+=pa[x+i]+pb[x+i]+pc[x+i];
            }
            matrix[y][x] = newvalue/9;
          }
        }
    }

    //Loads
    for (y=0; y < image->Picture->Bitmap->Height-1;y++)
    {
        p = (byte *) image->Picture->Bitmap->ScanLine[y];

        for (x = 1; x < image->Picture->Bitmap->Width-1; x++)
        {
          p[x]=matrix[y][x];
        }
    }
}

// Apply the median filter for noise reduction
void medianFilter(TImage *image)
{
    int x, y, i;
    Byte value[9];
    Byte **matrix;
    Byte *pa, *pb, *pc, *p;


    //Declare a vector to hold the values for the new image
    matrix = (Byte **) calloc (image->Picture->Bitmap->Height,sizeof(int *));
    for(y = 0; y < image->Picture->Bitmap->Height; y++)
        matrix[y] = (Byte *) calloc (image->Picture->Bitmap->Width,sizeof(Byte *));

    //Scan the image vertically
    for (y = 0; y < image->Picture->Bitmap->Height; y++)
    {
        //If this is the first or the last line, just copy the value
        //to the new image
        if((y==0)||(y==image->Picture->Bitmap->Height-1))
        {
          pb = (byte *) image->Picture->Bitmap->ScanLine[y];
        }
        else
        {
          pa = (byte *) image->Picture->Bitmap->ScanLine[y-1];
          pb = (byte *) image->Picture->Bitmap->ScanLine[y];
          pc = (byte *) image->Picture->Bitmap->ScanLine[y+1];
        }

        //Scan the image horizontally
        for (x = 0; x < image->Picture->Bitmap->Width; x++)
        {
          //If we are at first or last line, or at the first or
          //last column, simply copy the value to the new image
          if((x==0)||(x==image->Picture->Bitmap->Width-1)||
          (y==0)||(y==image->Picture->Bitmap->Height-1))
          {
             matrix[y][x]=pb[x];
          }
          else
          {
            value[0]=pa[x-1];
            value[1]=pa[x];
            value[2]=pa[x+1];
            value[3]=pb[x-1];
            value[4]=pb[x];
            value[5]=pb[x+1];
            value[6]=pc[x-1];
            value[7]=pc[x];
            value[8]=pc[x+1];

            sort(value);
            /*
            for(i=0;i<8;i++) if(value[i]<value[i+1])
            {
              ShowMessage("Error");
              exit(1);
            } */
            matrix[y][x] = value[4];
          }
        }
    }
    //Loads
    for (y=0; y < image->Picture->Bitmap->Height-1;y++)
    {
        p = (byte *) image->Picture->Bitmap->ScanLine[y];

        for (x = 1; x < image->Picture->Bitmap->Width-1; x++)
        {
          p[x]=matrix[y][x];
        }
    }
}

//Flip image Horizontally
void flipH(TImage *image)
{
    int x, y, i;
    Byte value[9];
    Byte **matrix;
    Byte *p;
    int hValues; //Number of values the image have in each line (3 x width for colour images)
    if(image->Picture->Bitmap->PixelFormat==pf24bit)
      hValues = 3*image->Picture->Bitmap->Width;
    else
      hValues = image->Picture->Bitmap->Width;


    //Declare a vector to hold the values for the new image
    matrix = (Byte **) calloc (image->Picture->Bitmap->Height,sizeof(int *));
    for(y = 0; y < image->Picture->Bitmap->Height; y++)
        matrix[y] = (Byte *) calloc (hValues,sizeof(Byte *));


    //Scan the image vertically
    for (y = 0; y < image->Picture->Bitmap->Height; y++)
    {
      p = (byte *) image->Picture->Bitmap->ScanLine[y];

      //Scan the image horizontally
      for (x = 0; x < hValues; x++)
      {
        matrix[y][hValues-1-x] = p[x];
      }
    }

//Loads
if(image->Picture->Bitmap->PixelFormat==pf24bit)
{
  for (y=0; y < image->Picture->Bitmap->Height;y++)
    {
        p = (byte *) image->Picture->Bitmap->ScanLine[y];

        for (x = 0; x < hValues; x+=3)
        {
          p[x]=matrix[y][x+2];
          p[x+1]=matrix[y][x+1];
          p[x+2]=matrix[y][x];
        }
    }
}
else
{
    for (y=0; y < image->Picture->Bitmap->Height;y++)
    {
        p = (byte *) image->Picture->Bitmap->ScanLine[y];

        for (x = 0; x < hValues; x++)
        {
          p[x]=matrix[y][x];
        }
    }
}
}

//Flip image Vertically
void flipV(TImage *image)
{
    int x, y, i;
    Byte value[9];
    Byte **matrix;
    Byte *p;
    int hValues; //Number of values the image have in each line (3 x width for colour images)
    if(image->Picture->Bitmap->PixelFormat==pf24bit)
      hValues = 3*image->Picture->Bitmap->Width;
    else
      hValues = image->Picture->Bitmap->Width;


    //Declare a vector to hold the values for the new image
    matrix = (Byte **) calloc (image->Picture->Bitmap->Height,sizeof(int *));
    for(y = 0; y < image->Picture->Bitmap->Height; y++)
        matrix[y] = (Byte *) calloc (hValues,sizeof(Byte *));

    //Scan the image vertically
    for (y = 0; y < image->Picture->Bitmap->Height; y++)
    {
      p = (byte *) image->Picture->Bitmap->ScanLine[y];

      //Scan the image horizontally
      for (x = 0; x < hValues; x++)
      {
        matrix[image->Picture->Bitmap->Height-1-y][x] = p[x];
      }
    }
    //Loads
    for (y=0; y < image->Picture->Bitmap->Height-1;y++)
    {
        p = (byte *) image->Picture->Bitmap->ScanLine[y];

        for (x = 0; x < hValues; x++)
        {
          p[x]=matrix[y][x];
        }
    }
}

// Adjust image contrast by stretching the Image Histogram
void stretchHistogram(TImage *image)
{
  int x, y;
  Byte *p;
  Byte max = 0;
  Byte min = 255;
  Byte range;
  float aux;
  int hValues; //Number of values the image have in each line (3 x width for colour images)
  if(image->Picture->Bitmap->PixelFormat==pf24bit)
    hValues = 3*image->Picture->Bitmap->Width;
  else
    hValues = image->Picture->Bitmap->Width;

  //Scan the image one time to get the max and min values
  for (y = 0; y < image->Picture->Bitmap->Height; y++)
  {
    p = (byte *) image->Picture->Bitmap->ScanLine[y];
      //Scan the image horizontally
    for (x = 0; x < hValues; x++)
    {
      if(p[x]<min)min=p[x];
      if(p[x]>max)max=p[x];
    }
  }
  range=max-min;
  //Create the new image
  for (y = 0; y < image->Picture->Bitmap->Height; y++)
  {
    p = (byte *) image->Picture->Bitmap->ScanLine[y];
      //Scan the image horizontally
    for (x = 0; x < hValues; x++)
    {
      p[x] = (p[x]-min)*255/range;
    }
  }
}

// Calculate the gradient using Sobel operator. The resulting values are normalized
void sobel2(TImage *image)
{
    int x, y;
    int auxvalue1;
    int range;
    int **matrix;
    Byte *pa, *pb, *pc, *p;
    int max=0;
    int min=999999;


    //Declare a vector to hold the values for the new image
    matrix = (int **) calloc (image->Picture->Bitmap->Height,sizeof(int *));
    for(y = 0; y < image->Picture->Bitmap->Height; y++)
        matrix[y] = (int *) calloc (image->Picture->Bitmap->Width,sizeof(int));

    //Scan the image vertically
    for (y = 0; y < image->Picture->Bitmap->Height; y++)
    {
        //If this is the first or the last line, just copy the value
        //to the new image
        if((y==0)||(y==image->Picture->Bitmap->Height-1))
        {
          pb = (byte *) image->Picture->Bitmap->ScanLine[y];
        }
        else
        {
          pa = (byte *) image->Picture->Bitmap->ScanLine[y-1];
          pb = (byte *) image->Picture->Bitmap->ScanLine[y];
          pc = (byte *) image->Picture->Bitmap->ScanLine[y+1];
        }

        //Scan the image horizontally
        for (x = 1; x < image->Picture->Bitmap->Width-1; x++)
        {
          if((x==0)||(x==image->Picture->Bitmap->Width-1)||
          (y==0)||(y==image->Picture->Bitmap->Height-1))
          {
             matrix[y][x]=pb[x];
          }
          else
          {
            auxvalue1= pa[x+1] - pa[x-1] +
                  2*pb[x+1] - 2*pb[x-1] +
                  pc[x+1] - pc[x-1];

            //matrix[y][x] = sqrt(pow(auxvalue1,2)+pow(auxvalue2,2));
            matrix[y][x]=auxvalue1;
            if(matrix[y][x]<min)min=matrix[y][x];
            if(matrix[y][x]>max)max=matrix[y][x];
          }
        }

    }
    range = max-min;
    //Load the image mapping the values to a range of 0 - 255
    for (y=0; y < image->Picture->Bitmap->Height;y++)
    {
        p = (byte *) image->Picture->Bitmap->ScanLine[y];

        for (x = 1; x < image->Picture->Bitmap->Width-1; x++)
        {
          p[x] = (matrix[y][x]-min)*255/range;
        }
        p[0] = p[1];
        p[image->Picture->Bitmap->Width-1] = p[image->Picture->Bitmap->Width-2];
    }
}


void addImages(TImage *ImgA, TImage *ImgB, TImage *Result)
{
  int maxWidth, minWidth;
  int maxHeight, minHeight;
  int y,x,i, auxvalue;
  Byte *pa, *pb, *pc;
  Byte **matrix;


  if(ImgA->Picture->Bitmap->Width>ImgB->Picture->Bitmap->Width)
  {
    maxWidth=ImgA->Picture->Bitmap->Width;
    minWidth=ImgB->Picture->Bitmap->Width;
  }
  else
  {
    maxWidth=ImgB->Picture->Bitmap->Width;
    minWidth=ImgA->Picture->Bitmap->Width;
  }

  if(ImgA->Picture->Bitmap->Height>ImgB->Picture->Bitmap->Height)
  {
    maxHeight=ImgA->Picture->Bitmap->Height;
    minHeight=ImgB->Picture->Bitmap->Height;
  }
  else
  {
    maxHeight=ImgB->Picture->Bitmap->Height;
    minHeight=ImgA->Picture->Bitmap->Height;
  }

  //Declare a vector to hold the values for the new image
  matrix = (Byte **) calloc (maxHeight,sizeof(Byte *));
  for(y = 0; y < maxHeight; y++)
    matrix[y] = (Byte *) calloc (maxWidth,sizeof(Byte));

  //Fill output image with the new results
  for (y = 0; y < maxHeight; y++)
  {
    if(y>=minHeight)
    {
      if(ImgA->Picture->Bitmap->Height>minHeight)
      {
        pa = (byte *) ImgA->Picture->Bitmap->ScanLine[y];
      }
      else
      {
        pa = (byte *) ImgB->Picture->Bitmap->ScanLine[y];
      }
      for (x = 0; x < maxWidth; x++)
      {
        if(x>=minWidth)
        {
          if((ImgA->Picture->Bitmap->Width>minWidth&&ImgA->Picture->Bitmap->Height>minHeight)||
          (ImgB->Picture->Bitmap->Width>minWidth&&ImgB->Picture->Bitmap->Height>minHeight))
          matrix[y][x]=pa[x];
          else matrix[y][x]=0;
        }
        else
        matrix[y][x]=pa[x];
      }

    }
    else
    {
      pa = (byte *) ImgA->Picture->Bitmap->ScanLine[y];
      pb = (byte *) ImgB->Picture->Bitmap->ScanLine[y];
      //Scan the image horizontally
      for (x = 0; x < maxWidth; x++)
      {
        if(x>minWidth)
        {
          if(ImgA->Picture->Bitmap->Width>minWidth)
          matrix[y][x]=pa[x];
          else
          matrix[y][x]=pb[x];
        }
        else
        {
          auxvalue = pa[x]+pb[x];
          if(auxvalue>255)matrix[y][x]=255;
          else if(auxvalue<0)matrix[y][x]=0;
          else matrix[y][x]=auxvalue;
        }
      }
    }
  }

  //Create a new image at the resulting image
  DeleteObject(Result->Picture->Bitmap->ReleaseHandle());
  Result->Picture->Bitmap = new Graphics::TBitmap();
  Result->Picture->Bitmap->SetSize(maxWidth,maxHeight);
  Result->Picture->Bitmap->PixelFormat=pf8bit;

  //Creates a new pallete for a grayscale image
  LOGPALETTE *newpal = (LOGPALETTE*) malloc(sizeof(LOGPALETTE) +255 * sizeof(PALETTEENTRY) );
  newpal->palVersion = 0x0300;
  newpal->palNumEntries = 256;

  for (i=0; i<256; i++)
  {
    newpal->palPalEntry[i].peRed   = i;
    newpal->palPalEntry[i].peGreen = i;
    newpal->palPalEntry[i].peBlue  = i;
    newpal->palPalEntry[i].peFlags = 0;
  }

  // Replace the existing pallete by the new one
  DeleteObject(Result->Picture->Bitmap->ReleasePalette());
  Result->Picture->Bitmap->Palette = CreatePalette(newpal);
  free(newpal);

  Result->Picture->Bitmap->SetSize(maxWidth,maxHeight);

  //Create the new image
  for (y = 0; y < maxHeight; y++)
  {
    pc = (byte *) Result->Picture->Bitmap->ScanLine[y];
    //Scan the image horizontally
    for (x = 0; x < maxWidth; x++)
    {
      pc[x] = matrix[y][x];
    }
  }
  Result->Refresh();
}

void subtractImages(TImage *ImgA, TImage *ImgB, TImage *Result)
{
  int maxWidth, minWidth;
  int maxHeight, minHeight;
  int y,x,i, auxvalue;
  Byte *pa, *pb, *pc;
  Byte **matrix;


  if(ImgA->Picture->Bitmap->Width>ImgB->Picture->Bitmap->Width)
  {
    maxWidth=ImgA->Picture->Bitmap->Width;
    minWidth=ImgB->Picture->Bitmap->Width;
  }
  else
  {
    maxWidth=ImgB->Picture->Bitmap->Width;
    minWidth=ImgA->Picture->Bitmap->Width;
  }

  if(ImgA->Picture->Bitmap->Height>ImgB->Picture->Bitmap->Height)
  {
    maxHeight=ImgA->Picture->Bitmap->Height;
    minHeight=ImgB->Picture->Bitmap->Height;
  }
  else
  {
    maxHeight=ImgB->Picture->Bitmap->Height;
    minHeight=ImgA->Picture->Bitmap->Height;
  }

  //Declare a vector to hold the values for the new image
  matrix = (Byte **) calloc (maxHeight,sizeof(Byte *));
  for(y = 0; y < maxHeight; y++)
    matrix[y] = (Byte *) calloc (maxWidth,sizeof(Byte));

  //Fill output image with the new results
  for (y = 0; y < maxHeight; y++)
  {
    if(y>=minHeight)
    {
      if(ImgA->Picture->Bitmap->Height>minHeight)
      {
        pa = (byte *) ImgA->Picture->Bitmap->ScanLine[y];
      }
      else
      {
        pa = (byte *) ImgB->Picture->Bitmap->ScanLine[y];
      }
      for (x = 0; x < maxWidth; x++)
      {
        if(x>=minWidth)
        {
          if((ImgA->Picture->Bitmap->Width>minWidth&&ImgA->Picture->Bitmap->Height>minHeight)||
          (ImgB->Picture->Bitmap->Width>minWidth&&ImgB->Picture->Bitmap->Height>minHeight))
          matrix[y][x]=pa[x];
          else matrix[y][x]=0;
        }
        else
        matrix[y][x]=pa[x];
      }

    }
    else
    {
      pa = (byte *) ImgA->Picture->Bitmap->ScanLine[y];
      pb = (byte *) ImgB->Picture->Bitmap->ScanLine[y];
      //Scan the image horizontally
      for (x = 0; x < maxWidth; x++)
      {
        if(x>minWidth)
        {
          if(ImgA->Picture->Bitmap->Width>minWidth)
          matrix[y][x]=pa[x];
          else
          matrix[y][x]=pb[x];
        }
        else
        {
          auxvalue = pa[x]-pb[x];
          if(auxvalue>255)matrix[y][x]=255;
          else if(auxvalue<0)matrix[y][x]=0;
          else matrix[y][x]=pa[x]-pb[x];
        }
      }
    }
  }

  //Create a new image at the resulting image
  DeleteObject(Result->Picture->Bitmap->ReleaseHandle());
  Result->Picture->Bitmap = new Graphics::TBitmap();
  Result->Picture->Bitmap->SetSize(maxWidth,maxHeight);
  Result->Picture->Bitmap->PixelFormat=pf8bit;

  //Creates a new pallete for a grayscale image
  LOGPALETTE *newpal = (LOGPALETTE*) malloc(sizeof(LOGPALETTE) +255 * sizeof(PALETTEENTRY) );
  newpal->palVersion = 0x0300;
  newpal->palNumEntries = 256;

  for (i=0; i<256; i++)
  {
    newpal->palPalEntry[i].peRed   = i;
    newpal->palPalEntry[i].peGreen = i;
    newpal->palPalEntry[i].peBlue  = i;
    newpal->palPalEntry[i].peFlags = 0;
  }

  // Replace the existing pallete by the new one
  DeleteObject(Result->Picture->Bitmap->ReleasePalette());
  Result->Picture->Bitmap->Palette = CreatePalette(newpal);
  free(newpal);

  Result->Picture->Bitmap->SetSize(maxWidth,maxHeight);

  //Create the new image
  for (y = 0; y < maxHeight; y++)
  {
    pc = (byte *) Result->Picture->Bitmap->ScanLine[y];
    //Scan the image horizontally
    for (x = 0; x < maxWidth; x++)
    {
      pc[x] = matrix[y][x];
    }
  }
  Result->Refresh();
}

void averageImages(TImage *ImgA, TImage *ImgB, TImage *Result)
{
  int maxWidth, minWidth;
  int maxHeight, minHeight;
  int y,x,i;
  Byte *pa, *pb, *pc;
  Byte **matrix;


  if(ImgA->Picture->Bitmap->Width>ImgB->Picture->Bitmap->Width)
  {
    maxWidth=ImgA->Picture->Bitmap->Width;
    minWidth=ImgB->Picture->Bitmap->Width;
  }
  else
  {
    maxWidth=ImgB->Picture->Bitmap->Width;
    minWidth=ImgA->Picture->Bitmap->Width;
  }

  if(ImgA->Picture->Bitmap->Height>ImgB->Picture->Bitmap->Height)
  {
    maxHeight=ImgA->Picture->Bitmap->Height;
    minHeight=ImgB->Picture->Bitmap->Height;
  }
  else
  {
    maxHeight=ImgB->Picture->Bitmap->Height;
    minHeight=ImgA->Picture->Bitmap->Height;
  }

  //Declare a vector to hold the values for the new image
  matrix = (Byte **) calloc (maxHeight,sizeof(Byte *));
  for(y = 0; y < maxHeight; y++)
    matrix[y] = (Byte *) calloc (maxWidth,sizeof(Byte));

  //Fill output image with the new results
  for (y = 0; y < maxHeight; y++)
  {
    if(y>=minHeight)
    {
      if(ImgA->Picture->Bitmap->Height>minHeight)
      {
        pa = (byte *) ImgA->Picture->Bitmap->ScanLine[y];
      }
      else
      {
        pa = (byte *) ImgB->Picture->Bitmap->ScanLine[y];
      }
      for (x = 0; x < maxWidth; x++)
      {
        if(x>=minWidth)
        {
          if((ImgA->Picture->Bitmap->Width>minWidth&&ImgA->Picture->Bitmap->Height>minHeight)||
          (ImgB->Picture->Bitmap->Width>minWidth&&ImgB->Picture->Bitmap->Height>minHeight))
          matrix[y][x]=pa[x];
          else matrix[y][x]=0;
        }
        else
        matrix[y][x]=pa[x];
      }

    }
    else
    {
      pa = (byte *) ImgA->Picture->Bitmap->ScanLine[y];
      pb = (byte *) ImgB->Picture->Bitmap->ScanLine[y];
      //Scan the image horizontally
      for (x = 0; x < maxWidth; x++)
      {
        if(x>minWidth)
        {
          if(ImgA->Picture->Bitmap->Width>minWidth)
          matrix[y][x]=pa[x];
          else
          matrix[y][x]=pb[x];
        }
        else
        matrix[y][x]=(int)(pa[x]+pb[x])/2;
      }
    }
  }

  //Create a new image at the resulting image
  DeleteObject(Result->Picture->Bitmap->ReleaseHandle());
  Result->Picture->Bitmap = new Graphics::TBitmap();
  Result->Picture->Bitmap->SetSize(maxWidth,maxHeight);
  Result->Picture->Bitmap->PixelFormat=pf8bit;

  //Creates a new pallete for a grayscale image
  LOGPALETTE *newpal = (LOGPALETTE*) malloc(sizeof(LOGPALETTE) +255 * sizeof(PALETTEENTRY) );
  newpal->palVersion = 0x0300;
  newpal->palNumEntries = 256;

  for (i=0; i<256; i++)
  {
    newpal->palPalEntry[i].peRed   = i;
    newpal->palPalEntry[i].peGreen = i;
    newpal->palPalEntry[i].peBlue  = i;
    newpal->palPalEntry[i].peFlags = 0;
  }

  // Replace the existing pallete by the new one
  DeleteObject(Result->Picture->Bitmap->ReleasePalette());
  Result->Picture->Bitmap->Palette = CreatePalette(newpal);
  free(newpal);

  Result->Picture->Bitmap->SetSize(maxWidth,maxHeight);

  //Create the new image
  for (y = 0; y < maxHeight; y++)
  {
    pc = (byte *) Result->Picture->Bitmap->ScanLine[y];
    //Scan the image horizontally
    for (x = 0; x < maxWidth; x++)
    {
      pc[x] = matrix[y][x];
    }
  }
  Result->Refresh();
}

void oldPicture(TImage *image)
{
  int x,y,i;
  Byte *p, grayLevel;
  int auxvalue;
  for(y=0;y<image->Picture->Bitmap->Height; y++)
  {
    p =  (byte *) image->Picture->Bitmap->ScanLine[y];
    for(x=0;x<image->Picture->Bitmap->Width*3-1;x+=3)
    {
      //p[x] - Blue value (RGB)
      //p[x+1] - Green value (RGB)
      //p[x+2] - Red value (RGB)
      // Replace every value for the correspondent gray value (R*0.3+G0.59+B*0.3)
      p[x]=p[x+1]=p[x+2]= p[x]*0.11+p[x+1]*0.59+p[x+2]*0.3;
      auxvalue=p[x]-50;
      if(auxvalue<0)p[x]=0;
      else p[x]=auxvalue;
    }
  }
  stretchHistogram(image);
  image->Picture->Bitmap->PixelFormat=pf24bit;
}

void linearTransformation(TImage *image, Byte **auximage, float a,  int b)
{
   int x, y;
   Byte *p;
   int newValue;
   int hValues; //Number of values the image have in each line (3 x width for colour images)
   if(image->Picture->Bitmap->PixelFormat==pf24bit)
    hValues = 3*image->Picture->Bitmap->Width;
   else
    hValues = image->Picture->Bitmap->Width;

   if(auximage!=NULL)
    for (y = 0; y < image->Picture->Bitmap->Height; y++)
    {
        p = (byte *) image->Picture->Bitmap->ScanLine[y];
        for (x = 0; x < hValues; x++)
        {
           newValue =auximage[y][x]*a + b;
           if(newValue>255)p[x]=255;
           else if(newValue<0)p[x]=0;
           else p[x]=newValue;
        }
    }
   else
   for (y = 0; y < image->Picture->Bitmap->Height; y++)
    {
        p = (byte *) image->Picture->Bitmap->ScanLine[y];
        for (x = 0; x < hValues; x++)
        {
           newValue =p[x]*a + b;
           if(newValue>255)p[x]=255;
           else if(newValue<0)p[x]=0;
           else p[x]=newValue;
        }
    }
    image->Refresh();
}
