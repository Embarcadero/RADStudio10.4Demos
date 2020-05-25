//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#pragma hdrstop
//---------------------------------------------------------------------------
#include "bcbsmpreg.h"
#include "trayicon.h"
#include "perfgrap.h"
#include "cspin.h"
#include "cgrid.h"
#include "cgauges.h"
#include "cdiroutl.h"
#include "ccalendr.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "bcbsmpreg.res"

namespace Bcbsmpreg
{
   void __fastcall PACKAGE Register()
   {
	 TComponentClass classes[8] = {__classid(TCTrayIcon), __classid(TPerformanceGraph),
								   __classid(TCSpinButton), __classid(TCSpinEdit),
								   __classid(TCColorGrid), __classid(TCGauge),
								   __classid(TCDirectoryOutline), __classid(TCCalendar)};

	 ActivateClassGroup(__classid(Controls::TControl));

	 GroupDescendentsWith(__classid(TCTrayIcon), __classid(Controls::TControl));
	 GroupDescendentsWith(__classid(TPerformanceGraph), __classid(Controls::TControl));
	 GroupDescendentsWith(__classid(TCSpinButton), __classid(Controls::TControl));
	 GroupDescendentsWith(__classid(TCSpinEdit), __classid(Controls::TControl));
	 GroupDescendentsWith(__classid(TCColorGrid), __classid(Controls::TControl));
	 GroupDescendentsWith(__classid(TCDirectoryOutline), __classid(Controls::TControl));
	 GroupDescendentsWith(__classid(TCCalendar), __classid(Controls::TControl));

	 RegisterComponents(LoadStr(Tab_101), classes, (sizeof(classes)/sizeof(classes[0])) - 1);
  }
}


