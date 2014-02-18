program svchost;























{$R 'administrator.res' 'Win32\administrator.rc'}
{$R 'administrator.res' 'Win64\administrator.rc'}

uses
  Forms,
  Dialogs,
  SysUtils,
  Windows,
  Vcl.Themes,
  Vcl.Styles,
  UBWeb in 'UBWeb.pas' {FWeb},
  USenha in 'USenha.pas' {FSenha},
  USobre in 'USobre.pas' {FSobre},
  UUpdt in 'UUpdt.pas' {FUpdt};

{$R *.res}

Var
HprevHist : HWND;

begin
  Application.Initialize;
  HprevHist := FindWindow(Nil, PChar('BlockWeb 1.0'));
  if HprevHist = 0 then begin
  TStyleManager.TrySetStyle('Sapphire Kamri');
  Application.Title := 'BlockWeb 1.0';
  Application.CreateForm(TFWeb, FWeb);
  Application.CreateForm(TFUpdt, FUpdt);
  Application.CreateForm(TFSenha, FSenha);
  Application.CreateForm(TFSobre, FSobre);
  Application.Run;
  end else
  Application.MessageBox('Este programa já está em execução!'+#13+
  'Feche as outras instâncias do programa e tente novamente.', 'BlockWeb 1.0', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
end.

