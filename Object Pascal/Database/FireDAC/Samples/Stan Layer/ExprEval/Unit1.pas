//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Factory, FireDAC.Stan.Expr, FireDAC.Stan.ExprFuncs;

type
  TMyVariable = class (TInterfacedObject, IFDStanExpressionDataSource)
  private
    FName: String;
    FpValue: PDouble;
  protected
    function GetVarIndex(const AName: String): Integer;
    function GetVarType(AIndex: Integer): TFDDataType;
    function GetVarScope(AIndex: Integer): TFDExpressionScopeKind;
    function GetVarData(AIndex: Integer): Variant;
    procedure SetVarData(AIndex: Integer; const AValue: Variant);
    function GetSubAggregateValue(AIndex: Integer): Variant;
    function GetPosition: Pointer;
    procedure SetPosition(AValue: Pointer);
    function GetRowNum: Integer;
    function GetDatabase: String;
    function GetUser: String;
  public
    constructor Create(AName: String; var AValue: Double);
  end;

{ TMyVariable }

constructor TMyVariable.Create(AName: String; var AValue: Double);
begin
  inherited Create;
  FName := AName;
  FpValue := @AValue;
end;

function TMyVariable.GetDatabase: String;
begin

end;

function TMyVariable.GetPosition: Pointer;
begin

end;

procedure TMyVariable.SetPosition(AValue: Pointer);
begin

end;

function TMyVariable.GetRowNum: Integer;
begin

end;

function TMyVariable.GetUser: String;
begin

end;

function TMyVariable.GetSubAggregateValue(AIndex: Integer): Variant;
begin

end;

function TMyVariable.GetVarIndex(const AName: String): Integer;
begin
  if CompareText(AName, FName) = 0 then
    Result := 0
  else
    Result := -1;
end;

function TMyVariable.GetVarType(AIndex: Integer): TFDDataType;
begin
  if AIndex = 0 then
    Result := dtDouble
  else
    Result := dtUnknown;
end;

function TMyVariable.GetVarScope(AIndex: Integer): TFDExpressionScopeKind;
begin
  if AIndex = 0 then
    Result := ckConst
  else
    Result := ckUnknown;
end;

function TMyVariable.GetVarData(AIndex: Integer): Variant;
begin
  if AIndex = 0 then
    Result := FpValue^
  else
    Result := Null;
end;

procedure TMyVariable.SetVarData(AIndex: Integer; const AValue: Variant);
begin
  if AIndex = 0 then
    FpValue^ := AValue
  else
    ASSERT(False);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  d: Double;
  oDS: IFDStanExpressionDataSource;
  oParser: IFDStanExpressionParser;
  oEval: IFDStanExpressionEvaluator;
begin
  oDS := TMyVariable.Create('x', d);

  FDCreateInterface(IFDStanExpressionParser, oParser);
  oEval := oParser.Prepare(oDS, '(2*x)+cos(sin(90)+10)', [], [poDefaultExpr], '');

  d := 123.456;
  ShowMessage(oEval.Evaluate);
end;

end.
