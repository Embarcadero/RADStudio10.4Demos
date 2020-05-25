//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit MonitorServerMethods;

interface

uses
  SysUtils, Classes, DSServer, DSAuth;

type
{$METHODINFO ON}
  TServerConnMonitorMethods = class(TComponent)
  public
    function ReverseString(Value: string): string;
  end;
{$METHODINFO OFF}

implementation

uses StrUtils;

function TServerConnMonitorMethods.ReverseString(Value: string): string;
begin
  Result := StrUtils.ReverseString(Value);
end;
end.

