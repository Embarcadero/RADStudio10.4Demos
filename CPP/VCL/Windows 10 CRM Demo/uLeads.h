//---------------------------------------------------------------------------

#ifndef uLeadsH
#define uLeadsH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.Bind.Components.hpp>
#include <Data.Bind.DBScope.hpp>
#include <Data.Bind.EngExt.hpp>
#include <Data.Bind.Grid.hpp>
#include <System.Bindings.Outputs.hpp>
#include <System.Rtti.hpp>
#include <Vcl.Bind.DBEngExt.hpp>
#include <Vcl.Bind.Editors.hpp>
#include <Vcl.Bind.Grid.hpp>
#include <Vcl.Buttons.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.Dialogs.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.WinXCtrls.hpp>
#include <Vcl.VirtualImage.hpp>
//---------------------------------------------------------------------------
class TLeadsForm : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel14;
	TScrollBox *ScrollBox1;
	TRelativePanel *DetailRelativePanel;
	TPanel *FormPanel;
	TPanel *DatesPanel;
	TPanel *DateContactedPanel;
	TLabel *Label9;
	TDateTimePicker *DateContactedPicker;
	TPanel *DateCreatedPanel;
	TLabel *Label8;
	TDateTimePicker *DateCreatedPicker;
	TPanel *DateDraftedPanel;
	TLabel *Label13;
	TDateTimePicker *DateDraftedPicker;
	TPanel *DateClosedPanel;
	TLabel *Label12;
	TDateTimePicker *DateClosedPicker;
	TPanel *UserPanel;
	TLabel *Label7;
	TEdit *UserEdit;
	TPanel *EmailPanel;
	TLabel *Label6;
	TEdit *EmailEdit;
	TButton *Button8;
	TPanel *OfficePhonePanel;
	TLabel *Label5;
	TEdit *OfficePhoneEdit;
	TButton *Button7;
	TPanel *AcctPanel;
	TLabel *Label4;
	TComboBox *AccountNameComboBox;
	TPanel *NamePanel;
	TLabel *Label3;
	TEdit *NameEdit;
	TPanel *StatusPanel;
	TLabel *Label2;
	TComboBox *StatusComboBox;
	TPanel *NotesPanel;
	TLabel *Label10;
	TMemo *NotesMemo;
	TPanel *LeadIdPanel;
	TLabel *Label14;
	TLabel *LeadIdLabel;
	TPanel *DocsPanel;
	TLabel *Label1;
	TPanel *Panel9;
	TButton *AddDocButton;
	TButton *ViewDocButton;
	TButton *DeleteDocButton;
	TStringGrid *DocStringGrid;
	TPanel *Panel13;
	TLabel *Label11;
	TRelativePanel *LeadRelativePanel;
	TSpeedButton *CreateProposalButton;
	TSpeedButton *ViewProposalButton;
	TSpeedButton *CancelProposalButton;
	TSpeedButton *CompleteProposalButton;
	TBindSourceDB *LeadsBindSourceDB;
	TBindingsList *BindingsList1;
	TLinkControlToField *LinkControlToField1;
	TLinkControlToField *LinkControlToField3;
	TLinkControlToField *LinkControlToField4;
	TLinkControlToField *LinkControlToField5;
	TLinkFillControlToField *LinkFillControlToField1;
	TLinkFillControlToField *LinkFillControlToField2;
	TLinkControlToField *LinkControlToField6;
	TLinkControlToField *LinkControlToField7;
	TLinkGridToDataSource *LinkGridToDataSourceBindSourceDB4;
	TLinkControlToField *LinkControlToField8;
	TLinkControlToField *LinkControlToField9;
	TLinkControlToField *LinkControlToField10;
	TLinkPropertyToField *LinkPropertyToFieldCaption;
	TBindSourceDB *StatusBindSourceDB;
	TOpenDialog *OpenDialog1;
	TBindSourceDB *AcctBindSourceDB;
	TBindSourceDB *DocsBindSourceDB;
	TBindSourceDB *UsersBindSourceDB;
	TBindSourceDB *ProposalBindSourceDB;
	TVirtualImage *VirtualImage3;
	void __fastcall AddDocButtonClick( TObject* Sender );
	void __fastcall DeleteDocButtonClick( TObject* Sender );
	void __fastcall CreateProposalButtonClick( TObject* Sender );
	void __fastcall ViewProposalButtonClick( TObject* Sender );
	void __fastcall DetailRelativePanelResize( TObject* Sender );
	void __fastcall LeadRelativePanelResize( TObject* Sender );
	void __fastcall DateContactedPickerChange( TObject* Sender );
	void __fastcall CompleteProposalButtonClick( TObject* Sender );
	void __fastcall CancelProposalButtonClick( TObject* Sender );
	void __fastcall ViewDocButtonClick( TObject* Sender );
	void __fastcall LinkControlToField6AssignedValue( TObject* Sender, TBindingAssignValueRec &AssignValueRec,
		  const TValue &Value );
	void __fastcall LinkControlToField10AssignedValue( TObject* Sender, TBindingAssignValueRec &AssignValueRec,
		  const TValue &Value );
	void __fastcall LinkControlToField8AssignedValue( TObject* Sender, TBindingAssignValueRec &AssignValueRec,
		  const TValue &Value );
	void __fastcall LinkControlToField9AssignedValue( TObject* Sender, TBindingAssignValueRec &AssignValueRec,
		  const TValue &Value );
private:	// User declarations
public:		// User declarations
    void __fastcall LocateLead( int AIndex );
	__fastcall TLeadsForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLeadsForm *LeadsForm;
//---------------------------------------------------------------------------
#endif
