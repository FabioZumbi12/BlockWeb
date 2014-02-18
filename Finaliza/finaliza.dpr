program finaliza;

uses
  Forms,
  UFim in 'UFim.pas' {FFim};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Finalizando BlockWeb...';
  Application.CreateForm(TFFim, FFim);
  Application.Run;
end.
