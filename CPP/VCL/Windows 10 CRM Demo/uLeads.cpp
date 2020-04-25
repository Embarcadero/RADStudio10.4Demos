//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "uLeads.h"
#include "uMainForm.h"
#include "uDataMod.h"
#include "uProposal.h"
#include "uDraftProposal.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TLeadsForm *LeadsForm;
//---------------------------------------------------------------------------
__fastcall TLeadsForm::TLeadsForm(TComponent* Owner)
	: TForm(Owner)
{
}

void __fastcall TLeadsForm::LocateLead( int AIndex )
{
  LeadsBindSourceDB->DataSet->Locate( L"LeadId", VarArrayOf( OPENARRAY(Variant, ( AIndex )) ), TLocateOptions() );
}


void __fastcall TLeadsForm::DateContactedPickerChange( TObject* Sender )
{
  if ( (double)((TDateTimePicker*)( Sender ))->DateTime == 0.0 ) {
	((TDateTimePicker*)( Sender ))->Format = L" ";
  } else {
	((TDateTimePicker*)( Sender ))->Format = L"";
  }
}


void __fastcall TLeadsForm::DeleteDocButtonClick( TObject* Sender )
{
  if ( DocsBindSourceDB->DataSet->RecordCount > 0 )
  {
	if ( MessageDlg( "Delete " + DocsBindSourceDB->DataSet->FieldByName( L"DocumentName" )->AsString + "?", mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0, mbYes ) == mrYes )
    {
	  DocsBindSourceDB->DataSet->Delete();
    }
  }
}


void __fastcall TLeadsForm::DetailRelativePanelResize( TObject* Sender )
{
  if ( DetailRelativePanel->Width < 936 )
  {
    DetailRelativePanel->ControlCollection->Items[1]->Below = FormPanel;
    DetailRelativePanel->ControlCollection->Items[1]->AlignRightWithPanel = false;
    DetailRelativePanel->ControlCollection->Items[1]->AlignTopWithPanel = false;
    DetailRelativePanel->ControlCollection->Items[1]->AlignLeftWithPanel = true;
  }
  else
  {
    DetailRelativePanel->ControlCollection->Items[1]->Below = NULL;
    DetailRelativePanel->ControlCollection->Items[1]->AlignLeftWithPanel = false;
    DetailRelativePanel->ControlCollection->Items[1]->AlignRightWithPanel = true;
    DetailRelativePanel->ControlCollection->Items[1]->AlignTopWithPanel = true;
  }
}

void __fastcall TLeadsForm::LeadRelativePanelResize( TObject* Sender )
{
  if ( LeadRelativePanel->Width <= 800 )
  {
    CreateProposalButton->Caption = L"";
    CreateProposalButton->Width = 40;
    ViewProposalButton->Caption = L"";
    ViewProposalButton->Width = 40;
    CancelProposalButton->Caption = L"";
    CancelProposalButton->Width = 40;
    CompleteProposalButton->Caption = L"";
    CompleteProposalButton->Width = 40;
  }
  else
  {
    CreateProposalButton->Caption = CreateProposalButton->Hint;
    CreateProposalButton->Width = 185;
    ViewProposalButton->Caption = ViewProposalButton->Hint;
    ViewProposalButton->Width = 185;
    CancelProposalButton->Caption = CancelProposalButton->Hint;
    CancelProposalButton->Width = 185;
    CompleteProposalButton->Caption = CompleteProposalButton->Hint;
    CompleteProposalButton->Width = 185;
  }
}


void __fastcall TLeadsForm::LinkControlToField10AssignedValue( TObject* Sender, TBindingAssignValueRec &AssignValueRec,
		  const TValue &Value )
{
  DateContactedPickerChange( DateContactedPicker );
}


void __fastcall TLeadsForm::LinkControlToField6AssignedValue( TObject* Sender, TBindingAssignValueRec &AssignValueRec,
		  const TValue &Value )
{
  DateContactedPickerChange( DateCreatedPicker );
}


void __fastcall TLeadsForm::LinkControlToField8AssignedValue( TObject* Sender, TBindingAssignValueRec &AssignValueRec,
		  const TValue &Value )
{
  DateContactedPickerChange( DateDraftedPicker );
}


void __fastcall TLeadsForm::LinkControlToField9AssignedValue( TObject* Sender, TBindingAssignValueRec &AssignValueRec,
		  const TValue &Value )
{
  DateContactedPickerChange( DateClosedPicker );
}


void __fastcall TLeadsForm::AddDocButtonClick( TObject* Sender )
{
  if ( OpenDialog1->Execute() )
  {
	DocsBindSourceDB->DataSet->Append();
	DocsBindSourceDB->DataSet->Edit();
    DocsBindSourceDB->DataSet->FieldByName( L"LeadId" )->AsInteger = LeadsBindSourceDB->DataSet->FieldByName( L"LeadId" )->AsInteger;
    DocsBindSourceDB->DataSet->FieldByName( L"DocumentName" )->AsString = ExtractFileName( OpenDialog1->FileName );
	((TBlobField*)( DocsBindSourceDB->DataSet->FieldByName( L"Document" ) ))->LoadFromFile( OpenDialog1->FileName );
    DocsBindSourceDB->DataSet->FieldByName( L"User" )->AsString = UsersBindSourceDB->DataSet->FieldByName( L"Username" )->AsString;
	DocsBindSourceDB->DataSet->Post();
  }
}


void __fastcall TLeadsForm::CancelProposalButtonClick( TObject* Sender )
{
  DM->UpdateProposalStatus( LeadsBindSourceDB->DataSet->FieldByName( L"LeadId" )->AsInteger, L"Canceled" );
}


void __fastcall TLeadsForm::CompleteProposalButtonClick( TObject* Sender )
{
  DM->CompleteProposal( LeadsBindSourceDB->DataSet->FieldByName( L"LeadId" )->AsInteger );
}


void __fastcall TLeadsForm::CreateProposalButtonClick( TObject* Sender )
{
  if ( ! ProposalBindSourceDB->DataSet->Locate( L"LeadId", VarArrayOf( OPENARRAY(Variant, ( LeadsBindSourceDB->DataSet->FieldByName( L"LeadId" )->AsInteger )) ), TLocateOptions() ) )
  {
    DraftProposalForm->NewDraft( LeadsBindSourceDB->DataSet->FieldByName( L"LeadId" )->AsInteger, LeadsBindSourceDB->DataSet->FieldByName( L"AccountName" )->AsString );
	DraftProposalForm->ShowModal();
  }
  else
  {
	ShowMessage( "This lead already has a proposal." );
  }
}


void __fastcall TLeadsForm::ViewDocButtonClick( TObject* Sender )
{
  TMemoryStream *LDocStream;
  String LTempDocument;
  LDocStream = new TStringStream();
  try
  {
    if ( DocsBindSourceDB->DataSet->RecordCount > 0 )
    {
      if ( DocsBindSourceDB->DataSet->FieldByName( L"Document" ) != NULL )
      {
		((TBlobField*)( DocsBindSourceDB->DataSet->FieldByName( L"Document" ) ))->SaveToStream( LDocStream );
		LTempDocument = TPath::Combine( TPath::GetTempPath(), DocsBindSourceDB->DataSet->FieldByName( L"DocumentName" )->AsString );
        LDocStream->SaveToFile( LTempDocument );
      }
    }
  }
  __finally
  {
	delete LDocStream;
  }
  if ( !LTempDocument.IsEmpty())
	ShellExecute( Handle, NULL, LTempDocument.c_str(), NULL, NULL, SW_SHOWNORMAL );
  else
	ShowMessage( "No document selected." );
}


void __fastcall TLeadsForm::ViewProposalButtonClick( TObject* Sender )
{
  TStringStream *LReportStream;
  String LReportString;
  int LCurrentLeadId = 0;
  LCurrentLeadId = LeadsBindSourceDB->DataSet->FieldByName( L"LeadId" )->AsInteger;
  LReportStream = new TStringStream();
  try
  {
	if ( ProposalBindSourceDB->DataSet->Locate( L"LeadId", VarArrayOf( OPENARRAY(Variant, ( LCurrentLeadId ))), TLocateOptions() ) )
	{
      if ( ProposalBindSourceDB->DataSet->FieldByName( L"Proposal" ) != NULL )
	  {
		((TBlobField*)( ProposalBindSourceDB->DataSet->FieldByName( L"Proposal" ) ))->SaveToStream( LReportStream );
        LReportString = LReportStream->DataString;
      }
    }
  }
  __finally
  {
	delete LReportStream;
  }
  if ( !LReportString.IsEmpty())
  {
    ProposalForm->LoadProposal( LCurrentLeadId, LReportString );
	ProposalForm->ShowModal();
  }
}

//---------------------------------------------------------------------------

