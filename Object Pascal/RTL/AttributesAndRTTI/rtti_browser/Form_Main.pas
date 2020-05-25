//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Form_Main;

interface

{ This sample demonstrates the following:

  * Enumeration of the root type set, via TRttiContext.GetTypes()
    - these are all linked-in public types, that is, types declared in
      the interface section of a unit.

  * Enumeration of methods, properties and fields for which RTTI is available

  * Listing property values of RTTI objects that represent types at runtime

  Because it indiscriminately evaluates properties which may throw exceptions,
  the application should be run outside the debugger or the relevant exceptions
  should be ignored. }

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Rtti, Generics.Collections, TypInfo;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    FObjTree: TTreeView;
    FPropertyList: TListView;
    procedure FObjTreeChange(Sender: TObject; Node: TTreeNode);
  private
    FContext: TRttiContext;
    FMap: TDictionary<TObject,TTreeNode>;
    procedure RefreshTypeTree;
    procedure RefreshListView(ANode: TTreeNode);
  protected
    procedure DoCreate; override;
    procedure DoDestroy; override;
  public
  published
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

{ TMainForm }

procedure TMainForm.DoCreate;
begin
  inherited;
  FMap := TDictionary<TObject,TTreeNode>.Create;
  RefreshTypeTree;
end;

procedure TMainForm.DoDestroy;
begin
  inherited;
  FMap.Free;
end;

procedure TMainForm.FObjTreeChange(Sender: TObject; Node: TTreeNode);
begin
  if Node = nil then
    RefreshListView(nil)
  else
    RefreshListView(Node);
end;

procedure TMainForm.RefreshListView(ANode: TTreeNode);

  procedure AddColumn(const ACaption: string; AWidth: Integer);
  var
    col: TListColumn;
  begin
    col := FPropertyList.Columns.Add;
    col.Caption := ACaption;
    col.Width := AWidth
  end;
  
  procedure SetPropertyColumns;
  begin
    FPropertyList.Columns.BeginUpdate;
    try
      FPropertyList.Columns.Clear;
      AddColumn('Property Name', 200);
      AddColumn('Inherited From', 200);
      AddColumn('Type', 200);
      AddColumn('Value', 600);
    finally
      FPropertyList.Columns.EndUpdate;
    end;
  end;

  procedure SetContentColumns;
  begin
    FPropertyList.Columns.BeginUpdate;
    try
      FPropertyList.Columns.Clear;
      AddColumn('Items', 900);
    finally
      FPropertyList.Columns.EndUpdate;
    end;
  end;
  
var
  obj: TObject;
  child: TTreeNode;
  item: TListItem;
  prop: TRttiProperty;
  val: TValue;
  ex: Exception;
begin
  FPropertyList.Items.BeginUpdate;
  try
    FPropertyList.Items.Clear;
    
    if ANode = nil then
      Exit;
    
    if ANode.Data <> nil then
    begin
      SetPropertyColumns;
      obj := TObject(ANode.Data);

      item := FPropertyList.Items.Add;
      item.Caption := '(Object Type)';
      item.SubItems.Add('-');
      item.SubItems.Add('-');
      item.SubItems.Add(obj.ClassName);
      
      for prop in FContext.GetType(obj.ClassType).GetProperties do
      begin
        item := FPropertyList.Items.Add;
        item.Caption := prop.Name;
        item.SubItems.Add(prop.Parent.Name);
        item.SubItems.Add(prop.PropertyType.Name);
        try
          val := prop.GetValue(obj);
          item.SubItems.Add(val.ToString);
        except
          on ex: Exception do
            item.SubItems.Add('Exception: ' + ex.Message);
        end;
      end;
    end
    else
    begin
      SetContentColumns;
      child := ANode.getFirstChild;
      while child <> nil do
      begin
        item := FPropertyList.Items.Add;
        item.Caption := child.Text;
        item.Data := child.Data;
        child := child.getNextSibling;
      end;
    end;
  finally
    FPropertyList.Items.EndUpdate;
  end;
end;

procedure TMainForm.RefreshTypeTree;

  function AddType(Typ: TRttiType): TTreeNode; forward;

  function GetCategoryNode(Parent: TTreeNode; const Category: string): TTreeNode;
  begin
    if Parent = nil then
      Result := FObjTree.Items.GetFirstNode
    else
      Result := Parent.getFirstChild;
    while Result <> nil do
    begin
      if (Result.Data = nil) and (Result.Text = Category) then
        Exit;
      Result := Result.getNextSibling;
    end;
    
    Result := FObjTree.Items.AddChild(Parent, Category);
  end;
  
  // Assumes parent is already in tree
  function AddObjectNode(Parent, Obj: TObject; const Category: string): TTreeNode;
  var
    parentNode: TTreeNode;
  begin
    if FMap.TryGetValue(Obj, Result) then
      Exit;

    if Parent = nil then
      parentNode := nil
    else if not FMap.TryGetValue(Parent, parentNode) then
      parentNode := nil;

    if Category <> '' then
      parentNode := GetCategoryNode(parentNode, Category);
    Result := FObjTree.Items.AddChild(parentNode, Obj.ToString);
    FMap.Add(Obj, Result);
    Result.Data := Obj;
  end;

  function AddRttiNode(Parent, Obj: TRttiObject; const Category: string): TTreeNode;
  var
    attr: TCustomAttribute;
  begin
    Result := AddObjectNode(Parent, Obj, Category);
    for attr in Obj.GetAttributes do
      AddObjectNode(Obj, attr, 'Attributes');
  end;

  // Adds parent to tree if it's not there already
  function AddTypeNode(Parent: TRttiType; Typ: TRttiType; const Category: string = ''): TTreeNode;
  var
    parentNode: TTreeNode;
  begin
    if FMap.TryGetValue(Typ, Result) then
      Exit;
    
    if (Parent <> nil) and (not FMap.ContainsKey(Parent)) then
      AddType(Parent);
    
    if Parent <> nil then
      Result := AddRttiNode(Parent, Typ, 'Descendants')
    else
      Result := AddRttiNode(nil, Typ, Category);
  end;

  function AddProperty(Prop: TRttiProperty): TTreeNode;
  begin
    Result := AddRttiNode(Prop.Parent, Prop, 'Properties');
  end;
  
  function AddMethod(Meth: TRttiMethod): TTreeNode;
  var
    param: TRttiParameter;
  begin
    Result := AddRttiNode(Meth.Parent, Meth, 'Methods');
    for param in Meth.GetParameters do
      AddRttiNode(Meth, param, '');
  end;
  
  function AddField(Field: TRttiField): TTreeNode;
  begin
    Result := AddRttiNode(Field.Parent, Field, 'Fields');
  end;
  
  function AddInstance(Inst: TRttiInstanceType): TTreeNode;
  var
    meth: TRttiMethod;
    field: TRttiField;
    prop: TRttiProperty;
  begin
    Result := AddTypeNode(Inst.BaseType, Inst, 'Classes');
    for meth in Inst.GetMethods do
      AddMethod(meth);
    for field in Inst.GetFields do
      AddField(field);
    for prop in Inst.GetProperties do
      AddProperty(prop);
  end;
  
  function AddRecord(Rec: TRttiRecordType): TTreeNode;
  var
    field: TRttiField;
  begin
    Result := AddTypeNode(nil, Rec, 'Records');
    for field in Rec.GetFields do
      AddField(field);
  end;
  
  function AddOrdinal(Ord: TRttiOrdinalType): TTreeNode;
  begin
    Result := AddTypeNode(nil, Ord, 'Ordinals');
  end;
  
  function AddType(Typ: TRttiType): TTreeNode;
  begin
    case Typ.TypeKind of
      tkClass: Result := AddInstance(Typ.AsInstance);
      tkRecord: Result := AddRecord(Typ.AsRecord);
      tkSet: Result := AddTypeNode(nil, Typ.AsSet, 'Sets');
    else
      if Typ.IsOrdinal then
        Result := AddOrdinal(Typ.AsOrdinal)
      else
        Result := AddTypeNode(nil, Typ, 'Other');
    end;
  end;
  
var
  t: TRttiType;
begin
  FMap.Clear;
  FObjTree.Items.BeginUpdate;
  try
    for t in FContext.GetTypes do
      AddType(t);
  finally
    FObjTree.Items.EndUpdate;
  end;
end;


end.
