//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit DSUtils;

interface

uses
  Classes,
  DbxDatasnap,
  System.JSON,
  DBXJson;

type
  TDSCallbackMethod = reference to function(const Args: TJSONValue): TJSONValue;
  TDSCallbackWithMethod = class(TDBXCallback)
  private
    FCallbackMethod: TDSCallbackMethod;
  public
    constructor Create(ACallbackMethod: TDSCallbackMethod);
    function Execute(const Args: TJSONValue): TJSONValue; override;
  end;

implementation

constructor TDSCallbackWithMethod.Create(ACallbackMethod: TDSCallbackMethod);
begin
  FCallbackMethod := ACallbackMethod;
end;

function TDSCallbackWithMethod.Execute(const Args: TJSONValue): TJSONValue;
begin
  Assert(Assigned(FCallbackMethod));
  Result := FCallbackMethod(Args);
end;

end.

