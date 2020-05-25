//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit DemoAttr;

interface

uses SysUtils, Rtti, Classes;

type
  { Note that leaving off traditional 'T' permits easier-reading attribute usage.
    Since the 'Attribute' at the end is assumed under lookup, the identifier
    should still be sufficiently unique. }
  MyDemoAttribute = class(TCustomAttribute)
  public
    { TRttiType can be used as a parameter type; TypeInfo() supplies the argument. }
    constructor Create(const AName: string; AType: TRttiType); overload;
    { Alternatively, TClass can be used, but limited to instance types. }
    constructor Create(AClass: TClass); overload;
  end;

  { The appropriate overload for the 'Create' constructor is chosen. }
  [MyDemo('On Class', TypeInfo(Integer))]
  TDemoObject = class
  private
    [MyDemo(TStringList)]
    FField: Integer;
  public
    [MyDemo('On Procedure', TypeInfo(TClass))]
    procedure Foo(
      [MyDemo('On Parameter', TypeInfo(AnsiString))] const x: string);
  end;

implementation

{ MyDemoAttribute }

constructor MyDemoAttribute.Create(const AName: string; AType: TRttiType);
begin
  Writeln(Format('---> MyDemoAttribute created with name "%s" and type "%s"', 
    [AName, AType.Name]));
end;

constructor MyDemoAttribute.Create(AClass: TClass);
begin
  Writeln(Format('---> MyDemoAttribute created class "%s"', [AClass.ClassName]));
end;

{ TDemoObject }

procedure TDemoObject.Foo(const x: string);
begin

end;

end.
