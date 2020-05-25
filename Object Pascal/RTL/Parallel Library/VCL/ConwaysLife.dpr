program ConwaysLife;

uses
  Forms,
  LifeUnit in 'LifeUnit.pas' {LifeForm},
  LifeEngine in '..\Shared_Code\LifeEngine.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLifeForm, LifeForm);
  Application.Run;
end.
