//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
#include <Vcl.Styles.hpp>
#include <Vcl.Themes.hpp>
USEFORM("uDataMod.cpp", DM); /* TDataModule: File Type */
USEFORM("uMainForm.cpp", MainForm);
USEFORM("uLeads.cpp", LeadsForm);
USEFORM("uDraftProposal.cpp", DraftProposalForm);
USEFORM("uProposal.cpp", ProposalForm);
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		TStyleManager::TrySetStyle("Windows10 Blue");
		Application->CreateForm(__classid(TDM), &DM);
		Application->CreateForm(__classid(TMainForm), &MainForm);
		Application->CreateForm(__classid(TDraftProposalForm), &DraftProposalForm);
		Application->CreateForm(__classid(TProposalForm), &ProposalForm);
		Application->CreateForm(__classid(TLeadsForm), &LeadsForm);
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
