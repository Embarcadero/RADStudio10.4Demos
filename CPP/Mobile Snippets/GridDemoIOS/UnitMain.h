//---------------------------------------------------------------------------

#ifndef UnitMainH
#define UnitMainH
//---------------------------------------------------------------------------
#include <Data.Bind.Components.hpp>
#include <Data.Bind.Controls.hpp>
#include <Data.Bind.DBScope.hpp>
#include <Data.Bind.EngExt.hpp>
#include <Data.Bind.Grid.hpp>
#include <Data.DB.hpp>
#include <FireDAC.Comp.Client.hpp>
#include <FireDAC.Comp.DataSet.hpp>
#include <FireDAC.DApt.Intf.hpp>
#include <FireDAC.DatS.hpp>
#include <FireDAC.Phys.Intf.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Param.hpp>
#include <FMX.ActnList.hpp>
#include <Fmx.Bind.DBEngExt.hpp>
#include <Fmx.Bind.Editors.hpp>
#include <Fmx.Bind.Grid.hpp>
#include <Fmx.Bind.Navigator.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Controls.Presentation.hpp>
#include <FMX.Grid.hpp>
#include <FMX.Grid.Style.hpp>
#include <FMX.ImgList.hpp>
#include <FMX.Layouts.hpp>
#include <FMX.Memo.hpp>
#include <FMX.ScrollBox.hpp>
#include <FMX.StdCtrls.hpp>
#include <FMX.TabControl.hpp>
#include <FMX.TreeView.hpp>
#include <FMX.Types.hpp>
#include <System.Actions.hpp>
#include <System.Bindings.Outputs.hpp>
#include <System.Classes.hpp>
#include <System.ImageList.hpp>
#include <System.Rtti.hpp>
#include <System.SysUtils.hpp>
#include <System.Actions.hpp>
#include <System.Rtti.hpp>
#include <System.Types.hpp>
#include <System.RTLConsts.hpp>
#include <System.ImageList.hpp>
#include <System.TypInfo.hpp>
#include <System.UITypes.hpp>
#include <System.Classes.hpp>
#include <System.Variants.hpp>
#include <FMX.ListView.Adapters.Base.hpp>
#include <FMX.ListView.Appearances.hpp>
#include <FMX.ListView.hpp>
#include <FMX.ListView.Types.hpp>
#include <math.h>
#include <algorithm>
#include <vector>
#include <FMX.Types.hpp>
#include <FMX.Consts.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <FMX.Graphics.hpp>
#include <FMX.Dialogs.hpp>
#include <FMX.Grid.Style.hpp>
#include <FMX.ActnList.hpp>
#include <FMX.Controls.Presentation.hpp>
#include <FMX.ScrollBox.hpp>
#include <FMX.Grid.hpp>
#include <FMX.TabControl.hpp>
#include <FMX.Layouts.hpp>
#include <FMX.ImgList.hpp>
#include <FMX.StdCtrls.hpp>
#include <FMX.TreeView.hpp>
#include <FMX.Effects.hpp>
#include <FMX.StdActns.hpp>
#include <Data.Bind.Controls.hpp>
#include <FMX.Bind.Navigator.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Param.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.DatS.hpp>
#include <FireDAC.Phys.Intf.hpp>
#include <FireDAC.DApt.Intf.hpp>
#include <Data.Bind.EngExt.hpp>
#include <FMX.Bind.DBEngExt.hpp>
#include <FMX.Bind.Grid.hpp>
#include <System.Bindings.Outputs.hpp>
#include <FMX.Bind.Editors.hpp>
#include <Data.Bind.Components.hpp>
#include <Data.Bind.Grid.hpp>
#include <Data.Bind.DBScope.hpp>
#include <Data.DB.hpp>
#include <FireDAC.Comp.DataSet.hpp>
#include <FireDAC.Comp.Client.hpp>
#include <FMX.Memo.hpp>
#include <FMX.Objects.hpp>
#include <FMX.DateTimeCtrls.hpp>
#include <FMX.ListView.Adapters.Base.hpp>
#include <FMX.ListView.Appearances.hpp>
#include <FMX.ListView.hpp>
#include <FMX.ListView.Types.hpp>
//---------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:	// IDE-managed Components
	TToolBar *ToolBar1;
	TSpeedButton *LogButton;
	TSpeedButton *OptionsButton;
	TLabel *CaptionLabel;
	TPanel *Panel1;
	TTabControl *TabControl1;
	TTabItem *TabItem1;
	TStringGrid *StringGrid1;
	TCurrencyColumn *CurrencyColumn1;
	TGlyphColumn *GlyphColumn1;
	TStringColumn *StringColumn1;
	TColumn *Column1;
	TProgressColumn *ProgressColumn1;
	TCheckColumn *CheckColumn1;
	TDateColumn *DateColumn1;
	TTimeColumn *TimeColumn1;
	TPopupColumn *PopupColumn1;
	TTabItem *TabItem2;
	TGrid *Grid1;
	TTabItem *TabItem3;
	TGrid *Grid2;
	TBindNavigator *BindNavigator1;
	TLayout *LayoutEventLog;
	TLabel *Label1;
	TMemo *Memo1;
	TLayout *Layout1;
	TSpeedButton *SpeedButton2;
	TSplitter *Splitter1;
	TLayout *LayoutOptions;
	TListView *ListView1;
	TActionList *ActionList1;
	TControlAction *ActnEventLog;
	TControlAction *ActnClearEventLog;
	TAction *ActnListView;
	TImageList *ImageList1;
	TFDMemTable *FDMemTable1;
	TIntegerField *FDMemTable1Index;
	TIntegerField *FDMemTable1ImageIndex;
	TStringField *FDMemTable1String;
	TStringField *FDMemTable1Column;
	TCurrencyField *FDMemTable1Currency;
	TBooleanField *FDMemTable1CheckBox;
	TDateField *FDMemTable1Date;
	TTimeField *FDMemTable1Time;
	TBindSourceDB *BindSourceDB1;
	TBindingsList *BindingsList1;
	TLinkGridToDataSource *LinkGridToDataSourceBindSourceDB1;
	void __fastcall ActnEventLogExecute(TObject *Sender);
	void __fastcall ActnEventLogUpdate(TObject *Sender);
	void __fastcall ActnClearEventLogExecute(TObject *Sender);
	void __fastcall ActnClearEventLogUpdate(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall ListView1Change(TObject *Sender);
	void __fastcall LayoutEventLogResize(TObject *Sender);
	void __fastcall ListView1ItemClick(TObject * const Sender, TListViewItem * const AItem);
	void __fastcall ActionList1Update(TBasicAction *Action, bool &Handled);
	void __fastcall Grid1GetValue(TObject *Sender, const int ACol, const int ARow, TValue &Value);
	void __fastcall Grid1SetValue(TObject *Sender, const int ACol, const int ARow, const TValue &Value);
	void __fastcall ActnListViewUpdate(TObject *Sender);
	void __fastcall ActnListViewExecute(TObject *Sender);
	void __fastcall FormResize(TObject *Sender);
	void __fastcall ColumnMovedProc(TColumn *Column, int FromIndex, int ToIndex);
	void __fastcall EditingDoneProc(TObject *Sender, const int ACol, const int ARow);
	void __fastcall HeaderClickProc(TColumn *Column);
	void __fastcall ResizeProc(TObject *Sender);
	void __fastcall SelChangedProc(TObject *Sender);
	void __fastcall SelectCellProc(TObject *Sender, const int ACol, const int ARow, bool &CanSelect);
    void __fastcall TapProc(TObject *Sender, const TPointF &Point);

private:	// User declarations
	TListViewItem* FItemControlType;
	TListViewItem* FItemDefaultDrawing;
	DynamicArray<TListViewItem*> FItemOption;
	DynamicArray<TListViewItem*> FItemReturnAction;
	TListViewItem* FItemWidth;
	float FStoredWidth;
	TListViewItem* FItemVisible;
	TListViewItem* FItemReadonly;
	TListViewItem* FItemEnabled;
	int FBoolImageIndex[2 /* # Boolean */];
	bool FListViewUpdating;
	DynamicArray<TBitmap*> FBitmaps;
	DynamicArray<String> FStrings;
	DynamicArray<String> FPopups;
	DynamicArray<TDateTime> FDates;
	DynamicArray<TDateTime> FTimes;
	void __fastcall UpdateListView();
	void __fastcall UpdateWidthValue();
	void __fastcall PropogateOptions();
	void __fastcall MemoAddLine(const String EventName, const String Text);
	void __fastcall InitStringValue(const int ColumnIndex, int& RowIndex,
		const String Caption, const String Value);
	void __fastcall InternalPropagate(TGrid* Grid);
	void __fastcall UpdateViewItem(TListViewItem* Item,
		const PTypeInfo AType, const int AValue, const bool AChecked);
	void __fastcall UpdateViewItemBool(TListViewItem* Item,
		const bool AChecked);
	void __fastcall UpdateListViewOptionsProc();
	void __fastcall AddItemActions();
	void __fastcall AddItemReturnActions();
	void __fastcall AddItemGrid();
	void __fastcall StringGridInit();
	void __fastcall GridUpdate();
	void __fastcall MemTableUpdate();
    void __fastcall CreateBitmap();
public:		// User declarations
	__fastcall TMainForm(TComponent* Owner);
};

const wchar_t UnitMain_StrHideEventLog[] = L"Hide event log";
const wchar_t UnitMain_StrShowEventLog[] = L"Show event log";
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------

#endif
