//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fAsync;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Menus, StdCtrls, ExtCtrls, DB, Buttons, ComCtrls,
  fMainLayers,
  FireDAC.DatS, FireDAC.Stan.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Param,
  FireDAC.VCLUI.Async;

type
  TfrmAsync = class(TfrmMainLayers)
    rgMode: TRadioGroup;
    Label1: TLabel;
    edtTimeout: TEdit;
    btnExecute: TButton;
    procedure btnExecuteClick(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAsync: TfrmAsync;

implementation

{$R *.dfm}

{ TMyAsyncHandler }

type
  TMyAsyncHandler = class(TInterfacedObject, IFDPhysCommandStateHandler)
  private
    FFrm: TfrmAsync;
  protected
    // IFDStanAsyncHandler
    procedure HandleFinished(const AInitiator: IFDStanObject;
      AState: TFDStanAsyncState; AException: Exception);
    // IFDPhysCommandStateHandler
    procedure HandleUnprepare;
  public
    constructor Create(AFrm: TfrmAsync);
  end;

constructor TMyAsyncHandler.Create(AFrm: TfrmAsync);
begin
  inherited Create;
  FFrm := AFrm;
end;

procedure TMyAsyncHandler.HandleFinished(const AInitiator: IFDStanObject;
  AState: TFDStanAsyncState; AException: Exception);
const
  StateNames: array[TFDStanAsyncState] of String = ('asInactive', 'asExecuting',
    'asFinished', 'asFailed', 'asAborted', 'asExpired');
begin
  FFrm.Console.Lines.Add('    The HandleFinished is called - ' + StateNames[AState]);
end;

procedure TMyAsyncHandler.HandleUnprepare;
begin
  // none
end;

{ TfrmAsync }

procedure TfrmAsync.cbDBClick(Sender: TObject);
begin
  inherited cbDBClick(Sender);
  btnExecute.Enabled := FConnIntf.State = csConnected;
end;

procedure TfrmAsync.btnExecuteClick(Sender: TObject);
var
  i: Integer;
  oComm: IFDPhysCommand;
begin
  FConnIntf.CreateCommand(oComm);
  with oComm do begin
    // Clear the table
    Console.Lines.Add('Filling a table before demonstration...');
    Prepare('delete from {id FDQA_ForAsync}');
    Execute;

    // Fill the table using batch execution
    CommandText := 'insert into {id FDQA_ForAsync}(id, name) values(:id, :name)';
    Params[0].DataType := ftInteger;
    Params[1].DataType := ftString;
    Params[1].Size     := 20;
    Params.ArraySize   := 1000;
    Prepare;
    for i := 0 to 1000 - 1 do begin
      Params[0].AsIntegers[i] := 0;
      Params[1].AsStrings[i]  := 'str' + IntToStr(i);
    end;
    Execute(1000, 0);
    Console.Lines.Add('End filling');

    // Setup Async mode
    Console.Lines.Add('Starting long running command execution...');
    Options.ResourceOptions.CmdExecMode := TFDStanAsyncMode(rgMode.ItemIndex);
    Options.ResourceOptions.CmdExecTimeout := Longword(StrToInt(edtTimeout.Text));
    StateHandler := TMyAsyncHandler.Create(Self);

    // Prepare long running query and open
    Prepare('SELECT Count(*) FROM {id FDQA_ForAsync} a, {id FDQA_ForAsync} b GROUP BY a.name, b.name');
    try
      Open;
    except
      on E: Exception do
        // Pressing Cancel button, Open method will trow EAbort
        Console.Lines.Add('    The execution is canceled - ' + E.Message);
    end;
    Console.Lines.Add('End execution');
  end;
end;

end.
