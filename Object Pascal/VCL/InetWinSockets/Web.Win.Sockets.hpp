//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef Web_Win_SocketsHPP
#define Web_Win_SocketsHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w       // Display all warnings
#pragma option -w-inl   // Functions %s are not expanded inline
#pragma option -w-8111  // Accessing deprecated entity
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <Winapi.WinSock.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Web
{
namespace Win
{
namespace Sockets
{
//-- type declarations -------------------------------------------------------
enum DECLSPEC_DENUM TSocketDomain : unsigned char { pfUnspec, pfUnix, pfInet, pfImpLink, pfPup, pfChaos, pfIpx, pfNs, pfIso, pfOsi, pfEcma, pfDataKit, pfCcitt, pfSna, pfDecNet, pfDli, pfLat, pfHylink, pfAppleTalk, pfVoiceView, pfFireFox, pfUnknown1, pfBan, pfMax };

typedef System::Word TSocketProtocol;

enum DECLSPEC_DENUM TServerSocketBlockMode : unsigned char { bmBlocking, bmNonBlocking, bmThreadBlocking };

typedef TServerSocketBlockMode TSocketBlockMode;

enum DECLSPEC_DENUM TSocketType : unsigned char { stStream, stDgram, stRaw, stRdm, stSeqPacket };

typedef void __fastcall (__closure *TSocketNotifyEvent)(System::TObject* Sender);

typedef void __fastcall (__closure *TSocketDataEvent)(System::TObject* Sender, char * Buf, int &DataLen);

typedef void __fastcall (__closure *TSocketErrorEvent)(System::TObject* Sender, int SocketError);

class DELPHICLASS ESocketError;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ESocketError : public System::Sysutils::Exception
{
	typedef System::Sysutils::Exception inherited;
	
public:
	/* Exception.Create */ inline __fastcall ESocketError(const System::UnicodeString Msg) : System::Sysutils::Exception(Msg) { }
	/* Exception.CreateFmt */ inline __fastcall ESocketError(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_High) : System::Sysutils::Exception(Msg, Args, Args_High) { }
	/* Exception.CreateRes */ inline __fastcall ESocketError(NativeUInt Ident)/* overload */ : System::Sysutils::Exception(Ident) { }
	/* Exception.CreateRes */ inline __fastcall ESocketError(System::PResStringRec ResStringRec)/* overload */ : System::Sysutils::Exception(ResStringRec) { }
	/* Exception.CreateResFmt */ inline __fastcall ESocketError(NativeUInt Ident, System::TVarRec const *Args, const int Args_High)/* overload */ : System::Sysutils::Exception(Ident, Args, Args_High) { }
	/* Exception.CreateResFmt */ inline __fastcall ESocketError(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_High)/* overload */ : System::Sysutils::Exception(ResStringRec, Args, Args_High) { }
	/* Exception.CreateHelp */ inline __fastcall ESocketError(const System::UnicodeString Msg, int AHelpContext) : System::Sysutils::Exception(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall ESocketError(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_High, int AHelpContext) : System::Sysutils::Exception(Msg, Args, Args_High, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall ESocketError(NativeUInt Ident, int AHelpContext)/* overload */ : System::Sysutils::Exception(Ident, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall ESocketError(System::PResStringRec ResStringRec, int AHelpContext)/* overload */ : System::Sysutils::Exception(ResStringRec, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall ESocketError(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_High, int AHelpContext)/* overload */ : System::Sysutils::Exception(ResStringRec, Args, Args_High, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall ESocketError(NativeUInt Ident, System::TVarRec const *Args, const int Args_High, int AHelpContext)/* overload */ : System::Sysutils::Exception(Ident, Args, Args_High, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~ESocketError(void) { }
	
};

#if !defined(__CPP__) && !defined(__clang__)
#if sizeof(ESocketError) < 24
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(ESocketError) < (Pascal) [size: 24, align: 4] (WARNING)"
	#pragma sizeof(ESocketError)
#endif  // sizeof(ESocketError)
#if sizeof(ESocketError) > 24
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(ESocketError) > (Pascal) [size: 24, align: 4] (WARNING)"
	#pragma sizeof(ESocketError)
#endif  // sizeof(ESocketError)
#endif  // !__CPP__ && !__clang__

#pragma pack(pop)

class DELPHICLASS TBaseSocket;
class PASCALIMPLEMENTATION TBaseSocket : public System::Classes::TComponent
{
	typedef System::Classes::TComponent inherited;
	
private:
	bool FActive;
	TServerSocketBlockMode FBlockMode;
	unsigned FBytesReceived;
	unsigned FBytesSent;
	TSocketDomain FDomain;
	System::Word FProtocol;
	NativeInt FSocket;
	TSocketType FSockType;
	TSocketNotifyEvent FOnCreateHandle;
	TSocketNotifyEvent FOnDestroyHandle;
	TSocketErrorEvent FOnError;
	TSocketDataEvent FOnReceive;
	TSocketDataEvent FOnSend;
	void __fastcall SetActive(bool Value);
	void __fastcall SetBlockMode(TSocketBlockMode Value);
	void __fastcall SetDomain(TSocketDomain Value);
	void __fastcall SetProtocol(System::Word Value);
	void __fastcall SetSockType(TSocketType Value);
	
protected:
	DYNAMIC void __fastcall DoCreateHandle(void);
	DYNAMIC void __fastcall DoDestroyHandle(void);
	DYNAMIC void __fastcall DoHandleError(void);
	virtual void __fastcall DoReceive(char * Buf, int &DataLen);
	virtual void __fastcall DoSend(char * Buf, int &DataLen);
	virtual int __fastcall ErrorCheck(int rc);
	virtual void __fastcall Loaded(void);
	void __fastcall SetBytesReceived(unsigned Value);
	void __fastcall SetBytesSent(unsigned Value);
	
public:
	__fastcall virtual TBaseSocket(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TBaseSocket(void);
	virtual void __fastcall Open(void);
	virtual void __fastcall Close(void);
	int __fastcall MapDomain(TSocketDomain sd);
	int __fastcall MapSockType(TSocketType st);
	int __fastcall PeekBuf(void *Buf, int BufSize);
	int __fastcall ReceiveBuf(void *Buf, int BufSize, int Flags = 0x0);
	System::AnsiString __fastcall Receiveln(const System::AnsiString eol = "\r\n");
	bool __fastcall Select(System::PBoolean ReadReady, System::PBoolean WriteReady, System::PBoolean ExceptFlag, int TimeOut = 0x0);
	int __fastcall SendBuf(void *Buf, int BufSize, int Flags = 0x0);
	int __fastcall Sendln(System::AnsiString s, const System::AnsiString eol = "\r\n");
	int __fastcall SendStream(System::Classes::TStream* AStream);
	bool __fastcall WaitForData(int TimeOut = 0x0);
	__property bool Active = {read=FActive, write=SetActive, default=0};
	__property TSocketBlockMode BlockMode = {read=FBlockMode, write=SetBlockMode, default=0};
	__property unsigned BytesReceived = {read=FBytesReceived, nodefault};
	__property unsigned BytesSent = {read=FBytesSent, nodefault};
	__property TSocketDomain Domain = {read=FDomain, write=SetDomain, default=0};
	__property NativeInt Handle = {read=FSocket, nodefault};
	__property System::Word Protocol = {read=FProtocol, write=SetProtocol, nodefault};
	__property TSocketType SockType = {read=FSockType, write=SetSockType, default=0};
	__property TSocketNotifyEvent OnCreateHandle = {read=FOnCreateHandle, write=FOnCreateHandle};
	__property TSocketNotifyEvent OnDestroyHandle = {read=FOnDestroyHandle, write=FOnDestroyHandle};
	__property TSocketErrorEvent OnError = {read=FOnError, write=FOnError};
	__property TSocketDataEvent OnReceive = {read=FOnReceive, write=FOnReceive};
	__property TSocketDataEvent OnSend = {read=FOnSend, write=FOnSend};
};

#if !defined(__CPP__) && !defined(__clang__)
#if sizeof(TBaseSocket) < 128
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TBaseSocket) < (Pascal) [size: 128, align: 8] (WARNING)"
	#pragma sizeof(TBaseSocket)
#endif  // sizeof(TBaseSocket)
#if sizeof(TBaseSocket) > 128
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TBaseSocket) > (Pascal) [size: 128, align: 8] (WARNING)"
	#pragma sizeof(TBaseSocket)
#endif  // sizeof(TBaseSocket)
#endif  // !__CPP__ && !__clang__


#pragma pack(push,1)
struct DECLSPEC_DRECORD TIPHeader
{
public:
	System::Byte iph_verlen;
	System::Byte iph_tos;
	System::Word iph_length;
	System::Word iph_id;
	System::Word iph_offset;
	System::Byte iph_ttl;
	System::Byte iph_protocol;
	System::Word iph_xsum;
	unsigned iph_src;
	unsigned iph_dest;
};
#pragma pack(pop)

#if !defined(__CPP__) && !defined(__clang__)
#if sizeof(TIPHeader) < 20
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TIPHeader) < (Pascal) [size: 20, align: 1] (WARNING)"
	#pragma sizeof(TIPHeader)
#endif  // sizeof(TIPHeader)
#if sizeof(TIPHeader) > 20
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TIPHeader) > (Pascal) [size: 20, align: 1] (WARNING)"
	#pragma sizeof(TIPHeader)
#endif  // sizeof(TIPHeader)
#endif  // !__CPP__ && !__clang__


typedef System::AnsiString TSocketHost;

typedef System::AnsiString TSocketPort;

class DELPHICLASS TIpSocket;
class PASCALIMPLEMENTATION TIpSocket : public TBaseSocket
{
	typedef TBaseSocket inherited;
	
private:
	TSocketHost FLocalHost;
	TSocketPort FLocalPort;
	TSocketHost FRemoteHost;
	TSocketPort FRemotePort;
	void __fastcall SetLocalHost(TSocketHost Value);
	void __fastcall SetLocalPort(TSocketPort Value);
	void __fastcall SetRemoteHost(TSocketHost Value);
	void __fastcall SetRemotePort(TSocketPort Value);
	
protected:
	bool __fastcall Bind(void);
	
public:
	__fastcall virtual TIpSocket(System::Classes::TComponent* AOwner);
	sockaddr_in __fastcall GetSocketAddr(TSocketHost h, TSocketPort p);
	TSocketHost __fastcall LookupHostName(const System::AnsiString ipaddr);
	TSocketHost __fastcall LookupHostAddr(const System::AnsiString hn);
	System::Word __fastcall LookupPort(const System::AnsiString sn, char * pn = (char *)(0x0));
	System::Word __fastcall LookupProtocol(const System::AnsiString pn);
	System::AnsiString __fastcall LocalDomainName(void);
	TSocketHost __fastcall LocalHostName(void);
	TSocketHost __fastcall LocalHostAddr(void);
	int __fastcall ReceiveFrom(void *buf, int bufsize, sockaddr_in &FromAddr, int &len, int flags = 0x0);
	int __fastcall SendTo(void *buf, int bufsize, const sockaddr_in &ToAddr, int flags = 0x0);
	__property TSocketHost LocalHost = {read=FLocalHost, write=SetLocalHost};
	__property TSocketPort LocalPort = {read=FLocalPort, write=SetLocalPort};
	__property TSocketHost RemoteHost = {read=FRemoteHost, write=SetRemoteHost};
	__property TSocketPort RemotePort = {read=FRemotePort, write=SetRemotePort};
	__property Domain = {default=2};
public:
	/* TBaseSocket.Destroy */ inline __fastcall virtual ~TIpSocket(void) { }
	
};

#if !defined(__CPP__) && !defined(__clang__)
#if sizeof(TIpSocket) < 144
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TIpSocket) < (Pascal) [size: 144, align: 8] (WARNING)"
	#pragma sizeof(TIpSocket)
#endif  // sizeof(TIpSocket)
#if sizeof(TIpSocket) > 144
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TIpSocket) > (Pascal) [size: 144, align: 8] (WARNING)"
	#pragma sizeof(TIpSocket)
#endif  // sizeof(TIpSocket)
#endif  // !__CPP__ && !__clang__


class DELPHICLASS TCustomIpClient;
class DELPHICLASS TClientSocketThread;
class PASCALIMPLEMENTATION TCustomIpClient : public TIpSocket
{
	typedef TIpSocket inherited;
	
private:
	bool FConnected;
	TSocketNotifyEvent FOnConnect;
	TSocketNotifyEvent FOnDisconnect;
	
protected:
	virtual void __fastcall DoConnect(void);
	virtual void __fastcall DoDisconnect(void);
	
public:
	__fastcall virtual TCustomIpClient(System::Classes::TComponent* AOwner);
	virtual void __fastcall Open(void);
	virtual void __fastcall Close(void);
	bool __fastcall Connect(void);
	void __fastcall Disconnect(void);
	TClientSocketThread* __fastcall GetThreadObject(void);
	__property bool Connected = {read=FConnected, nodefault};
	__property TSocketNotifyEvent OnConnect = {read=FOnConnect, write=FOnConnect};
	__property TSocketNotifyEvent OnDisconnect = {read=FOnDisconnect, write=FOnDisconnect};
public:
	/* TBaseSocket.Destroy */ inline __fastcall virtual ~TCustomIpClient(void) { }
	
};

#if !defined(__CPP__) && !defined(__clang__)
#if sizeof(TCustomIpClient) < 168
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TCustomIpClient) < (Pascal) [size: 168, align: 8] (WARNING)"
	#pragma sizeof(TCustomIpClient)
#endif  // sizeof(TCustomIpClient)
#if sizeof(TCustomIpClient) > 168
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TCustomIpClient) > (Pascal) [size: 168, align: 8] (WARNING)"
	#pragma sizeof(TCustomIpClient)
#endif  // sizeof(TCustomIpClient)
#endif  // !__CPP__ && !__clang__


class DELPHICLASS TRawSocket;
class PASCALIMPLEMENTATION TRawSocket : public TIpSocket
{
	typedef TIpSocket inherited;
	
public:
	__fastcall virtual TRawSocket(System::Classes::TComponent* AOwner);
	__property SockType = {default=2};
public:
	/* TBaseSocket.Destroy */ inline __fastcall virtual ~TRawSocket(void) { }
	
};

#if !defined(__CPP__) && !defined(__clang__)
#if sizeof(TRawSocket) < 144
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TRawSocket) < (Pascal) [size: 144, align: 8] (WARNING)"
	#pragma sizeof(TRawSocket)
#endif  // sizeof(TRawSocket)
#if sizeof(TRawSocket) > 144
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TRawSocket) > (Pascal) [size: 144, align: 8] (WARNING)"
	#pragma sizeof(TRawSocket)
#endif  // sizeof(TRawSocket)
#endif  // !__CPP__ && !__clang__


class DELPHICLASS TUdpSocket;
class PASCALIMPLEMENTATION TUdpSocket : public TCustomIpClient
{
	typedef TCustomIpClient inherited;
	
public:
	__fastcall virtual TUdpSocket(System::Classes::TComponent* AOwner);
	
__published:
	__property Active = {default=0};
	__property BlockMode = {default=0};
	__property LocalHost = {default=0};
	__property LocalPort = {default=0};
	__property RemoteHost = {default=0};
	__property RemotePort = {default=0};
	__property OnCreateHandle;
	__property OnDestroyHandle;
	__property OnConnect;
	__property OnDisconnect;
	__property OnReceive;
	__property OnSend;
	__property OnError;
public:
	/* TBaseSocket.Destroy */ inline __fastcall virtual ~TUdpSocket(void) { }
	
};

#if !defined(__CPP__) && !defined(__clang__)
#if sizeof(TUdpSocket) < 168
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TUdpSocket) < (Pascal) [size: 168, align: 8] (WARNING)"
	#pragma sizeof(TUdpSocket)
#endif  // sizeof(TUdpSocket)
#if sizeof(TUdpSocket) > 168
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TUdpSocket) > (Pascal) [size: 168, align: 8] (WARNING)"
	#pragma sizeof(TUdpSocket)
#endif  // sizeof(TUdpSocket)
#endif  // !__CPP__ && !__clang__


class DELPHICLASS TTcpClient;
class PASCALIMPLEMENTATION TTcpClient : public TCustomIpClient
{
	typedef TCustomIpClient inherited;
	
__published:
	__property Active = {default=0};
	__property BlockMode = {default=0};
	__property Connected;
	__property RemoteHost = {default=0};
	__property RemotePort = {default=0};
	__property OnCreateHandle;
	__property OnDestroyHandle;
	__property OnConnect;
	__property OnDisconnect;
	__property OnReceive;
	__property OnSend;
	__property OnError;
public:
	/* TCustomIpClient.Create */ inline __fastcall virtual TTcpClient(System::Classes::TComponent* AOwner) : TCustomIpClient(AOwner) { }
	
public:
	/* TBaseSocket.Destroy */ inline __fastcall virtual ~TTcpClient(void) { }
	
};

#if !defined(__CPP__) && !defined(__clang__)
#if sizeof(TTcpClient) < 168
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TTcpClient) < (Pascal) [size: 168, align: 8] (WARNING)"
	#pragma sizeof(TTcpClient)
#endif  // sizeof(TTcpClient)
#if sizeof(TTcpClient) > 168
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TTcpClient) > (Pascal) [size: 168, align: 8] (WARNING)"
	#pragma sizeof(TTcpClient)
#endif  // sizeof(TTcpClient)
#endif  // !__CPP__ && !__clang__


class DELPHICLASS TServerSocketThread;
class PASCALIMPLEMENTATION TClientSocketThread : public System::Classes::TThread
{
	typedef System::Classes::TThread inherited;
	
private:
	TCustomIpClient* FClientSocket;
	TServerSocketThread* FServerSocketThread;
	
protected:
	virtual void __fastcall SyncProc(void);
	
public:
	__fastcall TClientSocketThread(TServerSocketThread* ServerSocketThread);
	__fastcall virtual ~TClientSocketThread(void);
	virtual void __fastcall Execute(void);
	void __fastcall ExecuteSyncProc(void);
	__property TCustomIpClient* ClientSocket = {read=FClientSocket};
	__property TServerSocketThread* ServerSocketThread = {read=FServerSocketThread};
};

#if !defined(__CPP__) && !defined(__clang__)
#if sizeof(TClientSocketThread) < 72
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TClientSocketThread) < (Pascal) [size: 72, align: 8] (WARNING)"
	#pragma sizeof(TClientSocketThread)
#endif  // sizeof(TClientSocketThread)
#if sizeof(TClientSocketThread) > 72
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TClientSocketThread) > (Pascal) [size: 72, align: 8] (WARNING)"
	#pragma sizeof(TClientSocketThread)
#endif  // sizeof(TClientSocketThread)
#endif  // !__CPP__ && !__clang__


typedef void __fastcall (__closure *TGetThreadEvent)(System::TObject* Sender, TClientSocketThread* &ClientSocketThread);

class DELPHICLASS TCustomTcpServer;
class PASCALIMPLEMENTATION TServerSocketThread : public System::Classes::TThread
{
	typedef System::Classes::TThread inherited;
	
private:
	int FPoolIndex;
	TCustomTcpServer* FServerSocket;
	int FThreadCacheSize;
	System::Classes::TList* FThreadPool;
	TGetThreadEvent FOnGetThread;
	void __fastcall SetThreadCacheSize(int Value);
	
protected:
	TClientSocketThread* __fastcall AddClientSocketThread(void);
	virtual TClientSocketThread* __fastcall CreateThread(void);
	TClientSocketThread* __fastcall FetchClientSocketThread(void);
	void __fastcall RemoveClientSocketThread(TClientSocketThread* ClientSocketThread);
	
public:
	__fastcall TServerSocketThread(TCustomTcpServer* AServerSocket);
	__fastcall virtual ~TServerSocketThread(void);
	void __fastcall ClearThreadPool(void);
	virtual void __fastcall Execute(void);
	__property TCustomTcpServer* ServerSocket = {read=FServerSocket};
	__property int ThreadCacheSize = {read=FThreadCacheSize, write=SetThreadCacheSize, default=10};
	__property System::Classes::TList* ThreadPool = {read=FThreadPool};
	__property TGetThreadEvent OnGetThread = {read=FOnGetThread, write=FOnGetThread};
};

#if !defined(__CPP__) && !defined(__clang__)
#if sizeof(TServerSocketThread) < 88
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TServerSocketThread) < (Pascal) [size: 88, align: 8] (WARNING)"
	#pragma sizeof(TServerSocketThread)
#endif  // sizeof(TServerSocketThread)
#if sizeof(TServerSocketThread) > 88
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TServerSocketThread) > (Pascal) [size: 88, align: 8] (WARNING)"
	#pragma sizeof(TServerSocketThread)
#endif  // sizeof(TServerSocketThread)
#endif  // !__CPP__ && !__clang__


typedef void __fastcall (__closure *TSocketAcceptEvent)(System::TObject* Sender, TCustomIpClient* ClientSocket);

class PASCALIMPLEMENTATION TCustomTcpServer : public TIpSocket
{
	typedef TIpSocket inherited;
	
private:
	TServerSocketBlockMode FServerBlockMode;
	bool FListening;
	TServerSocketThread* FServerSocketThread;
	TSocketAcceptEvent FOnAccept;
	TGetThreadEvent FOnGetThread;
	System::Classes::TNotifyEvent FOnListening;
	void __fastcall GetThread(System::TObject* Sender, TClientSocketThread* &ClientSocketThread);
	TServerSocketThread* __fastcall GetServerSocketThread(void);
	void __fastcall SetServerSocketThread(TServerSocketThread* Value);
	void __fastcall SetServerBlockMode(TServerSocketBlockMode Value);
	
protected:
	virtual void __fastcall DoAccept(TCustomIpClient* ClientSocket);
	bool __fastcall Listen(int backlog = 0x5);
	
public:
	__fastcall virtual TCustomTcpServer(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TCustomTcpServer(void);
	virtual void __fastcall Open(void);
	virtual void __fastcall Close(void);
	bool __fastcall Accept(void)/* overload */;
	bool __fastcall Accept(TCustomIpClient* &ClientSocket)/* overload */;
	bool __fastcall WaitForConnection(void);
	__property TServerSocketBlockMode BlockMode = {read=FServerBlockMode, write=SetServerBlockMode, default=2};
	__property bool Listening = {read=FListening, nodefault};
	__property TServerSocketThread* ServerSocketThread = {read=GetServerSocketThread, write=SetServerSocketThread};
	__property TSocketAcceptEvent OnAccept = {read=FOnAccept, write=FOnAccept};
	__property TGetThreadEvent OnGetThread = {read=FOnGetThread, write=FOnGetThread};
	__property System::Classes::TNotifyEvent OnListening = {read=FOnListening, write=FOnListening};
};

#if !defined(__CPP__) && !defined(__clang__)
#if sizeof(TCustomTcpServer) < 176
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TCustomTcpServer) < (Pascal) [size: 176, align: 8] (WARNING)"
	#pragma sizeof(TCustomTcpServer)
#endif  // sizeof(TCustomTcpServer)
#if sizeof(TCustomTcpServer) > 176
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TCustomTcpServer) > (Pascal) [size: 176, align: 8] (WARNING)"
	#pragma sizeof(TCustomTcpServer)
#endif  // sizeof(TCustomTcpServer)
#endif  // !__CPP__ && !__clang__


class DELPHICLASS TTcpServer;
class PASCALIMPLEMENTATION TTcpServer : public TCustomTcpServer
{
	typedef TCustomTcpServer inherited;
	
__published:
	__property Active = {default=0};
	__property BlockMode = {default=2};
	__property LocalHost = {default=0};
	__property LocalPort = {default=0};
	__property OnAccept;
	__property OnGetThread;
	__property OnListening;
	__property OnCreateHandle;
	__property OnDestroyHandle;
public:
	/* TCustomTcpServer.Create */ inline __fastcall virtual TTcpServer(System::Classes::TComponent* AOwner) : TCustomTcpServer(AOwner) { }
	/* TCustomTcpServer.Destroy */ inline __fastcall virtual ~TTcpServer(void) { }
	
};

#if !defined(__CPP__) && !defined(__clang__)
#if sizeof(TTcpServer) < 176
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TTcpServer) < (Pascal) [size: 176, align: 8] (WARNING)"
	#pragma sizeof(TTcpServer)
#endif  // sizeof(TTcpServer)
#if sizeof(TTcpServer) > 176
	#pragma message "Pascal/C++ size mismatch: (C++) sizeof(TTcpServer) > (Pascal) [size: 176, align: 8] (WARNING)"
	#pragma sizeof(TTcpServer)
#endif  // sizeof(TTcpServer)
#endif  // !__CPP__ && !__clang__


//-- var, const, procedure ---------------------------------------------------
#define CRLF L"\r\n"
}	/* namespace Sockets */
}	/* namespace Win */
}	/* namespace Web */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_WEB_WIN_SOCKETS)
using namespace Web::Win::Sockets;
#endif
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_WEB_WIN)
using namespace Web::Win;
#endif
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_WEB)
using namespace Web;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Web_Win_SocketsHPP
