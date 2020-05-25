//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef formPharmacyH
#define formPharmacyH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "frameData.h"
#include <Data.Bind.Components.hpp>
#include <Data.Bind.Controls.hpp>
#include <Data.Bind.DBScope.hpp>
#include <Data.Bind.EngExt.hpp>
#include <Data.DB.hpp>
#include <SHDocVw.hpp>
#include <System.Bindings.Outputs.hpp>
#include <System.Rtti.hpp>
#include <Vcl.Bind.DBEngExt.hpp>
#include <Vcl.Bind.Editors.hpp>
#include <Vcl.Bind.Navigator.hpp>
#include <Vcl.Buttons.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.Imaging.pngimage.hpp>
#include <Vcl.OleCtrls.hpp>
#include <Vcl.Samples.Spin.hpp>
#include "dmLocalData.h"
//---------------------------------------------------------------------------
class TfrmPharmacy : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TPanel *Panel2;
	TLabeledEdit *edtCentralServer;
	TLabeledEdit *edtSite;
	TPageControl *PageControl1;
	TTabSheet *TabSheet1;
	TSplitter *Splitter1;
	TListView *lvCategory;
	TListView *lvMedicine;
	TPageControl *PageControl2;
	TTabSheet *TabSheet4;
	TSplitter *Splitter2;
	TGroupBox *GroupBox1;
	TMemo *MemoPATIENT_ADVICE;
	TGroupBox *GroupBox2;
	TMemo *MemoSPECIAL_WARNINGS;
	TTabSheet *TabSheet5;
	TLabel *lblURL;
	TWebBrowser *WebBrowser1;
	TButton *btnWebdetailsLoad;
	TTabSheet *TabSheet2;
	TListView *lvCustomers;
	TPanel *Panel4;
	TSplitter *Splitter3;
	TGroupBox *gbCustomer;
	TLabel *Label1;
	TLabeledEdit *LabeledEditCUSTOMER_NAME;
	TMemo *MemoCUSTOMER_ADDRESS;
	TBindNavigator *NavigatorBindSourceDB3;
	TGroupBox *GroupBox3;
	TPanel *Panel5;
	TLabel *Label2;
	TButton *btnAddOrder;
	TSpinEdit *seQuantity;
	TBindNavigator *BindNavigator1;
	TDBGrid *gridOrders;
	TTabSheet *TabSheet3;
	TPageControl *PageControl3;
	TTabSheet *TabSheet7;
	TFrame1 *FrameCategory;
	TTabSheet *TabSheet6;
	TFrame1 *FrameMedicine;
	TTabSheet *TabSheet8;
	TFrame1 *FrameLinks;
	TPanel *Panel3;
	TButton *btnFetchDeltas;
	TButton *btnPostDeltas;
	TCheckBox *cbShowMerged;
	TPanel *Panel6;
	TLabel *Label3;
	TLabel *Label4;
	TLabel *Label5;
	TLabel *Label6;
	TBindSourceDB *bsCategory;
	TBindingsList *BindingsList1;
	TLinkListControlToField *LinkListControlToField2;
	TLinkListControlToField *LinkListControlToField1;
	TLinkControlToField *LinkControlToFieldPATIENT_ADVICE;
	TLinkControlToField *LinkControlToFieldSPECIAL_WARNINGS;
	TLinkListControlToField *LinkListControlToField3;
	TLinkControlToField *LinkControlToFieldCUSTOMER_ADDRESS;
	TLinkControlToField *LinkControlToFieldCUSTOMER_NAME;
	TLinkControlToField *LinkControlToField1;
	TLinkPropertyToField *LinkPropertyToFieldCaption;
	TBindSourceDB *bsMedicines;
	TBindSourceDB *bsCustomer;
	TBindSourceDB *bsOrder;
	TBindSourceDB *bsPharmacy;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormDestroy(TObject *Sender);
private:	// User declarations
	TComponent * Controller;
	TdtmdLocalDB * dtmdLocalDB;
public:		// User declarations
	__fastcall TfrmPharmacy(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmPharmacy *frmPharmacy;
//---------------------------------------------------------------------------
#endif
