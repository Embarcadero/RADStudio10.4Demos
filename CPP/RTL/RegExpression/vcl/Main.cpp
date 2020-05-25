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

#include "Main.h"
#include "System.RegularExpressions.hpp"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TformRegExp *formRegExp;

// ---------------------------------------------------------------------------
__fastcall TformRegExp::TformRegExp(TComponent* Owner) : TForm(Owner) {
}

// ---------------------------------------------------------------------------
void __fastcall TformRegExp::FormCreate(TObject *Sender) {
	lbRegExp->ItemIndex = 0;
	lbRegExpClick(lbRegExp);
}

// ---------------------------------------------------------------------------
void __fastcall TformRegExp::btnEvaluateClick(TObject *Sender) {

	if (TRegEx::IsMatch(EditText->Text, MemoRegEx->Text)) {
		ShowMessage("Text DOES match the regular expression");
	}
	else
		ShowMessage("Text DOES NOT match the regular expression");
}
// ---------------------------------------------------------------------------

void __fastcall TformRegExp::lbRegExpClick(TObject *Sender) {
	switch (lbRegExp->ItemIndex) {
	case 0:
		lbType->Caption = "Email for validation";

		MemoRegEx->Text =
			"^((?>[a-zA-Z\d!#$%&''*+\\-/=?^_`{|}~]+\\x20*" "|\"((?=[\\x01-\\x7f])[^\"\\\\]|\\\\[\\x01-\\x7f])*\"\\"
			"x20*)*(?<angle><))?((?!\\.)(?>\.?[a-zA-Z\d!" "#$%&''*+\\-/=?^_`{|}~]+)+|\"\"((?=[\\x01-\\x7f])"
			"[^\"\\\\]|\\\\[\\x01-\\x7f])*\")@(((?!-)[a-zA-Z\\d\\" "-]+(?<!-)\\.)+[a-zA-Z]{2,}|\\[(((?(?<!\\[)\\.)"
			"(25[0-5]|2[0-4]\\d|[01]?\\d?\\d)){4}|[a-zA-Z\\" "d\\-]*[a-zA-Z\\d]:((?=[\\x01-\\x7f])[^\\\\\\[\\]]|"
			"\\\\[\\x01-\\x7f])+)\\])(?(angle)>)$";
		break;

	case 1: {
			// Accept IP address between 0..255
			lbType->Caption = "IP address for validation (0..255)";
			MemoRegEx->Text =
				"\\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\" ".(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\."
				"(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\." "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\b";
			break;

		}

	case 2: {
			// Data interval format mm-dd-yyyy
			lbType->Caption =
				"Date in mm-dd-yyyy format from between 01-01-1900 and 12-31-2099";
			MemoRegEx->Text =
				"^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[" "01])[- /.](19|20)\\d\\d$";
			break;

		}

	case 3: {
			// Data interval format mm-dd-yyyy
			lbType->Caption =
				"Date in dd-mm-yyyy format from between 01-01-1900 and 31-12-2099";
			MemoRegEx->Text =
				"^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[01" "2])[- /.](19|20)\\d\\d$";
			break;

		}

	}
}
// ---------------------------------------------------------------------------
