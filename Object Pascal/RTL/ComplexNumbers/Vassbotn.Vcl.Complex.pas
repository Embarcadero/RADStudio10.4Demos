//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Vassbotn.Vcl.Complex;

interface

uses
  Types, Variants, SysUtils, Math;

{$IFNDEF CIL}
type
  IFormatProvider = ^TFormatSettings;
  DateTime = TDateTime;
  Int16 = smallint;
  SByte = shortint;
  // These should be moved to RTLConsts
resourcestring
  SCouldNotParseImaginary = 'Could not parse imaginary portion';
  SCouldNotParseSymbol = 'Could not parse required ''%s'' symbol';
  SCouldNotParsePlus = 'Could not parse required ''+'' (or ''-'') symbol';
  SCouldNotParseReal = 'Could not parse real portion';
  SUnexpectedChars = 'Unexpected characters';
  SErrorSuffix = '%s [%s<?>%s]';
  SImaginaryNotZero = 'Could not simplify, imaginary part is non-zero [%s]';
{$ENDIF}

type
  TComplex = packed record{$IFDEF CIL}(IComparable, IConvertible){$ENDIF}
  strict private
  // No record class constructors in Win32 (yet)
{$IFDEF CIL}    class constructor Create; {$ENDIF}
    procedure Defuzz;
  private
    class procedure Init; static;
  public
    var
      Real, Imaginary: Double;
    class var
      Symbol: string;                 // defaults to 'i'
      SymbolBeforeImaginary: Boolean; // defaults to false
      DefuzzAtZero: Boolean;          // defaults to true

    class function From(const AReal: Double): TComplex; overload; static;
    class function From(const AReal, AImaginary: Double): TComplex; overload; static;
{$IFDEF CIL}
    class function FromObject(AObject: TObject): TComplex; static;
{$ENDIF}

    class function FromPolar(const AModulus, APhase: Double): TComplex; static;
    function Modulus: Double;
    function Phase: Double;

    class function One: TComplex; static;
    class function Neg: TComplex; static;
    class function OneI: TComplex; static;
    class function NegI: TComplex; static;
    class function HalfPi: TComplex; static;
    class function Zero: TComplex; static;
    function IsZero: Boolean; overload;

    class function ComplexInfinity: TComplex; static;
    class function PositiveInfinity: TComplex; static;
    class function NegativeInfinity: TComplex; static;

    function IsInfinite: Boolean; overload;
    function IsComplexInfinite: Boolean;
    function IsNaN: Boolean; overload;

    class procedure AssertImaginaryIsZero(const AValue: TComplex); static;

    class function Abs(const AValue: TComplex): Double; overload; static;
    class function AbsSqr(const AValue: TComplex): Double; overload; static;
    class function Angle(const AValue: TComplex): Double; overload; static;

    class function Sign(const AValue: TComplex): TComplex; overload; static;
    class function Conjugate(const AValue: TComplex): TComplex; overload; static;
    class function Inverse(const AValue: TComplex): TComplex; overload; static;
    class function Exp(const AValue: TComplex): TComplex; overload; static;
    class function Ln(const AValue: TComplex): TComplex; overload; static;
    class function Log10(const AValue: TComplex): TComplex; overload; static;
    class function Log2(const AValue: TComplex): TComplex; overload; static;
    class function LogN(const AValue: TComplex; const X: Double): TComplex; overload; static;
    class function Sqr(const AValue: TComplex): TComplex; overload; static;
    class function Sqrt(const AValue: TComplex): TComplex; overload; static;
    class function Power(const AValue, APower: TComplex): TComplex; overload; static;

    class function Cos(const AValue: TComplex): TComplex; overload; static;
    class function Sin(const AValue: TComplex): TComplex; overload; static;
    class function Tan(const AValue: TComplex): TComplex; overload; static;
    class function Cot(const AValue: TComplex): TComplex; overload; static;
    class function Csc(const AValue: TComplex): TComplex; overload; static;
    class function Sec(const AValue: TComplex): TComplex; overload; static;
    class function ArcCos(const AValue: TComplex): TComplex; overload; static;
    class function ArcSin(const AValue: TComplex): TComplex; overload; static;
    class function ArcTan(const AValue: TComplex): TComplex; overload; static;
    class function ArcCot(const AValue: TComplex): TComplex; overload; static;
    class function ArcCsc(const AValue: TComplex): TComplex; overload; static;
    class function ArcSec(const AValue: TComplex): TComplex; overload; static;
    class function CosH(const AValue: TComplex): TComplex; overload; static;
    class function SinH(const AValue: TComplex): TComplex; overload; static;
    class function TanH(const AValue: TComplex): TComplex; overload; static;
    class function CotH(const AValue: TComplex): TComplex; overload; static;
    class function CscH(const AValue: TComplex): TComplex; overload; static;
    class function SecH(const AValue: TComplex): TComplex; overload; static;
    class function ArcCosH(const AValue: TComplex): TComplex; overload; static;
    class function ArcSinH(const AValue: TComplex): TComplex; overload; static;
    class function ArcTanH(const AValue: TComplex): TComplex; overload; static;
    class function ArcCotH(const AValue: TComplex): TComplex; overload; static;
    class function ArcCscH(const AValue: TComplex): TComplex; overload; static;
    class function ArcSecH(const AValue: TComplex): TComplex; overload; static;

    class function Parse(const AText: string): TComplex; overload; static;
    class function Parse(const AText: string; const AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): TComplex; overload; static;

    function ToString: System.String; overload; {$IFDEF CIL}override;{$ENDIF}

    class function Compare(const Left, Right: TComplex): Integer; static;
    class function Equals(const Left, Right: TComplex): Boolean; overload; static;
{$IFDEF CIL}
    function Equals(AValue: TObject): Boolean; override;
{$ENDIF}

    class operator Round(const AValue: TComplex): Int64;
    class operator Trunc(const AValue: TComplex): Int64;

    class operator Equal(const Left, Right: TComplex): Boolean;
    class operator NotEqual(const Left, Right: TComplex): Boolean;
    class operator LessThan(const Left, Right: TComplex): Boolean;
    class operator LessThanOrEqual(const Left, Right: TComplex): Boolean;
    class operator GreaterThan(const Left, Right: TComplex): Boolean;
    class operator GreaterThanOrEqual(const Left, Right: TComplex): Boolean;

    class operator Add(const Left, Right: TComplex): TComplex;
    class operator Subtract(const Left, Right: TComplex): TComplex;
    class operator Multiply(const Left, Right: TComplex): TComplex;
    class operator Divide(const Left, Right: TComplex): TComplex;
    class operator Negative(const AValue: TComplex): TComplex;

    // Note: currently Implicit operators work like Explicit operators in Win32,
    // i.e. they need an explicit type-cast
    class operator Implicit(const AValue: Double): TComplex;
    class operator Implicit(const AValue: Integer): TComplex;
    class operator Implicit(const AValue: Int64): TComplex;
    class operator Implicit(const AValue: Variant): TComplex;

    class operator Explicit(const AValue: TComplex): Double;
    class operator Explicit(const AValue: TComplex): Integer;
    class operator Explicit(const AValue: TComplex): Int64;

{$IFDEF CIL}
    // IComparable
    function CompareTo(Right: TObject): Integer;

    // IConvertible
    function GetTypeCode: TypeCode;
{$ENDIF}
    function ToBoolean(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Boolean;
    function ToByte(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Byte;
    function ToChar(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Char;
    function ToDateTime(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): DateTime;
{$IFDEF CIL}    function ToDecimal(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Decimal; {$ENDIF}
    function ToDouble(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Double;
    function ToInt16(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Int16;
    function ToInt32(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Integer;
    function ToInt64(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Int64;
    function ToSByte(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): SByte;
    function ToSingle(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Single;
    function ToString(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): String; overload;
{$IFDEF CIL}    function ToType(AType: System.Type; AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): TObject;{$ENDIF}
    function ToUInt16(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Word;
    function ToUInt32(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): LongWord;
    function ToUInt64(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): UInt64;
  end;

function IsNan(const AValue: TComplex): Boolean; overload;
function IsInfinite(const AValue: TComplex): Boolean; overload;

function SameValue(const Left, Right: TComplex): Boolean; overload;
function IsZero(const AValue: TComplex): Boolean; overload;

function Abs(const AValue: TComplex): Double; overload;
function AbsSqr(const AValue: TComplex): Double; overload;
function Angle(const AValue: TComplex): Double; overload;

function Frac(const AValue: TComplex): Double; overload;
function Int(const AValue: TComplex): Double; overload;
function Sign(const AValue: TComplex): TComplex; overload;
function Exp(const AValue: TComplex): TComplex; overload;
function Ln(const AValue: TComplex): TComplex; overload;
function Log10(const AValue: TComplex): TComplex; overload;
function Log2(const AValue: TComplex): TComplex; overload;
function LogN(const AValue: TComplex; const X: Double): TComplex; overload;
function Sqr(const AValue: TComplex): TComplex; overload;
function Sqrt(const AValue: TComplex): TComplex; overload;
function Power(const AValue, APower: TComplex): TComplex; overload;

function Cos(const AValue: TComplex): TComplex; overload;
function Sin(const AValue: TComplex): TComplex; overload;
function Tan(const AValue: TComplex): TComplex; overload;
function Cot(const AValue: TComplex): TComplex; overload;
function Csc(const AValue: TComplex): TComplex; overload;
function Sec(const AValue: TComplex): TComplex; overload;
function ArcCos(const AValue: TComplex): TComplex; overload;
function ArcSin(const AValue: TComplex): TComplex; overload;
function ArcTan(const AValue: TComplex): TComplex; overload;
function ArcCot(const AValue: TComplex): TComplex; overload;
function ArcCsc(const AValue: TComplex): TComplex; overload;
function ArcSec(const AValue: TComplex): TComplex; overload;
function CosH(const AValue: TComplex): TComplex; overload;
function SinH(const AValue: TComplex): TComplex; overload;
function TanH(const AValue: TComplex): TComplex; overload;
function CotH(const AValue: TComplex): TComplex; overload;
function CscH(const AValue: TComplex): TComplex; overload;
function SecH(const AValue: TComplex): TComplex; overload;
function ArcCosH(const AValue: TComplex): TComplex; overload;
function ArcSinH(const AValue: TComplex): TComplex; overload;
function ArcTanH(const AValue: TComplex): TComplex; overload;
function ArcCotH(const AValue: TComplex): TComplex; overload;
function ArcCscH(const AValue: TComplex): TComplex; overload;
function ArcSecH(const AValue: TComplex): TComplex; overload;

function Cotan(const AValue: TComplex): TComplex; overload;
function Secant(const AValue: TComplex): TComplex; overload;
function Cosecant(const AValue: TComplex): TComplex; overload;

implementation

{$RANGECHECKS ON}
{$OVERFLOWCHECKS ON}
{$FINITEFLOAT ON}

uses
  SysConst, RTLConsts;

{$IFNDEF CIL}
procedure ZeroDivideError;
begin
  raise EZeroDivide.Create(SDivByZero);
end;

function FloatToStr(Value: Extended; AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): string;
begin
  if Assigned(AProvider)
  then Result := SysUtils.FloatToStr(Value, AProvider^)
  else Result := SysUtils.FloatToStr(Value);
end;
{$ENDIF}

{$IFDEF CIL}
class constructor TComplex.Create;
begin
  TComplex.Init;
end;
{$ENDIF}

class procedure TComplex.Init;
begin
  Symbol := 'i';
  SymbolBeforeImaginary := False;
  DefuzzAtZero := True;
end;

function TComplex.Modulus: Double;
begin
  Result := {$IFDEF CIL}Borland.Delphi.{$ENDIF}(Real * Real + Imaginary * Imaginary);
end;

function TComplex.Phase: Double;
begin
  Result := ArcTan2(Imaginary, Real);
end;

class function TComplex.From(const AReal: Double): TComplex;
begin
  Result.Real := AReal;
  Result.Imaginary := 0;
  if DefuzzAtZero then
    Result.Defuzz;
end;

class function TComplex.From(const AReal, AImaginary: Double): TComplex;
begin
  Result.Real := AReal;
  Result.Imaginary := AImaginary;
  if DefuzzAtZero then
    Result.Defuzz;
end;

{$IFDEF CIL}
class function TComplex.FromObject(AObject: TObject): TComplex;
begin
  if AObject = nil then
    Result := Zero
  else if AObject is TComplex then
    Result := TComplex(AObject)
  else
    try
      Result := Parse(String(Variant(AObject)));
    except
      Result := From(Double(Variant(AObject)));
    end;
end;
{$ENDIF}

procedure TComplex.Defuzz;
begin
  if Math.IsZero(Real) then
    Real := 0;
  if Math.IsZero(Imaginary) then
    Imaginary := 0;
end;

class function TComplex.FromPolar(const AModulus, APhase: Double): TComplex;
begin
  Result := TComplex.From(
    AModulus * {$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Cos(APhase),
    AModulus * {$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Sin(APhase));
end;

class function TComplex.One: TComplex;
begin
  Result.Real := 1;
  Result.Imaginary := 0;
end;

class function TComplex.Neg: TComplex;
begin
  Result.Real := -1;
  Result.Imaginary := 0;
end;

class function TComplex.OneI: TComplex;
begin
  Result.Real := 0;
  Result.Imaginary := 1;
end;

class function TComplex.NegI: TComplex;
begin
  Result.Real := 0;
  Result.Imaginary := -1;
end;

class function TComplex.HalfPi: TComplex;
begin
  Result.Real := PI / 2;
  Result.Imaginary := 0;
end;

class function TComplex.Zero: TComplex;
begin
  Result.Real := 0;
  Result.Imaginary := 0;
end;

function TComplex.IsZero: Boolean;
begin
  Result := Math.IsZero(Real) and Math.IsZero(Imaginary);
end;


class function TComplex.ComplexInfinity: TComplex;
begin

  Result := TComplex.From(NaN, NaN);
end;

class function TComplex.PositiveInfinity: TComplex;
begin
  Result := TComplex.From(Math.Infinity, 0);
end;

class function TComplex.NegativeInfinity: TComplex;
begin
  Result := TComplex.From(Math.NegInfinity, 0);
end;

function TComplex.IsInfinite: Boolean;
begin
  Result := Math.IsInfinite(Real) or Math.IsInfinite(Imaginary);
end;

function TComplex.IsComplexInfinite: Boolean;
begin
                                                  
  Result := Math.IsNaN(Real) and Math.IsNaN(Imaginary);
end;

function TComplex.IsNaN: Boolean;
begin
  Result := Math.IsNaN(Real) xor Math.IsNaN(Imaginary);
end;

//==============================================================================
class procedure TComplex.AssertImaginaryIsZero(const AValue: TComplex);
begin
  if not Math.IsZero(AValue.Imaginary) then
    raise EConvertError.CreateFmt(SImaginaryNotZero, [AValue.ToString(nil)]);
end;


//==============================================================================
class function TComplex.Abs(const AValue: TComplex): Double;
begin
  Result := {$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Sqrt(AbsSqr(AValue));
end;

class function TComplex.AbsSqr(const AValue: TComplex): Double;
begin
  Result := AValue.Modulus;
end;

class function TComplex.Angle(const AValue: TComplex): Double;
begin
  Result := AValue.Phase;
end;


class function TComplex.Sign(const AValue: TComplex): TComplex;
begin
  with AValue do
    if IsZero then
      Result := Zero
    else
      Result := AValue / Sqrt(From(AbsSqr(AValue), 0));
end;

class function TComplex.Conjugate(const AValue: TComplex): TComplex;
begin
  with AValue do
    Result := From(Real, -Imaginary);
end;

class function TComplex.Inverse(const AValue: TComplex): TComplex;
var
  LDenominator: Double;
begin
  with AValue do
  begin
    LDenominator := AbsSqr(AValue);
    if Math.IsZero(LDenominator) then
      ZeroDivideError;
    Result := From(Real / LDenominator, -(Imaginary / LDenominator));
  end;
end;

class function TComplex.Exp(const AValue: TComplex): TComplex;
var
  LExp: Double;
begin
  with AValue do
  begin
    LExp := {$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Exp(Real);
    Result := From(LExp * {$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Cos(Imaginary),
                   LExp * {$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Sin(Imaginary));
  end;
end;

class function TComplex.Ln(const AValue: TComplex): TComplex;
begin
  with AValue do
    if IsZero then
      Result := NegativeInfinity
    else
      Result := From({$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Ln(Modulus), Phase);
end;

class function TComplex.Log10(const AValue: TComplex): TComplex;
begin
  with AValue do
    if IsZero then
      Result := NegativeInfinity
    else
      Result := From({$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Ln(Modulus), Phase) /
                From({$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Ln(10), 0);
end;

class function TComplex.Log2(const AValue: TComplex): TComplex;
begin
  with AValue do
    if IsZero then
      Result := NegativeInfinity
    else
      Result := From({$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Ln(Modulus), Phase) /
                From({$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Ln(2), 0);
end;

class function TComplex.LogN(const AValue: TComplex; const X: Double): TComplex;
begin
  with AValue do
    if IsZero and (X > 0) and (X <> 1) then
      Result := NegativeInfinity
    else
      Result := From({$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Ln(Modulus), Phase) /
                Ln(From(X, 0));
end;

class function TComplex.Sqr(const AValue: TComplex): TComplex;
begin
  with AValue do
    Result := From((Real * Real) - (Imaginary * Imaginary),
                   (Real * Imaginary) + (Imaginary * Real));
end;

class function TComplex.Sqrt(const AValue: TComplex): TComplex;
var
  LValue: Double;
begin
  with AValue do
    if IsZero then
      Result := AValue
    else if Real > 0 then
    begin
      LValue := Abs(AValue) + Real;
      Result := From({$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Sqrt(LValue / 2),
                     Imaginary / {$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Sqrt(LValue * 2));
    end
    else
    begin
      LValue := Abs(AValue) - Real;
      if Imaginary < 0 then
        Result := From({$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Abs(Imaginary) / {$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Sqrt(LValue * 2),
                       -{$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Sqrt(LValue / 2))
      else
        Result := From({$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Abs(Imaginary) / {$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Sqrt(LValue * 2),
                       {$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Sqrt(LValue / 2));
    end;
end;

class function TComplex.Power(const AValue, APower: TComplex): TComplex;
begin
  with AValue do
    if Math.IsZero(AbsSqr(AValue)) then
      if Math.IsZero(AbsSqr(APower)) then
        Result := One
      else
        Result := Zero
    else
      Result := Exp(Ln(AValue) * APower);
end;


class function TComplex.Cos(const AValue: TComplex): TComplex;
begin
  with AValue do
    Result := From({$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Cos(Real) * Math.CosH(Imaginary),
                   -{$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Sin(Real) * Math.SinH(Imaginary));
end;

class function TComplex.Sin(const AValue: TComplex): TComplex;
begin
  with AValue do
    Result := From({$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Sin(Real) * Math.CosH(Imaginary),
                   {$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Cos(Real) * Math.SinH(Imaginary));
end;

class function TComplex.Tan(const AValue: TComplex): TComplex;
var
  LDenominator: Double;
begin
  if AValue = HalfPi then
    Result := ComplexInfinity
  else
    with AValue do
    begin
      LDenominator := {$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Cos(2.0 * Real) + Math.CosH(2.0 * Imaginary);
      if Math.IsZero(LDenominator) then
        ZeroDivideError;
      Result := From({$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Sin(2.0 * Real) / LDenominator,
                     Math.SinH(2.0 * Imaginary) / LDenominator);
    end;
end;

class function TComplex.Cot(const AValue: TComplex): TComplex;
begin
  with AValue do
    if IsZero then
      Result := ComplexInfinity
    else
      Result := Cos(AValue) / Sin(AValue);
end;

class function TComplex.Csc(const AValue: TComplex): TComplex;
begin
  with AValue do
    if IsZero then
      Result := ComplexInfinity
    else
      Result := One / Sin(AValue);
end;

class function TComplex.Sec(const AValue: TComplex): TComplex;
begin
  with AValue do
    if IsZero then
      Result := ComplexInfinity
    else
      Result := One / Cos(AValue);
end;

class function TComplex.ArcCos(const AValue: TComplex): TComplex;
begin
  with AValue do
    Result := HalfPi + (OneI * Ln((OneI * AValue) + Sqrt(One - Sqr(AValue))));
end;

class function TComplex.ArcSin(const AValue: TComplex): TComplex;
begin
  with AValue do
    Result := NegI * Ln((OneI * AValue) + Sqrt(One - Sqr(AValue)));
end;

class function TComplex.ArcTan(const AValue: TComplex): TComplex;
begin
  with AValue do
    Result := HalfPi * (Ln(One - (OneI * AValue)) - Ln((OneI * AValue) - One));
end;

class function TComplex.ArcCot(const AValue: TComplex): TComplex;
begin
  Result := ArcTan(Inverse(AValue));
end;

class function TComplex.ArcCsc(const AValue: TComplex): TComplex;
begin
  with AValue do
    if IsZero then
      Result := ComplexInfinity
    else
      Result := ArcSin(Inverse(AValue));
end;

class function TComplex.ArcSec(const AValue: TComplex): TComplex;
begin
  with AValue do
    if IsZero then
      Result := ComplexInfinity
    else
      Result := ArcCos(Inverse(AValue));
end;

class function TComplex.CosH(const AValue: TComplex): TComplex;
begin
  with AValue do
    Result := From(Math.CosH(Real) * {$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Cos(Imaginary),
                   Math.SinH(Real) * {$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Sin(Imaginary));
end;

class function TComplex.SinH(const AValue: TComplex): TComplex;
begin
  with AValue do
    Result := From(Math.CosH(Real) * {$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Cos(Imaginary),
                   Math.SinH(Real) * {$IFDEF CIL}Borland.Delphi.{$ENDIF}System.Sin(Imaginary));
end;

class function TComplex.TanH(const AValue: TComplex): TComplex;
begin
  with AValue do
    if IsZero then
      Result := Zero
    else
      Result := SinH(AValue) / CosH(AValue);
end;

class function TComplex.CotH(const AValue: TComplex): TComplex;
begin
  with AValue do
    if IsZero then
      Result := ComplexInfinity
    else
      Result := Inverse(TanH(AValue));
end;

class function TComplex.CscH(const AValue: TComplex): TComplex;
begin
  with AValue do
    if IsZero then
      Result := ComplexInfinity
    else
      Result := Inverse(SinH(AValue));
end;

class function TComplex.SecH(const AValue: TComplex): TComplex;
begin
  Result := Inverse(CosH(AValue));
end;

class function TComplex.ArcCosH(const AValue: TComplex): TComplex;
begin
  with AValue do
    Result := Ln(AValue + Sqrt(AValue - One) * Sqrt(AValue + One));
end;

class function TComplex.ArcSinH(const AValue: TComplex): TComplex;
begin
  with AValue do
    Result := ArcSin(AValue * OneI) * NegI;
end;

class function TComplex.ArcTanH(const AValue: TComplex): TComplex;
begin
  with AValue do
    if AValue = One then
      Result := PositiveInfinity
    else if AValue = Neg then
      Result := NegativeInfinity
    else
      Result := ArcTan(AValue * OneI) * NegI;
end;

class function TComplex.ArcCotH(const AValue: TComplex): TComplex;
begin
  with AValue do
    if AValue = One then
      Result := PositiveInfinity
    else if AValue = Neg then
      Result := NegativeInfinity
    else
      Result := ArcTanH(Inverse(AValue));
end;

class function TComplex.ArcCscH(const AValue: TComplex): TComplex;
begin
  with AValue do
    if IsZero then
      Result := ComplexInfinity
    else
      Result := ArcSinH(Inverse(AValue));
end;

class function TComplex.ArcSecH(const AValue: TComplex): TComplex;
begin
  with AValue do
    if IsZero then
      Result := ComplexInfinity
    else
      Result := ArcCosH(Inverse(AValue));
end;


class function TComplex.Parse(const AText: string): TComplex;
begin
  Result := TComplex.Parse(AText, nil);
end;

class function TComplex.Parse(const AText: string; const AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): TComplex;

  function ParseNumber(const AText: string; out ARest: string;
    out ANumber: Double): Boolean;
  var
    LAt: Integer;
    LFirstPart: string;
  begin
    Result := True;
    ARest := '';
    Val(AText, ANumber, LAt);
    if LAt <> 0 then
    begin
      ARest := Copy(AText, LAt, MaxInt);
      LFirstPart := Copy(AText, 1, LAt - 1);
      Val(LFirstPart, ANumber, LAt);
      if LAt <> 0 then
        Result := False;
    end;
  end;

  function ParseWhiteSpace(const AText: string; out ARest: string): Boolean;
  var
    LAt: Integer;
  begin
    LAt := 1;
    ARest := '';
    if AText <> '' then
    begin
      while AText[LAt] = ' ' do
        Inc(LAt);
      ARest := Copy(AText, LAt, MaxInt);
    end;
    Result := ARest <> '';
  end;

  procedure ParseError(const AText, ALeftOver, AMessage: string);
  begin
    raise EConvertError.CreateFmt(SErrorSuffix, [AMessage,
      Copy(AText, 1, Length(AText) - Length(ALeftOver)),
      Copy(AText, Length(AText) - Length(ALeftOver) + 1, MaxInt)]);
  end;

var
  LPart, LLeftover: string;
  LReal, LImaginary: Double;
  LSign: Integer;
begin
  // where to start?
  LLeftover := AText;

  // first get the real portion
  if not ParseNumber(LLeftover, LPart, LReal) then
    ParseError(AText, LLeftover, SCouldNotParseReal);

  // is that it?
  if not ParseWhiteSpace(LPart, LLeftover) then
    Result := TComplex.From(LReal)

  // if there is more then parse the TComplex part
  else
  begin

    // look for the concat symbol
    LSign := 1;
    if LLeftover[1] = '-' then
      LSign := -1
    else if LLeftover[1] <> '+' then
      ParseError(AText, LLeftover, SCouldNotParsePlus);
    LPart := Copy(LLeftover, 2, MaxInt);

    // skip any whitespace
    ParseWhiteSpace(LPart, LLeftover);

    // symbol before?
    if SymbolBeforeImaginary then
    begin
      if not WideSameText(Copy(LLeftOver, 1, Length(Symbol)), Symbol) then
        ParseError(AText, LLeftover, Format(SCouldNotParseSymbol, [Symbol]));
      LPart := Copy(LLeftover, Length(Symbol) + 1, MaxInt);

      // skip any whitespace
      ParseWhiteSpace(LPart, LLeftover);
    end;

    // imaginary part
    if not ParseNumber(LLeftover, LPart, LImaginary) then
      ParseError(AText, LLeftover, SCouldNotParseImaginary);

    // correct for sign
    LImaginary := LImaginary * LSign;

    // symbol after?
    if not SymbolBeforeImaginary then
    begin
      // skip any whitespace
      ParseWhiteSpace(LPart, LLeftover);

      // make sure there is symbol!
      if not WideSameText(Copy(LLeftOver, 1, Length(Symbol)), Symbol) then
        ParseError(AText, LLeftover, Format(SCouldNotParseSymbol, [Symbol]));
      LPart := Copy(LLeftover, Length(Symbol) + 1, MaxInt);
    end;

    // make sure the rest of the string is whitespaces
    ParseWhiteSpace(LPart, LLeftover);
    if LLeftover <> '' then
      ParseError(AText, LLeftover, SUnexpectedChars);

    // make it then
    Result := TComplex.From(LReal, LImaginary);
  end;
end;

function TComplex.ToString: String;
begin
  Result := ToString(nil);
end;

class function TComplex.Compare(const Left, Right: TComplex): Integer;
begin
  if Left = Right then
    Result := 0
  else
    Result := -1;
end;

class operator TComplex.Round(const AValue: TComplex): Int64;
begin
  Result := Round(Double(AValue));
end;

class operator TComplex.Trunc(const AValue: TComplex): Int64;
begin
  Result := Trunc(Double(AValue));
end;

class function TComplex.Equals(const Left, Right: TComplex): Boolean;
begin
  Result := Left = Right;
end;

{$IFDEF CIL}
function TComplex.Equals(AValue: TObject): Boolean;
begin
  Result := (AValue is TComplex) and
            (Self = TComplex(AValue));
end;
{$ENDIF}


class operator TComplex.Equal(const Left, Right: TComplex): Boolean;
begin
  Result := SameValue(Left.Real, Right.Real) and
            SameValue(Left.Imaginary, Right.Imaginary);
end;

class operator TComplex.NotEqual(const Left, Right: TComplex): Boolean;
begin
  Result := not (Left = Right);
end;

class operator TComplex.LessThan(const Left, Right: TComplex): Boolean;
begin
  Result := False;
end;

class operator TComplex.LessThanOrEqual(const Left, Right: TComplex): Boolean;
begin
  Result := Left = Right;
end;

class operator TComplex.GreaterThan(const Left, Right: TComplex): Boolean;
begin
  Result := False;
end;

class operator TComplex.GreaterThanOrEqual(const Left, Right: TComplex): Boolean;
begin
  Result := Left = Right;
end;


class operator TComplex.Add(const Left, Right: TComplex): TComplex;
begin
  Result := From(Left.Real + Right.Real, Left.Imaginary + Right.Imaginary);
end;

class operator TComplex.Subtract(const Left, Right: TComplex): TComplex;
begin
  Result := From(Left.Real - Right.Real, Left.Imaginary - Right.Imaginary);
end;

class operator TComplex.Multiply(const Left, Right: TComplex): TComplex;
begin
  Result := From((Left.Real * Right.Real) - (Left.Imaginary * Right.Imaginary),
                 (Left.Real * Right.Imaginary) + (Left.Imaginary * Right.Real));
end;

class operator TComplex.Divide(const Left, Right: TComplex): TComplex;
var
  LDenominator: Double;
begin
  LDenominator := (Right.Real * Right.Real) + (Right.Imaginary * Right.Imaginary);
  if Math.IsZero(LDenominator) then
    ZeroDivideError;
  Result := From(((Left.Real * Right.Real) + (Left.Imaginary * Right.Imaginary)) / LDenominator,
                 ((Left.Imaginary * Right.Real) - (Left.Real * Right.Imaginary)) / LDenominator);
end;

class operator TComplex.Negative(const AValue: TComplex): TComplex;
begin
  Result := From(-AValue.Real, -AValue.Imaginary);
end;

class operator TComplex.Implicit(const AValue: Double): TComplex;
begin
  Result.Real := AValue;
end;

class operator TComplex.Implicit(const AValue: Integer): TComplex;
begin
  Result.Real := AValue;
end;

class operator TComplex.Implicit(const AValue: Int64): TComplex;
begin
  Result.Real := AValue;
end;

class operator TComplex.Implicit(const AValue: Variant): TComplex;
{$IFDEF CIL}
var
  LData: TObject;
begin
  LData := TObject(AValue);
  if LData is TComplex then
    Result := TComplex(LData)
  else
    Result.Real := Double(AValue);
end;
{$ELSE}
begin
  Result.Real := Double(AValue);
end;
{$ENDIF}

class operator TComplex.Explicit(const AValue: TComplex): Double;
begin
  AssertImaginaryIsZero(AValue);
  Result := AValue.Real;
end;

class operator TComplex.Explicit(const AValue: TComplex): Integer;
begin
  AssertImaginaryIsZero(AValue);

  Result := Round(AValue.Real);
end;

class operator TComplex.Explicit(const AValue: TComplex): Int64;
begin
  AssertImaginaryIsZero(AValue);

  Result := Round(AValue.Real);
end;

{$IFDEF CIL}
// IComparable
function TComplex.CompareTo(Right: TObject): Integer;
var
  LRight: TComplex;
begin
  if Right is TComplex then
    LRight := Right as TComplex
  else
    LRight := TComplex.FromObject(Right);

  Result := Compare(Self, LRight);
end;

// IConvertible
function TComplex.GetTypeCode: TypeCode;
begin
  Result := System.TypeCode.Object;
end;
{$ENDIF}

function TComplex.ToBoolean(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Boolean;
begin
  Result := Double(Self) <> 0;
end;

function TComplex.ToByte(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Byte;
begin
  Result := Integer(Self);
end;

function TComplex.ToChar(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Char;
begin
  Result := ToString(AProvider)[1];
end;

function TComplex.ToDateTime(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): DateTime;
begin
{$IFNDEF CF}
  Result := {$IFDEF CIL}DateTime.FromOADate{$ENDIF}(Double(Self));
{$ENDIF}
end;

{$IFDEF CIL}
function TComplex.ToDecimal(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Decimal;
begin
  Result := Decimal.Create(Double(Self));
end;
{$ENDIF}
function TComplex.ToDouble(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Double;
begin
  Result := Double(Self);
end;

function TComplex.ToInt16(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Int16;
begin
  Result := Integer(Self);
end;

function TComplex.ToInt32(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Integer;
begin
  Result := Integer(Self);
end;

function TComplex.ToInt64(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Int64;
begin
  Result := Int64(Self);
end;

function TComplex.ToSByte(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): SByte;
begin
  Result := Integer(Self);
end;

function TComplex.ToSingle(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Single;
begin
  Result := Double(Self);
end;

const
  cFormats: array [Boolean] of string = ('%2:s %1:s %3:s%0:s',
                                         '%2:s %1:s %0:s%3:s'); { do not localize }
  cSign: array [Boolean] of string = ('-', '+');

function TComplex.ToString(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): String;
var
  RealStr, IStr: string;
begin
{$IFDEF CIL}
  RealStr := System.Convert.ToString(Real, AProvider);
  IStr := System.Convert.ToString(Borland.Delphi.System.Abs(Imaginary), AProvider);
{$ELSE}
  RealStr := FloatToStr(Real, AProvider);
  IStr := FloatToStr(System.Abs(Imaginary), AProvider);
{$ENDIF}
  Result := Format(cFormats[SymbolBeforeImaginary],
      [Symbol, cSign[Imaginary >= 0], RealStr, IStr]);
end;

{$IFDEF CIL}
function TComplex.ToType(AType: System.Type; AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): TObject;
begin
  Result := self;
  case System.Type.GetTypeCode(AType) of
    TypeCode.Boolean:
      Result := TObject(ToBoolean(AProvider));
    TypeCode.Byte:
      Result := TObject(ToByte(AProvider));
    TypeCode.Char:
      Result := TObject(ToChar(AProvider));
    TypeCode.DateTime:
      Result := TObject(ToDateTime(AProvider));
    TypeCode.Decimal:
      Result := TObject(ToDecimal(AProvider));
    TypeCode.Double:
      Result := TObject(ToDouble(AProvider));
    TypeCode.Empty:
      Result := nil;
    TypeCode.Int16:
      Result := TObject(ToInt16(AProvider));
    TypeCode.Int32:
      Result := TObject(ToInt32(AProvider));
    TypeCode.Int64:
      Result := TObject(ToInt64(AProvider));
    TypeCode.SByte:
      Result := TObject(ToSByte(AProvider));
    TypeCode.Single:
      Result := TObject(ToSingle(AProvider));
    TypeCode.String:
      Result := TObject(ToString(AProvider));
    TypeCode.UInt16:
      Result := TObject(ToUInt16(AProvider));
    TypeCode.UInt32:
      Result := TObject(ToUInt32(AProvider));
    TypeCode.UInt64:
      Result := TObject(ToUInt64(AProvider));
    TypeCode.Object:
      if not AType.IsInstanceOfType(self) then
        raise System.InvalidCastException.Create;
  else
    raise System.InvalidCastException.Create;
  end;
end;
{$ENDIF}

function TComplex.ToUInt16(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): Word;
begin
  Result := Integer(Self);
end;

function TComplex.ToUInt32(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): LongWord;
begin
  Result := Int64(Self);
end;

function TComplex.ToUInt64(AProvider: IFormatProvider {$IFDEF CIL}= nil{$ENDIF}): UInt64;
begin
  Result := {$IFDEF CIL}UInt64(Decimal{$ELSE}System.Trunc({$ENDIF}(Double(Self)));
end;


//==============================================================================
function IsNan(const AValue: TComplex): Boolean;
begin
  Result := AValue.IsNan;
end;

function IsInfinite(const AValue: TComplex): Boolean;
begin
  Result := AValue.IsInfinite;
end;


function SameValue(const Left, Right: TComplex): Boolean;
begin
  Result := Left = Right;
end;

function IsZero(const AValue: TComplex): Boolean;
begin
  Result := AValue.IsZero;
end;


function Abs(const AValue: TComplex): Double;
begin
  Result := TComplex.Abs(AValue);
end;

function AbsSqr(const AValue: TComplex): Double;
begin
  Result := AValue.Modulus;
end;

function Angle(const AValue: TComplex): Double;
begin
  Result := AValue.Phase;
end;


function Frac(const AValue: TComplex): Double;
begin
  Result := Frac(Double(AValue));
end;

function Int(const AValue: TComplex): Double;
begin
  Result := Int(Double(AValue));
end;

function Sign(const AValue: TComplex): TComplex;
begin
  Result := TComplex.Sign(AValue);
end;

function Exp(const AValue: TComplex): TComplex;
begin
  Result := TComplex.Exp(AValue);
end;

function Ln(const AValue: TComplex): TComplex;
begin
  Result := TComplex.Ln(AValue);
end;

function Log10(const AValue: TComplex): TComplex;
begin
  Result := TComplex.Log10(AValue);
end;

function Log2(const AValue: TComplex): TComplex;
begin
  Result := TComplex.Log2(AValue);
end;

function LogN(const AValue: TComplex; const X: Double): TComplex;
begin
  Result := TComplex.LogN(AValue, X);
end;

function Sqr(const AValue: TComplex): TComplex;
begin
  Result := TComplex.Sqr(AValue);
end;

function Sqrt(const AValue: TComplex): TComplex;
begin
  Result := TComplex.Sqrt(AValue);
end;

function Power(const AValue, APower: TComplex): TComplex;
begin
  Result := TComplex.Power(AValue, APower);
end;


function Cos(const AValue: TComplex): TComplex;
begin
  Result := TComplex.Cos(AValue);
end;

function Sin(const AValue: TComplex): TComplex;
begin
  Result := TComplex.Sin(AValue);
end;

function Tan(const AValue: TComplex): TComplex;
begin
  Result := TComplex.Tan(AValue);
end;

function Cot(const AValue: TComplex): TComplex;
begin
  Result := TComplex.Cot(AValue);
end;

function Csc(const AValue: TComplex): TComplex;
begin
  Result := TComplex.Csc(AValue);
end;

function Sec(const AValue: TComplex): TComplex;
begin
  Result := TComplex.Sec(AValue);
end;

function ArcCos(const AValue: TComplex): TComplex;
begin
  Result := TComplex.ArcCos(AValue);
end;

function ArcSin(const AValue: TComplex): TComplex;
begin
  Result := TComplex.ArcSin(AValue);
end;

function ArcTan(const AValue: TComplex): TComplex;
begin
  Result := TComplex.ArcTan(AValue);
end;

function ArcCot(const AValue: TComplex): TComplex;
begin
  Result := TComplex.ArcCot(AValue);
end;

function ArcCsc(const AValue: TComplex): TComplex;
begin
  Result := TComplex.ArcCsc(AValue);
end;

function ArcSec(const AValue: TComplex): TComplex;
begin
  Result := TComplex.ArcSec(AValue);
end;

function CosH(const AValue: TComplex): TComplex;
begin
  Result := TComplex.CosH(AValue);
end;

function SinH(const AValue: TComplex): TComplex;
begin
  Result := TComplex.SinH(AValue);
end;

function TanH(const AValue: TComplex): TComplex;
begin
  Result := TComplex.TanH(AValue);
end;

function CotH(const AValue: TComplex): TComplex;
begin
  Result := TComplex.CotH(AValue);
end;

function CscH(const AValue: TComplex): TComplex;
begin
  Result := TComplex.CscH(AValue);
end;

function SecH(const AValue: TComplex): TComplex;
begin
  Result := TComplex.SecH(AValue);
end;

function ArcCosH(const AValue: TComplex): TComplex;
begin
  Result := TComplex.ArcCosH(AValue);
end;

function ArcSinH(const AValue: TComplex): TComplex;
begin
  Result := TComplex.ArcSinH(AValue);
end;

function ArcTanH(const AValue: TComplex): TComplex;
begin
  Result := TComplex.ArcTanH(AValue);
end;

function ArcCotH(const AValue: TComplex): TComplex;
begin
  Result := TComplex.ArcCotH(AValue);
end;

function ArcCscH(const AValue: TComplex): TComplex;
begin
  Result := TComplex.ArcCscH(AValue);
end;

function ArcSecH(const AValue: TComplex): TComplex;
begin
  Result := TComplex.ArcSecH(AValue);
end;

function Cotan(const AValue: TComplex): TComplex;
begin
  Result := Cot(AValue);
end;

function Secant(const AValue: TComplex): TComplex;
begin
  Result := Sec(AValue);
end;

function Cosecant(const AValue: TComplex): TComplex;
begin
  Result := Csc(AValue);
end;

{$IFNDEF CIL}
initialization
  TComplex.Init;
{$ENDIF}
end.

