//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "MainForm.h"
#include "CppServerModuleUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
    NumberOfClients = 0;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DSServerClass1GetClass(TDSServerClass *DSServerClass, TPersistentClass &PersistentClass)

{
	PersistentClass = __classid(TDSServerModule1);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DSServer1Connect(TDSConnectEventObject *DSConnectEventObject)

{
	NumberOfClients++;
	ClientsLabel->Text = IntToStr(NumberOfClients);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DSServer1Disconnect(TDSConnectEventObject *DSConnectEventObject)

{
	NumberOfClients--;
	ClientsLabel->Text = IntToStr(NumberOfClients);
}
//---------------------------------------------------------------------------

