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
USEFORM("frmLoginU.cpp", frmLogin);
USEFORM("frmUserInformationU.cpp", frmUserInformation);
USEFORM("frmVerboseU.cpp", frmVerbose);
USEFORM("frmAdminToolU.cpp", frmAdminTool);
USEFORM("frmAddCertificateU.cpp", frmAddCertificate);
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		Application->CreateForm(__classid(TfrmAdminTool), &frmAdminTool);
		Application->CreateForm(__classid(TfrmUserInformation), &frmUserInformation);
		Application->CreateForm(__classid(TfrmLogin), &frmLogin);
		Application->CreateForm(__classid(TfrmVerbose), &frmVerbose);
		Application->CreateForm(__classid(TfrmAddCertificate), &frmAddCertificate);
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
