//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit MainAppForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfMainAppForm = class(TForm)
    bLoadDLL: TButton;
    procedure bLoadDLLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMainAppForm: TfMainAppForm;

implementation

{$R *.dfm}

procedure TfMainAppForm.bLoadDLLClick(Sender: TObject);
var
  LDLLHandle: HModule;
  ClearString: procedure(var AString: string);
  LTempStr: string;
  i: integer;
begin
  LDLLHandle := LoadLibrary('TestDLL.dll');
  if LDLLHandle <> 0 then
  begin
    ClearString := GetProcAddress(LDLLHandle, 'ClearString');
    if Assigned(ClearString) then
    begin
      {Allocate lots of long strings and let the DLL free them}
      for i := 1 to 10000 do
      begin
        LTempStr := IntToStr(i);
        ClearString(LTempStr);
      end;
      ShowMessage('It works!');
    end
    else
      ShowMessage('ClearString procedure not found in TestDLL.dll.');
    {Free the library}
    FreeLibrary(LDLLHandle);
  end
  else
    ShowMessage('TestDLL.dll not found.');
end;

end.
