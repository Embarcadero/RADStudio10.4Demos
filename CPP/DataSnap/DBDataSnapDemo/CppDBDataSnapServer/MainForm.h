//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef MainFormH
#define MainFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <Datasnap.DSCommonServer.hpp>
#include <Datasnap.DSServer.hpp>
#include <Datasnap.DSTCPServerTransport.hpp>
#include <IPPeerServer.hpp>
#include <FMX.Types.hpp>
#include <FMX.StdCtrls.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TDSServer *DSServer1;
	TDSServerClass *DSServerClass1;
	TDSTCPServerTransport *DSTCPServerTransport1;
	TLabel *Label1;
	TLabel *ClientsLabel;
	void __fastcall DSServerClass1GetClass(TDSServerClass *DSServerClass, TPersistentClass &PersistentClass);
	void __fastcall DSServer1Connect(TDSConnectEventObject *DSConnectEventObject);
	void __fastcall DSServer1Disconnect(TDSConnectEventObject *DSConnectEventObject);


private:	// User declarations
    int NumberOfClients;
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
