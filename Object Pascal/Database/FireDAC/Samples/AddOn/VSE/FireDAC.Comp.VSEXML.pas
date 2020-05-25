
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
{*******************************************************}
{                                                       }
{               Delphi FireDAC Framework                }
{   FireDAC Virtual Storage Engine XML implementation   }
{                                                       }
{ Copyright(c) 2004-2013 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}
{$I ..\..\FireDAC.inc}

unit FireDAC.Comp.VSEXML;

interface

uses
  Classes, MSXML,
  FireDAC.Comp.DataSet, FireDAC.Comp.VSE;

type
  TFDVSEXMLFieldDef = class;
  TFDVSEXMLSession = class;
  TFDVSEXMLManager = class;

  {-----------------------------------------------------------------------------}
  // XPath virtual storage

  TFDVSEXMLFieldDef = class(TFDVSEFieldDef)
  private
    FXPathNamespace: String;
    FXPathExpression: String;
    FAttribute: String;
  published
    property XPathExpression: String read FXPathExpression write FXPathExpression;
    property XPathNamespace: String read FXPathNamespace write FXPathNamespace;
    property Attribute: String read FAttribute write FAttribute;
  end;

  TFDVSEXMLSession = class(TFDVSESession)
  private
    FDoc: IXMLDomDocument2;
  public
    constructor Create(ACollection: TCollection); override;
    destructor Destroy; override;
  end;

  TFDVSEXMLManager = class(TFDVSEManager)
  protected
    class function GetFieldDefClass: TFDVSEFieldDefClass; override;
    class function GetSessionClass: TFDVSESessionClass; override;
    procedure DoDecode(ASession: TFDVSESession; ADataSet: TFDDataSet); override;
  end;

implementation

uses
  SysUtils, Variants, ComObj, DB,
  FireDAC.Stan.Intf;

{-------------------------------------------------------------------------------}
{ TFDVSEXMLSession                                                              }
{-------------------------------------------------------------------------------}
constructor TFDVSEXMLSession.Create(ACollection: TCollection);
begin
  inherited Create(ACollection);
  FDoc := CreateOleObject('Microsoft.XMLDOM') as IXMLDomDocument2;
  FDoc.setProperty('SelectionLanguage', 'XPath');
end;

{-------------------------------------------------------------------------------}
destructor TFDVSEXMLSession.Destroy;
begin
  FDoc := nil;
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
{ TFDVSEXMLManager                                                              }
{-------------------------------------------------------------------------------}
class function TFDVSEXMLManager.GetFieldDefClass: TFDVSEFieldDefClass;
begin
  Result := TFDVSEXMLFieldDef;
end;

{-------------------------------------------------------------------------------}
class function TFDVSEXMLManager.GetSessionClass: TFDVSESessionClass;
begin
  Result := TFDVSEXMLSession;
end;

{-------------------------------------------------------------------------------}
procedure TFDVSEXMLManager.DoDecode(ASession: TFDVSESession;
  ADataSet: TFDDataSet);
var
  sa: AnsiString;
  sw: WideString;
  i: Integer;
  oNode: IXMLDomNode;
begin
  with TFDVSEXMLSession(ASession).FDoc do begin
    case ASession.BaseColumn.DataType of
    dtByteString,
    dtBlob,
    dtHBlob,
    dtHBFile,
    dtAnsiString,
    dtMemo,
    dtHMemo:
      begin
        SetString(sa, PAnsiChar(ASession.Buff), ASession.Len);
        loadXML(WideString(sa));
      end;
    dtWideString,
    dtWideMemo,
    dtXML,
    dtWideHMemo:
      begin
        SetString(sw, PWideChar(ASession.Buff), ASession.Len);
        loadXML(sw);
      end;
    else
      raise Exception.CreateFmt('Base column [%s] data type is not supported !',
        [ASession.BaseColumn.Name]);
    end;
    try

      for i := 0 to ASession.Fields.Count - 1 do
        with ASession.Fields[i] do begin
          setProperty('SelectionNamespaces', TFDVSEXMLFieldDef(FieldDef).XPathNamespace);
          oNode := selectSingleNode(TFDVSEXMLFieldDef(FieldDef).XPathExpression);
          if oNode = nil then
            ASession.Row.SetData(Column, Null)
          else if TFDVSEXMLFieldDef(FieldDef).Attribute <> '' then
            ASession.Row.SetData(Column, oNode.attributes.getNamedItem(
              TFDVSEXMLFieldDef(FieldDef).Attribute).text)
          else
            ASession.Row.SetData(Column, oNode.text);
        end;

    finally
      loadXML('');
    end;
  end;

  inherited DoDecode(ASession, ADataSet);
end;

end.

