//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit TransformStream;

interface

uses
  Classes;

type
  TTransformWordCallback = reference to function(const AValue: string; var ACancel: Boolean): string;
  TTransformingWordCallback = reference to procedure(const AValue, ATransformedValue: string; var ACancel: Boolean);

function TransformWordsInStream(AStream: TStream; ACallBack: TTransformWordCallback): TStream;
function ReverseWordsInStream(AStream: TStream; ACallBack: TTransformingWordCallback): TStream;

implementation

uses
  CopyPrsr,
  SysUtils,
  StrUtils;

function TransformWordsInStream(AStream: TStream; ACallBack: TTransformWordCallback): TStream;
var
  LParser: TCopyParser;
  LTransformedString: AnsiString;
  LResultStream: TMemoryStream;
  LCancel: Boolean;
begin
  Result := nil;
  LCancel := False;
  if AStream = nil then
    raise Exception.Create('Argument is null');
  if (AStream <> nil) then
  begin
    LResultStream := TMemoryStream.Create;
    try
      LParser := TCopyParser.Create(AStream, LResultStream);
      try
        while not(LParser.Token in [toEOF]) do
        begin
          if not (LParser.Token in ['.', ',', ';', ':', '-', '?', '!']) then
          begin
            // Assumes default string.  TODO: Support UTF-8
            LTransformedString := AnsiString(ACallBack(string(LParser.TokenString), LCancel));
            if LCancel then
            begin
              LParser.CopyToEOF;
              break;
            end;
            LResultStream.WriteBuffer(LTransformedString[1], Length(LTransformedString));
          end
          else
          begin
            LParser.CopyTokenToOutput;
          end;
          LParser.SkipToken(true);
        end;
      finally
        LParser.Free;
      end;
    except
      LResultStream.Free;
      raise;
    end;
    LResultStream.Seek(0, TSeekOrigin.soBeginning);
    Result := LResultStream;
  end;
end;

function ReverseWordsInStream(AStream: TStream; ACallBack: TTransformingWordCallback): TStream;
begin
  Result := TransformWordsInStream(AStream,
    function(const AValue: string; var ACancel: Boolean): string
    begin
       Result := StrUtils.ReverseString(AValue);
       ACallBack(AValue, Result, ACancel);
    end
    );

end;

end.
