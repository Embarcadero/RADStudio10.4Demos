//---------------------------------------------------------------------------
// Copyright (c) 2016 Embarcadero Technologies, Inc. All rights reserved.  
//
// This software is the copyrighted property of Embarcadero Technologies, Inc. 
// ("Embarcadero") and its licensors. You may only use this software if you 
// are an authorized licensee of Delphi, C++Builder or RAD Studio 
// (the "Embarcadero Products").  This software is subject to Embarcadero's 
// standard software license and support agreement that accompanied your 
// purchase of the Embarcadero Products and is considered a Redistributable, 
// as such term is defined thereunder. Your use of this software constitutes 
// your acknowledgement of your agreement to the foregoing software license 
// and support agreement. 
//---------------------------------------------------------------------------
unit ABSMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.ObjectScope, CollectionObjects, System.Rtti, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Grid, FMX.Layouts,
  FMX.Grid, FMX.Controls.Presentation, FMX.StdCtrls,
  System.Generics.Collections, REST.JSON,
  Data.Bind.GenData, FMX.ScrollBox, FMX.Memo, FMX.TabControl,
  Data.Bind.Controls, Fmx.Bind.Navigator, FMX.Grid.Style, System.JSON;

type
  TABSMainForm = class(TForm)
    AdapterBindSource1: TAdapterBindSource;
    BindingsList1: TBindingsList;
    TabControl1: TTabControl;
    GridTab: TTabItem;
    JsonTab: TTabItem;
    Grid1: TGrid;
    Memo1: TMemo;
    LinkGridToDataSourceAdapterBindSource12: TLinkGridToDataSource;
    DataGeneratorAdapter1: TDataGeneratorAdapter;
    Label1: TLabel;
    TabItem1: TTabItem;
    Memo2: TMemo;
    NavigatorAdapterBindSource1: TBindNavigator;
    procedure AdapterBindSource1CreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
    procedure TabControl1Change(Sender: TObject);
  private
    { Private declarations }
    fMyPeople: TObjectList<TPerson>;
    procedure ObjectsToJson;
    procedure JsonToObjects;
  public
    { Public declarations }
  end;

var
  ABSMainForm: TABSMainForm;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.iPhone4in.fmx IOS}

type
  TUtils = class
  public
    class function ObjectListToJSON<T: class>(const AObjects: TObjectList<T>): TJSONArray;
    class function JsonToObjectList<T: class, constructor>(const AText: string): TObjectList<T>;
  end;

procedure TABSMainForm.AdapterBindSource1CreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  // A collection that owns the TPerson objects
  fMyPeople := TObjectList<TPerson>.Create(True);

  // The individual TPerson objects
  fMyPeople.Add(TPerson.Create('Gomez', 'Addams', 40));
  fMyPeople.Add(TPerson.Create('Morticia', 'Addams', 38));
  fMyPeople.Add(TPerson.Create('Pugsley', 'Addams', 8));
  fMyPeople.Add(TPerson.Create('Wednesday', 'Addams', 12));

  fMyPeople.Add(TPerson.Create('Uncle', 'Fester', 55));
  fMyPeople.Add(TPerson.Create('Grandmama', 'Frump', 72));
  fMyPeople.Add(TPerson.Create('', 'Lurch', 50));
  fMyPeople.Add(TPerson.Create('Thing T.', 'Thing', 99));
  fMyPeople.Add(TPerson.Create('Cousin', 'Itt', 21));

  // Prepopulate the Memo just in case it starts on the wrong tab.
  ObjectsToJson;

  // Use TObjectBindSourceAdapter for a single object
  ABindSourceAdapter := TListBindSourceAdapter<TPerson>.Create(Self, FMyPeople, True);
end;

function PrettyJSON(AJson: String): String;
begin
  Result := StringReplace(AJson, '},', '},' + sLineBreak, [rfReplaceAll]);
  Result := StringReplace(Result, '[{', '[' + sLineBreak + '{', [rfReplaceAll]);
end;


procedure TABSMainForm.JsonToObjects;
begin
  fMyPeople := TUtils.JsonToObjectList<TPerson>(Memo1.Text);
  TListBindSourceAdapter<TPerson>(AdapterBindSource1.InternalAdapter).SetList(fMyPeople);
  AdapterBindSource1.Active := True;
end;

procedure TABSMainForm.ObjectsToJson;
var
  LArray: TJSONArray;
begin
  LArray := TUtils.ObjectListToJSON<TPerson>(fMyPeople);
  try
    Memo1.Text := PrettyJSON(LArray.ToString);
  finally
    LArray.Free;
  end;
end;

procedure TABSMainForm.TabControl1Change(Sender: TObject);
begin
  if TabControl1.ActiveTab = JsonTab then
  begin
    if AdapterBindSource1.Editing then
      AdapterBindSource1.Post;
    ObjectsToJson
  end
  else if TabControl1.ActiveTab = GridTab then
    JsonToObjects;
end;

// Utility to a create a tidy JSON array from a list of objects.
// Calling TJson.ObjectToJsonObject on a TObjectList<T> does not generate tidy JSON because the
// fields of TObjectList will be included, in addition to the object values.
class function TUtils.ObjectListToJSON<T>(const AObjects: TObjectList<T>): TJSONArray;
var
  LObject: T;
  LArray: TJSONArray;
  LValue: TPerson;
  LElement: TJSONObject;
begin
  LArray := TJSONArray.Create;
  try
    for LObject in AObjects do
    begin
      LElement := TJson.ObjectToJsonObject(LObject);
      LArray.AddElement(LElement);
    end;
    Result := LArray;
    LArray := nil;
  finally
    LArray.Free;
  end;
end;

// Utility to create an object list from JSON array text.
class function TUtils.JsonToObjectList<T>(const AText: string): TObjectList<T>;
var
  LObject: T;
  LArray: TJSONArray;
  LValue: TJSONValue;
  LList: TObjectList<T>;
begin
  LList := TObjectList<T>.Create;
  LArray := nil;
  try
    LArray := TJSONObject.ParseJSONValue(AText) as TJSONArray;
    if LArray = nil then
      raise Exception.Create('Invalid JSON');
    for LValue in LArray do
      if LValue is TJSONObject then
      begin
        LObject := TJson.JsonToObject<T>(TJSONObject(LValue));
        LList.Add(LObject);
      end;
    Result := LList;
    LList := nil;
  finally
    LArray.Free;
    LList.Free;
  end;
end;


end.
