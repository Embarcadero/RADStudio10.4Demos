//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit ReverseStringServerMethods;

interface

uses
  SysUtils, Classes, DSServer, System.JSON, Data.DBXJSON;

type
{$METHODINFO ON}
  TServerMethods = class(TPersistent)
  private
    { Private declarations }
  public
    { Public declarations }
    function ReverseString(AValue: string): string;
    function TransformString(const AValue: string): TJSONObject;
    function ReverseWordsInStream(ACallback: TDBXCallback; AStream: TStream): TStream;
  end;
{$METHODINFO OFF}

implementation

uses StrUtils, TransformStream;


function TServerMethods.ReverseWordsInStream(ACallback: TDBXCallback; AStream: TStream): TStream;
var
  LTransformingWordCallback: TTransformingWordCallback;
begin

  LTransformingWordCallback :=
    procedure(const AValue, ATransformedValue: string; var ACancel: Boolean)
    var
      LCallbackValue: TJSONObject;
      LCallbackReturnValue: TJSONValue;
    begin
      // Create a json object describing the string being reversed
      LCallbackValue := TJSONObject.Create;
      LCallbackValue.AddPair(TJSONPair.Create('Original', AValue));
      LCallbackValue.AddPair(TJSONPair.Create('Reverse', ATransformedValue));

      // Execute the DataSnap client callback
      LCallbackReturnValue := ACallback.Execute(LCallbackValue);

      // If then DataSnap client callback returns false, then stop reversing strings
      ACancel := LCallbackReturnValue is TJSONFalse;
      LCallbackReturnValue.Free;
    end;

  Result := TransformStream.ReverseWordsInStream(AStream, LTransformingWordCallback);
end;

function TServerMethods.ReverseString(AValue: string): string;
begin
  Result := StrUtils.ReverseString(AValue);
end;

function TServerMethods.TransformString(const AValue: string): TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.AddPair(TJSONPair.Create('Original', AValue));
  Result.AddPair(TJSONPair.Create('Upper', UpperCase(AValue)));
  Result.AddPair(TJSONPair.Create('Lower', LowerCase(AValue)));
  Result.AddPair(TJSONPair.Create('Reverse', ReverseString(AValue)));
end;

end.




