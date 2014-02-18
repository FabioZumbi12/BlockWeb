program update;

uses
  Forms,
  UFim in '..\Finaliza\UFim.pas' {FFim};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Finalizando BlockWeb...';
  Application.CreateForm(TFFim, FFim);
  Application.Run;
end.
