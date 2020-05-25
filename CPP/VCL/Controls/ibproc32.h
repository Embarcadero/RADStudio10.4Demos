//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef Ibproc32H
#define Ibproc32H
//---------------------------------------------------------------------------
#include <SysUtils.hpp>
#include <System.hpp>

namespace Ibproc32
{
//-- type declarations -------------------------------------------------------
typedef void *isc_db_handle;

typedef System::Pointer *pisc_db_handle;

typedef int isc_long;

typedef long *pisc_long;

typedef int isc_status;

typedef long *pisc_status;

typedef void *isc_tr_handle;

typedef System::Pointer *pisc_tr_handle;

typedef long status_vector[20];

typedef status_vector *pstatus_vector;

typedef pstatus_vector *ppstatus_vector;

typedef WORD IBPROC32_short;

typedef struct __isc_teb
{
	System::Pointer *db_ptr;
	long tpb_len;
	char *tpb_ptr;
}isc_teb ;

typedef isc_teb *pisc_teb;

typedef struct __TXSQLVar
{
}TXSQLVar ;

typedef struct __TXSQLDA
{
}TXSQLDA ;

typedef TXSQLDA *PTXSQLDA;

typedef void __fastcall (*isc_callback)(System::Pointer ptr, WORD length, System::PChar updated
	);

typedef long __stdcall (*TIscAttachDatabase)(pstatus_vector status, WORD db_name_length
	, System::PChar db_name, pisc_db_handle db_handle, WORD parm_buffer_length, System::PChar parm_buffer
	);

typedef long __stdcall (*TIscCancelEvents)(pstatus_vector status, pisc_db_handle db_handle
	, pisc_long event_id);

typedef long __stdcall (*TIscCommitTransaction)(pstatus_vector status, pisc_tr_handle trans_handle
	);

typedef long __stdcall (*TIscDetachDatabase)(pstatus_vector status, pisc_db_handle db_handle
	);

typedef long __stdcall (*TIscDropDatabase)(pstatus_vector status, pisc_db_handle db_handle
	);

typedef long __stdcall (*TIscDsqlExecuteImmediate)(pstatus_vector status, pisc_db_handle 
	db_handle, pisc_tr_handle trans_handle, WORD length, System::PChar statement, System::Word 
	dialect, PTXSQLDA xslqda);

typedef long __cdecl (*TIscEventBlock)(System::Pointer event_buf, System::Pointer result_buf
	, WORD count, ...);

typedef void __stdcall (*TIscEventCounts)(pstatus_vector status, System::Word buffer_length, System::PChar
	event_buffer, System::PChar result_buffer);

typedef long __stdcall (*TIscFree)(System::PChar buffer);
	
typedef long __stdcall (*TIscInterprete)(System::PChar buffer, ppstatus_vector status);

typedef long __stdcall (*TIscQueEvents)(pstatus_vector status, pisc_db_handle db_handle, 
	pisc_long event_id, WORD length, System::PChar event_buffer, isc_callback event_function, System::Pointer 
	event_function_arg);

typedef System::Longint __stdcall (*TIscRollbackTransaction)(pstatus_vector status, pisc_tr_handle trans_handle
	);

typedef System::Longint __stdcall (*TIscStartMultiple)(pstatus_vector status, pisc_tr_handle trans_handle
	, WORD db_handle_count, pisc_teb teb_vector_address);

class EDLLLoadError : public Sysutils::Exception
{
	typedef EDLLLoadError ThisClass;
	typedef Sysutils::Exception inherited;
	
public:
	__fastcall EDLLLoadError(const System::String Msg) : Sysutils::Exception(
		Msg) { }
	__fastcall EDLLLoadError(const System::String Msg, const TVarRec *
		Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	__fastcall EDLLLoadError(int Ident) : Sysutils::Exception(
		Ident) { }
	__fastcall EDLLLoadError(int Ident, const TVarRec *Args
		, const int Args_Size) : Sysutils::Exception(Ident, Args, Args_Size) { }
	__fastcall EDLLLoadError(const System::String Msg, int
		AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	__fastcall EDLLLoadError(const System::String Msg, const TVarRec
		*Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args
		, Args_Size, AHelpContext) { }
	__fastcall EDLLLoadError(int Ident, int AHelpContext
		) : Sysutils::Exception(Ident, AHelpContext) { }
	__fastcall EDLLLoadError(int Ident, const TVarRec *
		Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Ident, 
		Args, Args_Size, AHelpContext) { }
	__fastcall virtual ~EDLLLoadError(void) { }
};

//-- var, const, procedure ---------------------------------------------------
#define isc_dpb_version1 System::BYTE(1)
#define isc_dpb_user_name System::BYTE(28)
#define isc_dpb_password System::Byte(29)
#define isc_tpb_concurrency System::Byte(2)
#define isc_tpb_version3 System::Byte(3)
#define isc_tpb_wait System::Byte(6)
#define isc_tpb_write System::Byte(9)

}       /* namespace Ibproc32 */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Ibproc32;
#endif
//-- end unit ----------------------------------------------------------------
#endif  // IBPROC32H
