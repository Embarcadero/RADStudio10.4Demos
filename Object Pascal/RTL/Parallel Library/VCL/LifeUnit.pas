//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit LifeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, LifeEngine;

const
  BoardSize: TSize = (cx: 500; cy: 500);

type
  TLifeForm = class(TForm)
    PaintBox1: TPaintBox;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    HorzScrollBar: TScrollBar;
    VertScrollBar: TScrollBar;
    Button4: TButton;
    procedure FormResize(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure VertScrollBarChange(Sender: TObject);
    procedure HorzScrollBarChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    var
      FLifeEngine: TLifeEngine;
      FLifeBoard: TLifeBoard;
      FGensPerSecond, FMaxGensPerSecond: Double;
      FViewOffset, FViewSize: TPoint;
    procedure LifeEngineUpdate(Sender: TObject);
  public
    { Public declarations }
  end;

var
  LifeForm: TLifeForm;

implementation

uses
  System.Types, System.Math, System.Threading, System.Diagnostics;

{$R *.dfm}

procedure TLifeForm.Button1Click(Sender: TObject);
begin
  if not FLifeEngine.Running then
  begin
    FLifeEngine.Start;
    Button1.Caption := '&Stop';
  end else
  begin
    FLifeEngine.Stop;
    Button1.Caption := '&Start';
  end;
end;

procedure TLifeForm.Button2Click(Sender: TObject);
begin
  if not FLifeEngine.Running then
  begin
    FLifeEngine.Clear;
    FLifeBoard := FLifeEngine.LifeBoard;
    FormResize(Sender);
    PaintBox1.Invalidate;
  end;
end;

procedure TLifeForm.Button3Click(Sender: TObject);
begin
  if not FLifeEngine.Running and OpenDialog1.Execute then
  begin
    FLifeEngine.LoadPattern(OpenDialog1.FileName);
    Hint := FLifeEngine.Description;
  end;
end;

procedure TLifeForm.Button4Click(Sender: TObject);
begin
  HorzScrollBar.Position := (Length(FLifeBoard) - FViewSize.X) div 2;
  VertScrollBar.Position := (Length(FLifeBoard[0]) - FViewSize.Y) div 2;
end;

procedure TLifeForm.CheckBox1Click(Sender: TObject);
begin
  if FLifeEngine <> nil then
    FLifeEngine.Parallel := CheckBox1.Checked;
end;

procedure TLifeForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if FLifeEngine.Running then
    Button1Click(Sender);
  CanClose := not FLifeEngine.Running;
end;

procedure TLifeForm.FormCreate(Sender: TObject);
begin
  FLifeEngine := TLifeEngine.Create(BoardSize);
  FLifeEngine.OnUpdate := LifeEngineUpdate;
  FLifeBoard := FLifeEngine.LifeBoard;
  FLifeEngine.UpdateRate := 30;
  DoubleBuffered := True;
end;

procedure TLifeForm.FormDestroy(Sender: TObject);
begin
  FLifeEngine.Free;
end;

procedure TLifeForm.FormResize(Sender: TObject);
begin
  FViewSize := Point((PaintBox1.Width - 10) div 10, (PaintBox1.Height - 10) div 10);
  HorzScrollBar.Max := Length(FLifeBoard){ - FViewSize.X};
  HorzScrollBar.PageSize := FViewSize.X;
  VertScrollBar.Max := Length(FLifeBoard[0]){ - FViewSize.Y};
  VertScrollBar.PageSize := FViewSize.Y;
end;

procedure TLifeForm.HorzScrollBarChange(Sender: TObject);
begin
  FViewOffset.X := HorzScrollBar.Position;
  PaintBox1.Invalidate;
end;

procedure TLifeForm.LifeEngineUpdate(Sender: TObject);
begin
  FLifeBoard := FLifeEngine.LifeBoard;
  FGensPerSecond := FLifeEngine.GensPerSecond;
  FMaxGensPerSecond := FLifeEngine.MaxGensPerSecond;
  Label2.Caption := Format('%f Generations Per Second', [FGensPerSecond]);
  Label3.Caption := Format('%f Max Generations Per Second', [FMaxGensPerSecond]);
  PaintBox1.Invalidate;
end;

procedure TLifeForm.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Row, Column: Integer;
begin
  if not FLifeEngine.Running and (Button = mbLeft) then
  begin
    Row := Y div 10;
    Column := X div 10;
    if (Row >= 0) and (Row <= FViewSize.Y) and
      (Column >= 0) and (Column < FViewSize.X) and
      (FViewOffset.X + Column < 500) and
      (FViewOffset.Y + Row < 500)
    then
    begin
      FLifeBoard[FViewOffset.X + Column, FViewOffset.Y + Row] :=
        FLifeBoard[FViewOffset.X + Column, FViewOffset.Y + Row] xor 1;
      PaintBox1.Invalidate;
    end;
    Label1.Caption := Format('%d, %d', [FViewOffset.X + Column, FViewOffset.Y + Row]);
  end;
end;

procedure TLifeForm.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Label1.Caption := Format('%d, %d', [FViewOffset.X + X div 10, FViewOffset.Y + Y div 10]);
end;

procedure TLifeForm.PaintBox1Paint(Sender: TObject);
var
  I, J: Integer;
  Gens, Max: Integer;
  Scale: Integer;
begin
  PaintBox1.Canvas.Pen.Color := clGrayText;
  if Length(FLifeBoard) > 0 then
    for I := 0 to FViewSize.X - 1 do
      for J := 0 to FViewSize.Y - 1 do
      begin
        if FLifeBoard[Min(FViewOffset.X + I, High(FLifeBoard)), Min(FViewOffset.Y + J, High(FLifeBoard[0]))] <> 0 then
          with PaintBox1.Canvas do
          begin
            Brush.Color := clBlack;
            Rectangle(Rect(I * 10, J * 10, I * 10 + 11, J * 10 + 11));
          end else
          with PaintBox1.Canvas do
          begin
            Brush.Color := clBtnFace;
            Rectangle(Rect(I * 10, J * 10, I * 10 + 11, J * 10 + 11));
          end;
      end;
  with PaintBox1.Canvas do
  begin
    // Calculate the scale for the graph
    Scale := 1000000;
    while Scale > 10 do
      if FMaxGensPerSecond * 10 < Scale then
        Scale := Scale div 10
      else
        Break;
    Gens := MulDiv(Trunc(FGensPerSecond), PaintBox1.Height, Scale);
    Max := MulDiv(Trunc(FMaxGensPerSecond), PaintBox1.Height, Scale);
    Brush.Color := clGreen;
    FillRect(Rect(PaintBox1.Width - 4, PaintBox1.Height - Gens, PaintBox1.Width, PaintBox1.Height));
    Pen.Color := clRed;
    MoveTo(PaintBox1.Width - 4, PaintBox1.Height - Max);
    LineTo(PaintBox1.Width, PaintBox1.Height - Max);
  end;
end;

procedure TLifeForm.VertScrollBarChange(Sender: TObject);
begin
  FViewOffset.Y := VertScrollBar.Position;
  PaintBox1.Invalidate;
end;


end.
