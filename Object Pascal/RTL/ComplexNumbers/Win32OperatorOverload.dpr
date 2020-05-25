//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program Win32OperatorOverload;

{$APPTYPE CONSOLE}





uses
  SysUtils,
  Vassbotn.Vcl.Complex in 'Vassbotn.Vcl.Complex.pas';

procedure Foo;
var
  A, B: TComplex;
  C: TComplex;
begin
  A := TComplex.From(1.0, 1.0);
  B := TComplex.From(2.0, 0.5);
  C := A * B;
  Writeln('Simple example of complex numbers:');
  Writeln('A=', A.ToString);
  Writeln('B=', B.ToString);
  Writeln('A*B=', C.ToString);
  Writeln('See Readme.htm and Vassbotn.Vcl.Complex.pas for more details.');
end;

begin
  Foo;
  readln;
end.
