//---------------------------------------------------------------------------

#ifndef uMainFormH
#define uMainFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.Bind.Components.hpp>
#include <Data.Bind.Controls.hpp>
#include <Data.Bind.DBScope.hpp>
#include <Data.Bind.EngExt.hpp>
#include <Data.Bind.Grid.hpp>
#include <System.Bindings.Outputs.hpp>
#include <System.ImageList.hpp>
#include <System.Rtti.hpp>
#include <Vcl.BaseImageCollection.hpp>
#include <Vcl.Bind.DBEngExt.hpp>
#include <Vcl.Bind.Editors.hpp>
#include <Vcl.Bind.Grid.hpp>
#include <Vcl.Bind.Navigator.hpp>
#include <Vcl.Buttons.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.Dialogs.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.ImageCollection.hpp>
#include <Vcl.Imaging.pngimage.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.VirtualImage.hpp>
#include <Vcl.VirtualImageList.hpp>
#include <Vcl.WinXCalendars.hpp>
#include <Vcl.WinXCtrls.hpp>
#include <Vcl.TitleBarCtrls.hpp>
//---------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:	// IDE-managed Components
	TSplitView *SplitView;
	TPanel *pnlToolbar;
	TLabel *lblTitle;
	TVirtualImage *MenuVirtualImage;
	TPanel *NavPanel;
	TImage *Image5;
	TButton *DashboardButton;
	TButton *AcctsButton;
	TButton *LeadsButton;
	TButton *SalesButton;
	TButton *MarketingButton;
	TButton *CalendarButton;
	TButton *UsersButton;
	TPageControl *PageControl;
	TTabSheet *DashboardTab;
	TPanel *Panel5;
	TLabel *Label4;
	TVirtualImage *VirtualImage1;
	TFlowPanel *FlowPanel1;
	TRelativePanel *RelativePanel1;
	TLabel *Label5;
	TLabel *Label6;
	TLabel *Label7;
	TVirtualImage *VirtualImage9;
	TRelativePanel *RelativePanel2;
	TLabel *Label8;
	TLabel *Label9;
	TLabel *Label10;
	TVirtualImage *VirtualImage10;
	TRelativePanel *RelativePanel3;
	TLabel *Label11;
	TLabel *Label12;
	TLabel *Label13;
	TVirtualImage *VirtualImage11;
	TRelativePanel *RelativePanel4;
	TLabel *Label14;
	TLabel *Label15;
	TLabel *Label16;
	TVirtualImage *VirtualImage12;
	TRelativePanel *RelativePanel5;
	TLabel *Label17;
	TLabel *Label18;
	TLabel *Label19;
	TVirtualImage *VirtualImage13;
	TRelativePanel *RelativePanel6;
	TLabel *Label20;
	TLabel *Label21;
	TLabel *Label22;
	TVirtualImage *VirtualImage14;
	TTabSheet *AccountsTab;
	TPanel *Panel7;
	TLabel *Label24;
	TVirtualImage *VirtualImage2;
	TRelativePanel *AcctsRelativePanel;
	TSearchBox *AcctSearchBox;
	TSpeedButton *ExportAcctsButton;
	TSpeedButton *RemoveAcctButton;
	TSpeedButton *CreateAcctButton;
	TStringGrid *AccountsSG;
	TBindNavigator *BindNavigator4;
	TTabSheet *LeadsTab;
	TSplitter *Splitter1;
	TSplitter *Splitter2;
	TSplitter *Splitter3;
	TBindNavigator *BindNavigator1;
	TPanel *Panel2;
	TLabel *Label1;
	TVirtualImage *VirtualImage3;
	TRelativePanel *LeadsRelativePanel;
	TSpeedButton *CreateLeadButton;
	TSpeedButton *ExportLeadsButton;
	TSearchBox *LeadsSearchBox;
	TSpeedButton *ViewLeadButton;
	TPanel *NewLeadsPanel;
	TLabel *Label27;
	TStringGrid *NewLeadsSG;
	TPanel *ActiveLeadsPanel;
	TLabel *Label28;
	TStringGrid *ActiveLeadsSG;
	TPanel *ProposalSentPanel;
	TLabel *Label29;
	TStringGrid *ProposalSentLeadsSG;
	TPanel *ClosedPanel;
	TLabel *Label30;
	TStringGrid *ClosedLeadsSG;
	TTabSheet *SalesTab;
	TPanel *Panel6;
	TLabel *Label23;
	TVirtualImage *VirtualImage4;
	TRelativePanel *ProposalsRelativePanel;
	TSearchBox *SalesSearchBox;
	TSpeedButton *CancelProposalButton;
	TSpeedButton *CompleteProposalButton;
	TStringGrid *ProposalStringGrid;
	TBindNavigator *BindNavigator3;
	TTabSheet *MarketingTab;
	TPanel *Panel3;
	TLabel *Label2;
	TVirtualImage *VirtualImage5;
	TRelativePanel *MarketingRelativePanel;
	TSearchBox *EmailsSearchBox;
	TSpeedButton *ExportEmailsButton;
	TStringGrid *StringGrid2;
	TTabSheet *CalendarTab;
	TCalendarView *CalendarView1;
	TPanel *Panel4;
	TLabel *Label3;
	TVirtualImage *VirtualImage6;
	TTabSheet *UsersTab;
	TPanel *Panel8;
	TLabel *Label25;
	TVirtualImage *VirtualImage7;
	TRelativePanel *UsersRelativePanel;
	TSearchBox *SearchBox7;
	TSpeedButton *CreateUserButton;
	TSpeedButton *RemoveUserButton;
	TStringGrid *UsersSG;
	TBindNavigator *BindNavigator5;
	TTitleBarPanel *TitleBarPanel1;
	TComboBox *UsernameComboBox;
	TComboBox *VCLStylesCB;
	TBindSourceDB *LeadsBindNewSourceDB;
	TBindingsList *BindingsList1;
	TLinkGridToDataSource *LinkGridToDataSourceUsersBindSourceDB;
	TLinkGridToDataSource *LinkGridToDataSourceBindSourceDB5;
	TLinkListControlToField *LinkListControlToField1;
	TLinkGridToDataSource *LinkGridToDataSourceBindSourceDB4;
	TLinkGridToDataSource *LinkGridToDataSourceLeadsBindSourceDB;
	TLinkGridToDataSource *LinkGridToDataSourceLeadsBindActiveSourceDB;
	TLinkGridToDataSource *LinkGridToDataSourceLeadsBindClosedSourceDB;
	TLinkGridToDataSource *LinkGridToDataSourceAcctBindSourceDB;
	TLinkGridToDataSource *LinkGridToDataSourceLeadsBindProposalSentSourceDB;
	TLinkPropertyToField *LinkPropertyToFieldCaption;
	TLinkPropertyToField *LinkPropertyToFieldCaption2;
	TLinkPropertyToField *LinkPropertyToFieldCaption3;
	TLinkPropertyToField *LinkPropertyToFieldCaption4;
	TLinkPropertyToField *LinkPropertyToFieldCaption5;
	TLinkPropertyToField *LinkPropertyToFieldCaption6;
	TOpenDialog *ImportLeadsDialog;
	TSaveDialog *ExportLeadsDialog;
	TBindSourceDB *UsersBindSourceDB;
	TBindSourceDB *ProposalBindSourceDB;
	TBindSourceDB *AcctBindSourceDB;
	TBindSourceDB *EmailsBindSourceDB;
	TSaveDialog *SaveEmailsDialog;
	TBindSourceDB *LeadsBindActiveSourceDB;
	TBindSourceDB *LeadsBindSourceDB;
	TBindSourceDB *LeadsBindProposalSentSourceDB;
	TBindSourceDB *LeadsBindClosedSourceDB;
	TVirtualImageList *VirtualImageList1;
	TImageCollection *ImageCollection1;
	TSaveDialog *ExportAcctsDialog;
	TBindSourceDB *NewTotalBindSourceDB;
	TBindSourceDB *ActiveTotalBindSourceDB;
	TBindSourceDB *ProposalTotalBindSourceDB;
	TBindSourceDB *ClosedTotalBindSourceDB;
	TBindSourceDB *InactiveTotalBindSourceDB;
	TBindSourceDB *AllTotalBindSourceDB;
	void __fastcall RemoveAcctButtonClick(TObject *Sender);
	void __fastcall CreateAcctButtonClick(TObject *Sender);
	void __fastcall ExportAcctsButtonClick(TObject *Sender);
	void __fastcall ExportLeadsButtonClick(TObject *Sender);
	void __fastcall ViewLeadButtonClick(TObject *Sender);
	void __fastcall CreateLeadButtonClick(TObject *Sender);
	void __fastcall CancelProposalButtonClick(TObject *Sender);
	void __fastcall CompleteProposalButtonClick(TObject *Sender);
	void __fastcall ExportEmailsButtonClick(TObject *Sender);
	void __fastcall RemoveUserButtonClick(TObject *Sender);
	void __fastcall CreateUserButtonClick(TObject *Sender);
	void __fastcall AcctSearchBoxKeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall CalendarView1DrawDayItem(TObject *Sender, TDrawViewInfoParams *DrawParams,
		  TCellItemViewInfo *CalendarViewViewInfo);
	void __fastcall PageControlChange(TObject *Sender);
	void __fastcall SalesSearchBoxKeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall SplitViewClosing(TObject *Sender);
	void __fastcall SplitViewOpening(TObject *Sender);
	void __fastcall AccountsTabResize(TObject *Sender);
	void __fastcall UsersTabResize(TObject *Sender);
	void __fastcall UsernameComboBoxChange(TObject *Sender);
	void __fastcall UsernameComboBoxKeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall UsersRelativePanelResize(TObject *Sender);
	void __fastcall VCLStylesCBChange(TObject *Sender);
	void __fastcall VCLStylesCBKeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall MenuVirtualImageClick(TObject *Sender);
	void __fastcall AcctsRelativePanelResize(TObject *Sender);
	void __fastcall ProposalSentLeadsSGEnter(TObject *Sender);
	void __fastcall ActiveLeadsSGEnter(TObject *Sender);
	void __fastcall NewLeadsSGEnter(TObject *Sender);
	void __fastcall ClosedLeadsSGEnter(TObject *Sender);
	void __fastcall NewLeadsSGDragDrop(TObject *Sender, TObject *Source, int X, int Y);
	void __fastcall NewLeadsSGDragOver(TObject *Sender, TObject *Source, int X, int Y,
		  TDragState State, bool &Accept);
	void __fastcall NewLeadsSGDblClick(TObject *Sender);
	void __fastcall ProposalsRelativePanelResize(TObject *Sender);
	void __fastcall DashboardButtonClick(TObject *Sender);
	void __fastcall LeadsRelativePanelResize(TObject *Sender);
	void __fastcall LeadsSearchBoxKeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall MarketingRelativePanelResize(TObject *Sender);
	void __fastcall NewLeadsSGMouseDown(TObject *Sender, TMouseButton Button, TShiftState Shift,
          int X, int Y);
	void __fastcall EmailsSearchBoxKeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormResize(TObject *Sender);
	void __fastcall FormActivate(TObject *Sender);
private:	// User declarations
	bool FRanOnce;
	void __fastcall AppIdle( TObject* Sender, bool& Done );
	void __fastcall RefreshGrids( );
	void __fastcall UpdateNavButtons( );
public:		// User declarations
	__fastcall TMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
