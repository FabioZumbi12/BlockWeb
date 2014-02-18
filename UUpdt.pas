unit UUpdt;

interface

uses
  Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  IdAntiFreezeBase, Vcl.IdAntiFreeze, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Inifiles, ShellApi;

type
  TFUpdt = class(TForm)
    ProgressBar1: TProgressBar;
    IdHTTP1: TIdHTTP;
    IdAntiFreeze1: TIdAntiFreeze;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Button2: TButton;
    Button3: TButton;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label11: TLabel;
    Button1: TButton;
    Label16: TLabel;
    procedure IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUpdt: TFUpdt;
  arquivo: TFileStream;
  Ini2: TInifile;
  Vers�o: String;
  Descri��o: String;
  Mudan�as: String;
  coment�rios: String;
  Sistema: String;
  OS : String;

implementation

{$R *.dfm}

uses UBWeb;

function Is64Bits: Boolean;
const
  PROCESSOR_ARCHITECTURE_INTEL = $0000;
  PROCESSOR_ARCHITECTURE_IA64 = $0006;
  PROCESSOR_ARCHITECTURE_AMD64 = $0009;
  PROCESSOR_ARCHITECTURE_UNKNOWN = $FFFF;
var
  xSysInfo: TSystemInfo;
begin
  GetNativeSystemInfo(xSysInfo);
  case xSysInfo.wProcessorArchitecture of
    PROCESSOR_ARCHITECTURE_AMD64, PROCESSOR_ARCHITECTURE_IA64:
      Result := True;
  else
    Result := False;
  end;
end;


Function VersaoExe: String;
type
   PFFI = ^vs_FixedFileInfo;
var
   F       : PFFI;
   Handle  : Dword;
   Len     : Longint;
   Data    : Pchar;
   Buffer  : Pointer;
   Tamanho : Dword;
   Parquivo: Pchar;
   Arquivo : String;
begin
   Arquivo  := Application.ExeName;
   Parquivo := StrAlloc(Length(Arquivo) + 1);
   StrPcopy(Parquivo, Arquivo);
   Len := GetFileVersionInfoSize(Parquivo, Handle);
   Result := '';
   if Len > 0 then
   begin
      Data:=StrAlloc(Len+1);
      if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
      begin
         VerQueryValue(Data, '',Buffer,Tamanho);
         F := PFFI(Buffer);
         Result := Format('%d.%d.%d.%d',
                          [HiWord(F^.dwFileVersionMs),
                           LoWord(F^.dwFileVersionMs),
                           HiWord(F^.dwFileVersionLs),
                           Loword(F^.dwFileVersionLs)]
                         );
      end;
      StrDispose(Data);
   end;
   StrDispose(Parquivo);
end;


//Tira os Pontos de valores
function TiraPonto(valor: string): string;
var i: integer;
begin
     for i := 0 to Length(valor) do
       begin
       if valor[i]='.' then
          begin
               delete(valor,i,1);
          end
       end;
       Result := valor;
end;


procedure TFUpdt.Button1Click(Sender: TObject);
begin
if Application.MessageBox('Ao for�ar o download voce estar� baixando a mesma vers�o, ou uma desatualizada.'+#13+
  'Mas pode ser que hajam corre��es que n�o tenham alterado a vers�o do programa. Continuar?','Atualiza��o for�ada',MB_YESNO+MB_ICONINFORMATION+MB_APPLMODAL)=IDYES
then begin
try
//inicio baixa arquivo txt
begin
FUpdt.Label11.Visible := True;
FUpdt.Label11.Caption := 'Baixando...';
arquivo:= TFileStream.Create(ExtractFileDir(Application.ExeName)+'\BlockWeb.exe',fmCreate); //Criando o arquivo
try //tentar
idhttp1.Get('http://blockweb.fretsonfire.net.br/download/BW1.0'+OS+'.exe',arquivo); //baixar
finally
arquivo.Free; //liberar o arquivo
FUpdt.progressbar1.Position:= 0; //zerar o progressbar
FUpdt.Label11.Caption := 'Pronto!!';
FUpdt.Button3.Enabled := True;
FUpdt.Button2.Enabled := False;
end;
end;
except
  if Application.MessageBox('Arquivo n�o localizado ou problemas com a conex�o com o servidor ou com a internet!'+#13+
  'Deseja tentar baixar as atualiza��es novamente?','Erro no download da atualiza��o',MB_YESNO+MB_ICONERROR+MB_APPLMODAL)=IDYES
  then begin
  FUpdt.Hide;
  FUpdt.ShowModal;
  end else begin
  FUpdt.Button2.Enabled := False;
  FUpdt.Button3.Enabled := False;
  end;
end;
//fim baixa arquivo txt

end;

end;

procedure TFUpdt.Button2Click(Sender: TObject);
begin

//inicio baixa arquivo
try
begin
FUpdt.Label11.Visible := True;
FUpdt.Label11.Caption := 'Baixando...';
arquivo:= TFileStream.Create(ExtractFileDir(Application.ExeName)+'\BlockWeb.exe',fmCreate); //Criando o arquivo
try //tentar
idhttp1.Get('http://blockweb.fretsonfire.net.br/download/BW1.0'+OS+'.exe',arquivo); //baixar
finally
arquivo.Free; //liberar o arquivo
FUpdt.progressbar1.Position:= 0; //zerar o progressbar
FUpdt.Label11.Caption := 'Pronto!!';
FUpdt.Button3.Enabled := True;
FUpdt.Button2.Enabled := False;
end;
end;
except
  if Application.MessageBox('Arquivo n�o localizado ou problemas com a conex�o com o servidor ou com a internet!'+#13+
  'Deseja tentar baixar as atualiza��es novamente?','Erro no download da atualiza��o',MB_YESNO+MB_ICONERROR+MB_APPLMODAL)=IDYES
  then begin
  FUpdt.Hide;
  FUpdt.ShowModal;
  end else begin
  FUpdt.Button2.Enabled := False;
  FUpdt.Button3.Enabled := False;
  end;
end;
//fim baixa arquivo

end;

procedure TFUpdt.Button3Click(Sender: TObject);
begin
 if Application.MessageBox('Ser� necess�rio fechar o BlockWeb para que a atualiza��o seja conclu�da! Deseja prosseguir?','Confirmar atualiza��o',MB_YESNO+MB_ICONQUESTION+MB_APPLMODAL)=IDYES then
 ShellExecute(handle,'open',PChar('update.exe'), '','',SW_SHOWNORMAL);
end;

procedure TFUpdt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DeleteFile('BlockWeb.exe');
FWeb.Sobre1.Caption := '&Informa��es';
FWeb.Sobre1.Default := False;
end;

procedure TFUpdt.FormShow(Sender: TObject);
begin

begin
  if Is64Bits = True then
  OS := 'x64'
  else
  OS := 'x86';
end;
  FUpdt.Label16.Caption := OS;
  FUpdt.Label4.Caption := VersaoExe+' ('+TiraPonto(VersaoExe)+')';
  FUpdt.Button2.Enabled := False;
  FUpdt.Label11.Visible := False;
  FUpdt.Button3.Enabled := False;


//inicio baixa arquivo txt

begin
FUpdt.Label11.Visible := True;
FUpdt.Label11.Caption := 'Conectando...';
arquivo:= TFileStream.Create(GetEnvironmentVariable('Temp')+'\update',fmCreate); //Criando o arquivo
try //tentar
FUpdt.idhttp1.Get('http://blockweb.fretsonfire.net.br/atualizar/update.txt',arquivo); //baixar
finally
arquivo.Free; //liberar o arquivo
FUpdt.progressbar1.Position:= 0; //zerar o progressbar
FUpdt.Label11.Caption := 'OK';
end;
end;
//fim baixa arquivo txt

Ini2 := TInifile.Create(GetEnvironmentVariable('Temp')+'\update');
Vers�o := Ini2.ReadString('versao','versao','1.0.0.0');
Descri��o := Ini2.ReadString('versao','descricao','');
Mudan�as :=  Ini2.ReadString('versao','mudancas','');
Coment�rios := Ini2.ReadString('versao','comentarios','');
Sistema := Ini2.ReadString('versao','sistemas','');


FUpdt.Label2.Caption := Vers�o+' ('+TiraPonto(Vers�o)+')';
FUpdt.Label6.Caption := Descri��o;
FUpdt.Label8.Caption := Mudan�as;
FUpdt.Label10.Caption := Coment�rios;
FUpdt.Label15.Caption := Sistema;

begin
 if (TiraPonto(Vers�o) > TiraPonto(VersaoExe)) then
 begin
 FUpdt.Button2.Enabled := True;
 FUpdt.Label13.Caption := 'DESATUALIZADO!!';
 FWeb.Sobre1.Default := True;
 FWeb.Sobre1.Caption := 'ATUALIZA��O DISPON�VEL!!';

  // ICONE
  if FWeb.CheckBox17.Checked = false and FWeb.CheckBox17.Enabled = True then
   begin
   FWeb.TrayIcon1.BalloonTitle := 'Atualiza��o Dispon�vel';
   FWeb.TTray.Enabled := False;
   FWeb.TrayIcon1.BalloonHint := 'H� uma nova atualiza��o do BlockWeb dispon�vel:'+#13+Vers�o+#13+#13+
   'Clique aqui para atualizar automaticamente!!';
   FWeb.TrayIcon1.Visible := True;
   FWeb.TrayIcon1.ShowBalloonHint;
   end;
  // ICONE

 end
 else begin
 FUpdt.Button2.Enabled := False;
 FUpdt.Label13.Caption := 'Atualizado!';
 end;
end;

Ini2.Free;

//inicio da a��o de atualiza��o oculta
try
begin
if (TiraPonto(Vers�o) > TiraPonto(VersaoExe)) and (FWeb.CheckBox17.Checked = True) and (FWeb.CheckBox17.Enabled = True) then
 begin
//inicio baixa arquivo

begin
FUpdt.Label11.Visible := True;
FUpdt.Label11.Caption := 'Baixando...';
arquivo:= TFileStream.Create(ExtractFileDir(Application.ExeName)+'\BlockWeb.exe',fmCreate); //Criando o arquivo
try //tentar
idhttp1.Get('http://blockweb.fretsonfire.net.br/atualizar/BW1.0OCT'+OS+'.exe',arquivo); //baixar
finally
arquivo.Free; //liberar o arquivo
FUpdt.progressbar1.Position:= 0; //zerar o progressbar
FUpdt.Label11.Caption := 'Pronto!!';
FUpdt.Button1.Enabled := False;
FUpdt.Button2.Enabled := False;
FUpdt.Button3.Enabled := False;
ShellExecute(handle,'open',PChar('update.exe'), '','',SW_SHOWNORMAL); //executando a atualiza��o
end;
end;
end;
//fim baixa arquivo

//fim da a��o de atualiza��o oculta
  end;
  except
 end;
end;

procedure TFUpdt.IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  FUpdt.progressbar1.Position:= AWorkCount;
  refresh;
end;

procedure TFUpdt.IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  FUpdt.progressbar1.Max:= AWorkCountMax;
end;

end.
