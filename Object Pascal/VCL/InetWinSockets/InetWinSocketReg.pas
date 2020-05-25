//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit InetWinSocketReg;

interface

procedure Register;

implementation

uses
  DesignIntf, SocketsEditor, System.Classes, Web.Win.Sockets;

resourcestring
  sInternet = 'Internet';

procedure Register;
begin
  RegisterComponents(sInternet, [TTcpClient, TTcpServer, TUdpSocket]);
  // Sockets property editors
  RegisterPropertyEditor(TypeInfo(TSocketPort), TIpSocket, 'Port', TSocketPortProperty);
end;

end.
