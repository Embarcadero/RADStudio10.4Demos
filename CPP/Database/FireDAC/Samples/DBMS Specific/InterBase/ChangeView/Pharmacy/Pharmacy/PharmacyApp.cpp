//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("formPharmacy.cpp", frmPharmacy);
USEFORM("dmDeltas.cpp", dtmdlDelta); /* TDataModule: File Type */
USEFORM("dmLocalData.cpp", dtmdLocalDB); /* TDataModule: File Type */
USEFORM("formPharmacyController.cpp", dmPharmacyController); /* TDataModule: File Type */
USEFORM("frameData.cpp", Frame1); /* TFrame: File Type */
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		Application->CreateForm(__classid(TfrmPharmacy), &frmPharmacy);
		Application->CreateForm(__classid(TdmPharmacyController), &dmPharmacyController);
		Application->Run();
	}
	catch (Exception &exception)
	{
		Application->ShowException(&exception);
	}
	catch (...)
	{
		try
		{
			throw Exception("");
		}
		catch (Exception &exception)
		{
			Application->ShowException(&exception);
		}
	}
	return 0;
}
//---------------------------------------------------------------------------
