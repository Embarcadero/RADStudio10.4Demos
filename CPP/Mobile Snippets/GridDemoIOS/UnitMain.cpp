// ---------------------------------------------------------------------------

#include <fmx.h>
#include <limits>

#pragma hdrstop

#include "UnitMain.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"

TMainForm *MainForm;

template<typename T>
struct EnumValue {
	T Value;
	const wchar_t *Text;
};

const EnumValue<TGridOption>GridOptionValues[] = {
	{TGridOption::AlternatingRowBackground, L"AlternatingRowBackground"},
	{TGridOption::Editing, L"Editing"},
	{TGridOption::AlwaysShowEditor, L"AlwaysShowEditor"},
	{TGridOption::ColumnResize, L"ColumnResize"},
	{TGridOption::ColumnMove, L"ColumnMove"}, {TGridOption::ColLines, L"ColLines"},
	{TGridOption::RowLines, L"RowLines"}, {TGridOption::RowSelect, L"RowSelect"},
	{TGridOption::AlwaysShowSelection, L"AlwaysShowSelection"},
	{TGridOption::Tabs, L"Tabs"}, {TGridOption::Header, L"Header"},
	{TGridOption::HeaderClick, L"HeaderClick"},
	{TGridOption::CancelEditingByDefault, L"CancelEditingByDefault"},
	{TGridOption::AutoDisplacement, L"AutoDisplacement"}};

const EnumValue<TCellReturnAction>CellReturnActionValues[] = {
	{TCellReturnAction::None, L"None"},
	{TCellReturnAction::GotoNextRow, L"GotoNextRow"},
	{TCellReturnAction::GotoNextColumn, L"GotoNextColumn"}};

// ---------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent* Owner) : TForm(Owner) {

}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::MemoAddLine(const String EventName,
	const String Text) {
	Memo1->Lines->Add(Format(L"%s(%s)", ARRAYOFCONST((EventName, Text))));
	Memo1->SelStart = Memo1->Text.Length() - 1;
	Memo1->SelLength = 0;
}
// --------------------------------------------------------------------------
void __fastcall TMainForm::SelChangedProc(TObject * Sender) {
	String S;
	if (TControl * Control = dynamic_cast<TControl*>(Sender)) {
		S = Control->Name;
	}
	if (TCustomGrid * grid = dynamic_cast<TCustomGrid*>(Sender)) {
		TVarRec LVarRec[3];
		LVarRec[0] = S;
		LVarRec[1] = grid->Col;
		LVarRec[2] = grid->Row;
		S = Format(L"[%s] %d; %d", LVarRec, 2);
	};
	MemoAddLine(L"OnSelChanged", S);
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::SelectCellProc(TObject * Sender, const int ACol,
	const int ARow, bool &CanSelect) {
	String S;
	if (TControl * Control = dynamic_cast<TControl*>(Sender)) {
		S = Control->Name;
	}
	TVarRec LVarRec[3];
	LVarRec[0] = S;
	LVarRec[1] = ACol;
	LVarRec[2] = ARow;
	S = Format(L"[%s] %d; %d", LVarRec, 2);

	if (ACol >= 0) {
		if (TCustomGrid * grid = dynamic_cast<TCustomGrid*>(Sender)) {
			if (TGlyphColumn * col =
				dynamic_cast<TGlyphColumn*>(grid->Columns[ACol])) {
				S += L" CanSelect = False";
				CanSelect = False;
			};
		}
	}
	MemoAddLine("OnSelectCell", S);
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::TapProc(TObject * Sender, const TPointF & Point) {
	String S;
	if (TControl *Control = dynamic_cast<TControl*>(Sender)) {
		S = Control->Name;
	}
	if (TCustomGrid * grid = dynamic_cast<TCustomGrid*>(Sender)) {
		TVarRec LVarRec[3];
		LVarRec[0] = S;
		LVarRec[1] = int(Point.X);
		LVarRec[2] = int(Point.Y);
		S = Format(L"[%s] %d; %d", LVarRec, 2);
		TPointF LocalPoint = grid->AbsoluteToLocal(Point);
		int Col, Row;
		if (grid->CellByPoint(LocalPoint.X, LocalPoint.Y, Col, Row)) {
			TVarRec LVarRec[2];
			LVarRec[0] = Col;
			LVarRec[1] = Row;
			S = S + Format(L" Col: %d; Row: %d", LVarRec, 1);
		}
		else {
			S = S + L" Col: ?; Row: ?";
		}
	}
	MemoAddLine(L"OnTap", S);
}
// --------------------------------------------------------------------------
void __fastcall TMainForm::ResizeProc(TObject * Sender) {
	String S;
	if (TControl * Control = dynamic_cast<TControl*>(Sender)) {
		S = Control->Name;
	}
	MemoAddLine(L"OnResize", S);
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::EditingDoneProc(TObject* Sender, const int ACol,
	const int ARow) {
	String S;
	if (TControl * Control = dynamic_cast<TControl*>(Sender)) {
		S = Control->Name;
	}
	TVarRec LVarRec[3];
	LVarRec[0] = S;
	LVarRec[1] = ACol;
	LVarRec[2] = ARow;
	S = Format(L"[%s] %d; %d", LVarRec, 2);
	MemoAddLine(L"OnEditingDone", S);
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::ColumnMovedProc(TColumn * Column, int FromIndex,
	int ToIndex) {
	String S;
	if (Column != NULL) {
		S = Column->Header;
		if (Column->PresentedControl) {
			S = L"[" + Column->PresentedControl->Name + L"] " + S;
		}
		else {
			S = "null";
		}
		TVarRec LVarRec[3];
		LVarRec[0] = S;
		LVarRec[1] = FromIndex;
		LVarRec[2] = ToIndex;
		S = Format(L"%s From: %d to %d", LVarRec, 2);
	}
	MemoAddLine(L"OnColumnMoved", S);
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::HeaderClickProc(TColumn * Column) {
	String S;
	if (Column != NULL) {
		S = Column->Header;
		if (Column->PresentedControl) {
			TVarRec LVarRec[2];
			LVarRec[0] = Column->PresentedControl->Name;
			LVarRec[1] = S;
			S = Format(L"[%s] %s", LVarRec, 2);
		}
	}
	else {
		S = "nil";
	}
	MemoAddLine(L"OnHeaderClick", S);
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::ActnEventLogExecute(TObject *Sender) {
	LayoutEventLog->Visible = !LayoutEventLog->Visible;
	Splitter1->Position->Y = TabControl1->Height;
	Splitter1->Visible = LayoutEventLog->Visible;
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::ActnEventLogUpdate(TObject *Sender) {
	if (TCustomAction *CustomAction = dynamic_cast<TCustomAction*>(Sender)) {
		if (LayoutEventLog->Visible)
			CustomAction->Hint = UnitMain_StrHideEventLog;
		else
			CustomAction->Hint = UnitMain_StrShowEventLog;
		CustomAction->Checked = LayoutEventLog->Visible;
	}
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::FormResize(TObject *Sender) {
	if (LayoutOptions->Visible) {
		LayoutOptions->Height = ::round(ClientHeight / 2.0);
		if (LayoutEventLog->Visible)
			LayoutEventLog->Height =
				::fmin(::round((ClientHeight - LayoutOptions->Height) / 2.0),
			LayoutEventLog->Height);
	}
	else if (LayoutEventLog->Visible)
		LayoutEventLog->Height = ::fmin(::round((2.0 / 3.0) * ClientHeight),
		LayoutEventLog->Height);


}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::ActnListViewExecute(TObject *Sender) {
	LayoutOptions->Height = ::round(ClientHeight / 2.0);
	LayoutOptions->Visible = !LayoutOptions->Visible;
	FormResize(NULL);
	if (ListView1->Visible) {
		ListView1->SetFocus();
		UpdateListView();
	}
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::ActnListViewUpdate(TObject *Sender) {
	if (TCustomAction *CustomAction = dynamic_cast<TCustomAction*>(Sender))
		CustomAction->Checked = LayoutOptions->Visible;
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::InitStringValue( const int ColumnIndex, int& RowIndex, const String Caption, const String Value )
{
  StringGrid1->Cells[2][RowIndex] = Caption;
  TVarRec LVarRec[1];
  LVarRec[0] = Value;
  StringGrid1->Cells[3][RowIndex] = Format(L"\'%s\'", LVarRec, 0);
  StringGrid1->Cells[ColumnIndex][RowIndex] = Value;
  RowIndex++;
}

// Init Section -------------------------------------------------------------
// --------------------------------------------------------------------------
void __fastcall TMainForm::AddItemActions() {
	TListViewItem* Item;
	Item = ListView1->Items->Add();
	Item->Purpose = TListItemPurpose::Header;
	Item->Text = L"TCustomGrid->Options";
	FItemOption.Length = (sizeof(GridOptionValues) / sizeof(GridOptionValues[0])) + 1;
	for (int I = 0;
	I < sizeof(GridOptionValues)/sizeof(GridOptionValues[0]); I++) {
		FItemOption[I] = ListView1->Items->Add();
		FItemOption[I]->Text = GetEnumName(__delphirtti(TGridOption), I);
	}
}
// --------------------------------------------------------------------------
void __fastcall TMainForm::AddItemReturnActions() {
	TListViewItem* Item;
    Item = ListView1->Items->Add();
	Item->Purpose = TListItemPurpose::Header;
	Item->Text = L"TGridModel->CellReturnAction";
	FItemReturnAction.Length = (sizeof(CellReturnActionValues)/sizeof(CellReturnActionValues[0])) + 1;
	for (int I = 0;
	I < sizeof(CellReturnActionValues)/sizeof(CellReturnActionValues[0]); I++) {
		FItemReturnAction[I] = ListView1->Items->Add();
		FItemReturnAction[I]->Text = GetEnumName(__delphirtti(TCellReturnAction), I);
	}
}
// --------------------------------------------------------------------------
void __fastcall TMainForm::AddItemGrid() {
	TListViewItem* Item;
	Item = ListView1->Items->Add();
	Item->Purpose = TListItemPurpose::Header;
	Item->Text = L"TGridModel";
	FItemControlType = ListView1->Items->Add();
	FItemControlType->Text = L"ControlType";
	FItemDefaultDrawing = ListView1->Items->Add();
	FItemDefaultDrawing->Text = L"DefaultDrawing";
	Item = ListView1->Items->Add();
	Item->Purpose = TListItemPurpose::Header;
	Item->Text = L"TGridModel->Columns[1]";
	FItemWidth = ListView1->Items->Add();
	FItemWidth->Text = L"Width";
	FItemVisible = ListView1->Items->Add();
	FItemVisible->Text = L"Visible";
	Item = ListView1->Items->Add();
	Item->Purpose = TListItemPurpose::Header;
	Item->Text = L"TGridModel->Columns[2]";
	FItemReadonly = ListView1->Items->Add();
	FItemReadonly->Text = L"ReadOnly";
	FItemEnabled = ListView1->Items->Add();
	FItemEnabled->Text = L"Enabled";
}
// --------------------------------------------------------------------------
void __fastcall TMainForm::StringGridInit() {
	int I = 0;
	for (int I = 0; I <= StringGrid1->RowCount - 1; I++) {
		StringGrid1->Cells[0][I] = FloatToStr(I + 1 + (Random() * 0.1));
		StringGrid1->Cells[1][I] = IntToStr(I % ImageList1->Count);
		StringGrid1->Cells[2][I] = L"Row # " + IntToStr(I);
	}
	I = 1;
	InitStringValue(4, I, L"Progress", L"");
	InitStringValue(4, I, L"Progress", L"0");
	InitStringValue(4, I, L"Progress Integer", L"100");
	InitStringValue(4, I, L"Progress Float", FloatToStr(333.33));
	InitStringValue(4, I, L"Progress 50%", L"500");
	InitStringValue(4, I, L"Progress 100%", L"1000");
	InitStringValue(4, I, L"Progress more than 100%", L"10000");
	InitStringValue(4, I, L"Progress less than 0%", L"-1");
	InitStringValue(4, I, L"Progress error value", L"Error");
	InitStringValue(5, I, L"Check column", L"");
	InitStringValue(5, I, L"Check column", L"t");
	InitStringValue(5, I, L"Check column", L"true");
	InitStringValue(5, I, L"Check column", L"False");
	InitStringValue(5, I, L"Check column", L"y");
	InitStringValue(5, I, L"Check column", L"N");
	InitStringValue(5, I, L"Check column", L"F");
	InitStringValue(5, I, L"Check column", L"0");
	InitStringValue(5, I, L"Check column", L"1");
	InitStringValue(5, I, L"Check column", L"-1");
	InitStringValue(6, I, L"Date and Time",
		FormatDateTime(DateColumn1->Format + " " +
		FormatSettings.ShortTimeFormat, EncodeDate(1961, 4, 12) + EncodeTime(9,
		7, 5, 333)));
	InitStringValue(6, I, L"Date", DateToStr(EncodeDate(1957, 10, 4)));
	InitStringValue(6, I, L"Long Date Format",
		FormatDateTime(FormatSettings.LongDateFormat, EncodeDate(1988,
		11, 15)));
	InitStringValue(6, I, L"Error Date", L"Error");
	InitStringValue(7, I, L"Date and Time",
		DateTimeToStr(EncodeDate(1961, 4, 12) + EncodeTime(9, 7, 5, 333)));
	InitStringValue(7, I, L"Time", TimeToStr(EncodeTime(12, 45, 33, 777)));
	InitStringValue(7, I, L"Long Time Format",
		FormatDateTime(FormatSettings.LongTimeFormat, EncodeTime(18, 15, 22,
		555)));
	InitStringValue(7, I, L"Error Time", L"Error");
	InitStringValue(8, I, L"Popup by Index", L"1");
	InitStringValue(8, I, L"Popup by Text", L"interesting text");
	InitStringValue(8, I, L"Popup by Text", L"text");
}
// --------------------------------------------------------------------------
void __fastcall TMainForm::GridUpdate() {
	int I = 0;
    TColumn* Column;
	Grid1->RowCount = StringGrid1->RowCount;
	for (int stop = StringGrid1->ColumnCount - 1, I = 0; I <= stop; I++) {
		Grid1->AddObject(StringGrid1->Columns[I]->Clone(this));
		if (TProgressColumn *ProgressColumn = dynamic_cast<TProgressColumn*>(Grid1->Columns[Grid1->ColumnCount - 1]))
			ProgressColumn->Max = Grid1->RowCount;
	}
	FDMemTable1->Open();
	for (int stop = Min(Grid1->ColumnCount, Grid2->ColumnCount) - 1, I = 0;
	I <= stop; I++) {
		Column = Grid2->Columns[I];
		Column->Header = StringGrid1->Columns[I]->Header;
		Column->Width = StringGrid1->Columns[I]->Width;
		if (TProgressColumn *ProgressColumn = dynamic_cast<TProgressColumn*>(Column))
			ProgressColumn->Max = Grid2->RowCount;
	}
	Column = new TImageColumn(this);
	Column->Header = Column->ClassName();
	Grid1->AddObject(Column);
	FBitmaps.Length = Grid1->RowCount;
	for (I = FBitmaps.Low; I <= FBitmaps.High; I++)
		FBitmaps[I] = NULL;
	FStrings.Length = Grid1->RowCount;
	FPopups.Length = Grid1->RowCount;
	FDates.Length = Grid1->RowCount;
	FTimes.Length = Grid1->RowCount;
	FDates[Grid1->RowCount - 1] = 0.0;
	FTimes[Grid1->RowCount - 1] = 0.0;
}
// --------------------------------------------------------------------------
void __fastcall TMainForm::MemTableUpdate() {
	int I = 0;
	if (dynamic_cast<TCurrencyColumn*>(Grid2->Columns[0]))
		((TCurrencyColumn*)(Grid2->Columns[0]))->DecimalDigits = 0;
	FDMemTable1->DisableControls();
	for (I = 0; I <= 200; I++) {
		FDMemTable1->Append();
		FDMemTable1Index->AsInteger = I + 1;
		FDMemTable1ImageIndex->AsInteger = I % ImageList1->Count;
		FDMemTable1String->AsString = L"Row # " + IntToStr(I);
	}
	FDMemTable1->First();
	FDMemTable1Index->ReadOnly = true;
	FDMemTable1->EnableControls();
}
// --------------------------------------------------------------------------
void __fastcall TMainForm::CreateBitmap() {
    TBitmap* Bitmap;
	TCustomSourceItem* SourceItem;
	TCustomBitmapItem* BitmapItem;
	TLayer* Layer;
	ImageList1->CacheSize = 20;
	Bitmap = TCheckColumn::CreateBitmap(StringGrid1->Model, true, true);
	try {
		SourceItem = ImageList1->Source->Add();
		SourceItem->MultiResBitmap->SizeKind = TSizeKind::Source;
		if (SourceItem->MultiResBitmap->Count == 0)
			BitmapItem = SourceItem->MultiResBitmap->Add();
		else
			BitmapItem = ((SourceItem->MultiResBitmap->ItemByScale(0, false, true)));
		BitmapItem->Bitmap->Assign(Bitmap);
		Layer = ImageList1->Destination->Add()->Layers->Add();
		Layer->Name = SourceItem->Name;
		Layer->SourceRect->Rect =
			TRectF(TPointF((float)0,(float)0),
			(int)round(double(BitmapItem->Width) / BitmapItem->Scale),
			(int)round(double(BitmapItem->Height) / BitmapItem->Scale));
		FBoolImageIndex[false] = -1;
		FBoolImageIndex[true] = ImageList1->Count - 1;
	}
	__finally {
		delete Bitmap;
		Bitmap = NULL;
	}
}
// --------------------------------------------------------------------------
// End Init Section ---------------------------------------------------------

// --------------------------------------------------------------------------
void __fastcall TMainForm::FormCreate(TObject *Sender) {
	CreateBitmap();
	AddItemActions();
	AddItemReturnActions();
	AddItemGrid();
	StringGridInit();
	GridUpdate();
	MemTableUpdate();
	UpdateListView();
	PropogateOptions();
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::LayoutEventLogResize(TObject *Sender) {
	if (LayoutEventLog->Height <= Splitter1->MinSize) {
		LayoutEventLog->Visible = false;
		Splitter1->Visible = false;
	}
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::ListView1Change(TObject *Sender) {
	UpdateListView();
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::UpdateListViewOptionsProc() {
	UpdateListView();
	PropogateOptions();
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::ListView1ItemClick(TObject * const Sender,
	TListViewItem * const AItem) {
	int I = 0;
    TGridOptions Options;
	Options = StringGrid1->Options;
	try {
		for (int I = 0; I < sizeof(GridOptionValues)/sizeof(GridOptionValues[0]); I++)
			if (AItem->Text == FItemOption[I]->Text) {
				if (StringGrid1->Options.Contains(GridOptionValues[I].Value)) {
					Options = Options >> GridOptionValues[I].Value;
				} else {
					Options = Options << GridOptionValues[I].Value;
				}
				StringGrid1->Options = Options;
				UpdateListViewOptionsProc();
				return;
			}
		for (int I = 0;I < sizeof(CellReturnActionValues) / sizeof(CellReturnActionValues[0]); I++)
			if (AItem == FItemReturnAction[I]) {
				StringGrid1->Model->CellReturnAction = CellReturnActionValues[I].Value;
				UpdateListViewOptionsProc();
				return;
			}
		if (AItem == FItemDefaultDrawing) {
			StringGrid1->DefaultDrawing = !StringGrid1->DefaultDrawing;
			UpdateListViewOptionsProc();
			return;
		}
		if (AItem == FItemWidth) {
			if (StringGrid1->Columns[1]->Width > 0)
				StringGrid1->Columns[1]->Width = 0;
			else
				StringGrid1->Columns[1]->Width = FStoredWidth;
			UpdateListViewOptionsProc();
			return;
		}
		if (AItem == FItemVisible) {
			StringGrid1->Columns[1]->Visible = !StringGrid1->Columns[1]->Visible;
			UpdateListViewOptionsProc();
			return;
		}
		if (AItem == FItemReadonly) {
			StringGrid1->Columns[2]->ReadOnly = !StringGrid1->Columns[2]->ReadOnly;
			UpdateListViewOptionsProc();
			return;
		}
		if (AItem == FItemEnabled) {
			StringGrid1->Columns[2]->Enabled = !StringGrid1->Columns[2]->Enabled;
			UpdateListViewOptionsProc();
			return;
		}
	}
	__finally {
		UpdateListViewOptionsProc();
	}
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::UpdateWidthValue() {
	FItemWidth->Detail = IntToStr((int)round(StringGrid1->Columns[1]->Width));
	if (FItemWidth->Objects->AccessoryObject != NULL)
		FItemWidth->Objects->AccessoryObject->Visible =
			StringGrid1->Columns[1]->Width > 0;
	if (StringGrid1->Columns[1]->Width > 0)
		FStoredWidth = StringGrid1->Columns[1]->Width;
}
// --------------------------------------------------------------------------
void __fastcall TMainForm::InternalPropagate(TGrid* Grid) {
	Grid->Options = StringGrid1->Options;
	Grid->Model->CellReturnAction = StringGrid1->Model->CellReturnAction;
	Grid->ControlType = StringGrid1->ControlType;
	for (int i = 0; i < Min(Grid->ColumnCount, StringGrid1->ColumnCount); ++i) {
		Grid->Columns[i]->Visible = StringGrid1->Columns[i]->Visible;
		Grid->Columns[i]->Width = StringGrid1->Columns[i]->Width;
		Grid->Columns[i]->Enabled = StringGrid1->Columns[i]->Enabled;
		Grid->Columns[i]->ReadOnly = StringGrid1->Columns[i]->ReadOnly;
	}
	Grid->DefaultDrawing = StringGrid1->DefaultDrawing;
	Grid->OnHeaderClick = StringGrid1->OnHeaderClick;
	Grid->OnSelChanged = StringGrid1->OnSelChanged;
	Grid->OnSelectCell = StringGrid1->OnSelectCell;
	Grid->OnDrawColumnCell = StringGrid1->OnDrawColumnCell;
	Grid->OnDrawColumnBackground = StringGrid1->OnDrawColumnBackground;
	Grid->OnDrawColumnHeader = StringGrid1->OnDrawColumnHeader;
	Grid->OnColumnMoved = StringGrid1->OnColumnMoved;
	Grid->OnEditingDone = StringGrid1->OnEditingDone;
	Grid->OnResize = StringGrid1->OnResize;
	Grid->OnTap = StringGrid1->OnTap;
}
// --------------------------------------------------------------------------
void __fastcall TMainForm::PropogateOptions() {
	InternalPropagate(Grid1);
	InternalPropagate(Grid2);
}
// --------------------------------------------------------------------------
void __fastcall TMainForm::UpdateViewItem(TListViewItem* Item,
	const PTypeInfo AType, const int AValue, const bool AChecked) {
	Item->Detail = GetEnumName(AType, AValue);
	if (Item->Objects->AccessoryObject != NULL)
		Item->Objects->AccessoryObject->Visible = AChecked;
}
// --------------------------------------------------------------------------
void __fastcall TMainForm::UpdateViewItemBool(TListViewItem* Item,
	const bool AChecked) {
	UpdateViewItem(Item, __delphirtti(bool), (int)AChecked, AChecked);
}
// --------------------------------------------------------------------------
void __fastcall TMainForm::UpdateListView() {
	int I = 0;
	if (!FListViewUpdating) {
		FListViewUpdating = true;
		try {
			ListView1->BeginUpdate();
			try {
				FItemControlType->Detail =
					GetEnumName(__delphirtti(TControlType),
					(int)StringGrid1->ControlType);
				UpdateViewItem(FItemControlType, __delphirtti(TControlType),
					(int)StringGrid1->ControlType,
					StringGrid1->ControlType == TControlType::Platform);
				if (StringGrid1->ControlType == TControlType::Platform)
					FItemControlType->ImageIndex = 3;
				else
					FItemControlType->ImageIndex = -1;
				if (FItemControlType->Objects->AccessoryObject != NULL)
					FItemControlType->Objects->AccessoryObject->Visible = false;
				UpdateViewItemBool(FItemDefaultDrawing,
					StringGrid1->DefaultDrawing);
				for (int I = 0;
				I < sizeof(GridOptionValues) / sizeof(GridOptionValues[0]); I++)
				{
					UpdateViewItemBool(FItemOption[I],
						StringGrid1->Options.Contains
						(GridOptionValues[I].Value));
				}
				for (int I = 0;
				I < sizeof(CellReturnActionValues) / sizeof
					(CellReturnActionValues[0]); I++) {
					UpdateViewItemBool(FItemReturnAction[I],
						StringGrid1->Model->CellReturnAction ==
						CellReturnActionValues[I].Value);
				}
				UpdateWidthValue();
				UpdateViewItemBool(FItemVisible,
					StringGrid1->Columns[1]->Visible);
				UpdateViewItemBool(FItemReadonly,
					StringGrid1->Columns[2]->ReadOnly);
				UpdateViewItemBool(FItemEnabled,
					StringGrid1->Columns[2]->Enabled);
			}
			__finally {
				ListView1->EndUpdate();
			}
		}
		__finally {
			FListViewUpdating = false;
		}
	}
}
// --------------------------------------------------------------------------
void __fastcall TMainForm::ActionList1Update(TBasicAction *Action, bool &Handled) {
	UpdateWidthValue();
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::ActnClearEventLogExecute(TObject *Sender) {
	Memo1->Text = EmptyStr;
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::ActnClearEventLogUpdate(TObject *Sender) {
	if (TCustomAction *CustomAction = dynamic_cast<TCustomAction*>(Sender))
		CustomAction->Enabled = Memo1->Text != EmptyStr;
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::Grid1GetValue(TObject *Sender, const int ACol, const int ARow, TValue &Value) {
	String ColumnClass = TColumnClass(Grid1->Columns[ACol]->ClassType())->ClassName();
	if (ColumnClass == TImageColumn::ClassName())
		Value = FBitmaps[ARow];
	else if (ColumnClass == TColumn::ClassName()) {
		if (FBitmaps[ARow] == NULL)
			Value = UnicodeString(L"NULL");
		else if (FBitmaps[ARow]->IsEmpty)
			Value = SEmpty;
		else
			Value = Format(L"Width: %d; Height: %d",
			ARRAYOFCONST((FBitmaps[ARow]->Width, FBitmaps[ARow]->Height)));
	}
	else if (ColumnClass == TCheckColumn::ClassName()) {
		if (FBitmaps[ARow] == NULL)
			Value = TValue::Empty;
		else if (FBitmaps[ARow]->IsEmpty)
			Value = false;
		else
			Value = true;
	}
	else if (ColumnClass == TCurrencyColumn::ClassName())
		Value = ARow + 1 + (Random() * 0.1);
	else if (ColumnClass == TGlyphColumn::ClassName())
		Value = ARow % ImageList1->Count;
	else if (ColumnClass == TStringColumn::ClassName())
		Value = FStrings[ARow];
	else if (ColumnClass == TPopupColumn::ClassName())
		Value = FPopups[ARow];
	else if (ColumnClass == TProgressColumn::ClassName())
		Value = ARow;
	else if (ColumnClass == TDateColumn::ClassName()) {
		if (((double)(FDates[ARow]))==0.0)
			Value = TValue::Empty;
		else
			Value = TValue::From<TDateTime>(FDates[ARow]);
	}
	else if (ColumnClass == TTimeColumn::ClassName()) {
		if (((double)(FTimes[ARow]))==0.0)
			Value = TValue::Empty;
		else
			Value = TValue::From<TDateTime>(FTimes[ARow]);
	}
}
// ---------------------------------------------------------------------------
void __fastcall TMainForm::Grid1SetValue(TObject *Sender, const int ACol, const int ARow, const TValue &Value) {
	String ColumnClass = TColumnClass(Grid1->Columns[ACol]->ClassType())->ClassName();
    TValue LValue = Value;
	if (ColumnClass == TImageColumn::ClassName()) {
		if (!LValue.IsEmpty && LValue.IsObject() && LValue.AsObject()->ClassName() == TBitmap::ClassName()) {
			if (FBitmaps[ARow] == NULL)
				FBitmaps[ARow] = new TBitmap;
			FBitmaps[ARow]->Assign(static_cast<TBitmap*>(LValue.AsObject()));
		}
	}
	else if (ColumnClass == TStringColumn::ClassName())
		FStrings[ARow] = LValue.ToString();
	else if (ColumnClass == TPopupColumn::ClassName())
		FPopups[ARow] = LValue.ToString();
	else if (ColumnClass == TDateColumn::ClassName()) {
		if ((LValue.IsEmpty) || !(LValue.TryAsType<TDateTime>(FDates[ARow])))
			FDates[ARow] = 0.0;
	}
	else if (ColumnClass == TTimeColumn::ClassName()) {
		if ((LValue.IsEmpty) || !(LValue.TryAsType<TDateTime>(FTimes[ARow])))
			FTimes[ARow] = 0.0;
	}
}
// ---------------------------------------------------------------------------

