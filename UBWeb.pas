unit UBWeb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Registry,
  Dialogs, ExtCtrls, StdCtrls, Tlhelp32, DateUtils, Mask, CheckLst, Inifiles, Commctrl,
  ComCtrls, Buttons, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Vcl.Menus,IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ShellApi, Vcl.CategoryButtons, Vcl.Tabs,
  Vcl.ActnMan, Vcl.ActnColorMaps, Vcl.Grids, Vcl.ValEdit;

type
  TFWeb = class(TForm)
    Edit1: TEdit;
    Timer1: TTimer;
    MaskEdit5: TMaskEdit;
    Timer2: TTimer;
    Edit4: TEdit;
    THora: TTimer;
    TAlmo: TTimer;
    TSAlmo: TTimer;
    TSaida: TTimer;
    TEntra: TTimer;
    GroupBox1: TGroupBox;
    MaskEdit2: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit1: TMaskEdit;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Memo2: TMemo;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Tminimizar: TTimer;
    TrayIcon1: TTrayIcon;
    TTray: TTimer;
    Edit8: TEdit;
    Edit7: TEdit;
    Edit6: TEdit;
    Edit5: TEdit;
    GroupBox3: TGroupBox;
    CheckBox5: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox1: TCheckBox;
    RadioGroup1: TRadioGroup;
    TNoite: TTimer;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    CheckBox2: TCheckBox;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    CheckBox3: TCheckBox;
    MainMenu1: TMainMenu;
    Ligado1: TMenuItem;
    Ligado2: TMenuItem;
    Desligado1: TMenuItem;
    MonitporHorrios1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Sair2: TMenuItem;
    Sobre1: TMenuItem;
    Sobre2: TMenuItem;
    Ajuda1: TMenuItem;
    ProcurarAtualizaes1: TMenuItem;
    Button2: TButton;
    CheckBox6: TCheckBox;
    TUpdate: TTimer;
    Button3: TButton;
    TSenADM: TTimer;
    CheckBox7: TCheckBox;
    CheckBox9: TCheckBox;
    Label25: TLabel;
    Label26: TLabel;
    GroupBox5: TGroupBox;
    IGreen: TImage;
    IRed: TImage;
    Label21: TLabel;
    Label22: TLabel;
    CheckBox8: TCheckBox;
    Button4: TButton;
    Label27: TLabel;
    StatusBar1: TStatusBar;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    Label7: TLabel;
    CheckBox16: TCheckBox;
    Memo1: TMemo;
    TDiaSem: TTimer;
    CheckBox17: TCheckBox;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure THoraTimer(Sender: TObject);
    procedure TEntraTimer(Sender: TObject);
    procedure TAlmoTimer(Sender: TObject);
    procedure TSAlmoTimer(Sender: TObject);
    procedure TSaidaTimer(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure TminimizarTimer(Sender: TObject);
    procedure TTrayTimer(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure TNoiteTimer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TrayIcon1BalloonClick(Sender: TObject);
    procedure TrayIcon1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CheckBox3Click(Sender: TObject);
    procedure Ligado2Click(Sender: TObject);
    procedure Desligado1Click(Sender: TObject);
    procedure MonitporHorrios1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure Sobre2Click(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
    procedure ProcurarAtualizaes1Click(Sender: TObject);
    procedure Ligado1Click(Sender: TObject);
    procedure TUpdateTimer(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure VerificarAtualizaes1Click(Sender: TObject);
    procedure TSenADMTimer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure CheckBox12Click(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure CheckBox14Click(Sender: TObject);
    procedure CheckBox15Click(Sender: TObject);
    procedure CheckBox16Click(Sender: TObject);
    procedure TDiaSemTimer(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FWeb: TFWeb;
  H1, H2, H3, H4, HAtual : String;
  Hora, Min, Sec, MSec : Word;
  J : THandle;
  H : THandle;
  titulo : PChar;
  tamanho : Integer;
  PID,Thid : Dword;
  ini : TINIFile;
  Reg: TRegistry;
  S: string;
  ISenha : Tinifile;
  TSenha : String;


implementation

uses USenha, USobre, UUpdt;

{$R *.dfm}


Function DiaSemana:String;
const
     Semana : Array [1..7] of String = ('Domingo', 'Segunda', 'Terça','Quarta','Quinta','Sexta', 'Sábado');
var
    DiaSem : Word;
begin
    DiaSem:=DayOfWeek(Date);
    Result := Semana[DiaSem];
end;

function Killp(ExeFileName: string): Integer;
const
 PROCESS_TERMINATE = $0001;
var
 ContinueLoop: BOOL;
 FSnapshotHandle: THandle;
 FProcessEntry32: TProcessEntry32;
begin
 Result := 0;
 FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
 FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
 ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

 while Integer(ContinueLoop) <> 0 do
 begin
   if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
     UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
     UpperCase(ExeFileName))) then
     Result := Integer(TerminateProcess(
                       OpenProcess(PROCESS_TERMINATE,
                                   BOOL(0),
                                   FProcessEntry32.th32ProcessID),
                                   0));
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
 end;
 CloseHandle(FSnapshotHandle);
end;

Function VersaoExe2: String;
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

function BlockInput(ABlockInput: boolean): Boolean; stdcall; external 'USER32.DLL';

procedure TravaGT(SimNao: boolean);
var
reg: TRegistry;
begin

try
reg := TRegistry.Create;
  with reg do begin
  RootKey := HKEY_CURRENT_USER;
  OpenKey('Software\Microsoft\Windows\CurrentVersion\Policies\System',true); //se não existir, é criada
    case SimNao of
    true:  WriteInteger('DisableTaskMgr',1);
    false: WriteInteger('DisableTaskMgr',0) ;
    end;
  closeKey;
  end;
finally
reg.free;
end;

end;

function tbKeyIsDown(const Key: integer): boolean;
begin
  Result := GetKeyState(Key) and 128 > 0;
end;

function TimeToSec(Hora: TTime): Integer;
begin
Result := (HourOf(Hora)) + (MinuteOf(Hora)) + (SecondOf(Hora));
end;

procedure TFWeb.Ajuda1Click(Sender: TObject);
begin
  ShellExecute(handle,'open',PChar('http://fretsonfire.net.br/dozesoftwares/?page_id=19'), '','',SW_SHOWNORMAL);
end;

procedure TFWeb.BitBtn1Click(Sender: TObject);
begin
  FWeb.Hide;
end;

procedure TFWeb.Button1Click(Sender: TObject);
begin
ini := TInifile.Create(ExtractFileDir(Application.ExeName)+'\FBWeb.dll');
ini.writestring('Horas' ,'Saida', FWeb.MaskEdit4.Text);
ini.writestring('Horas' ,'EAlmo', FWeb.MaskEdit2.Text);
ini.writestring('Horas' ,'Entrada', FWeb.MaskEdit1.Text);
ini.writestring('Horas' ,'SAlmo', FWeb.MaskEdit3.Text);
ini.free;

Begin
  if FWeb.Ligado1.Enabled = True then
  begin
  FWeb.Ligado1.Enabled := False
  end else
  FWeb.Ligado1.Enabled := True;
End;


Begin
  if FWeb.Timer2.Enabled = True then
  begin
  FWeb.Timer2.Enabled := False
  end else
  FWeb.Timer2.Enabled := True;
End;

Begin
  if FWeb.MaskEdit4.Enabled = True then
  begin
  FWeb.MaskEdit4.Enabled := False
  end else
  FWeb.MaskEdit4.Enabled := True;
End;

Begin
  if FWeb.MaskEdit3.Enabled = True then
  begin
  FWeb.MaskEdit3.Enabled := False
  end else
  FWeb.MaskEdit3.Enabled := True;
End;

Begin
  if FWeb.MaskEdit2.Enabled = True then
  begin
  FWeb.MaskEdit2.Enabled := False
  end else
  FWeb.MaskEdit2.Enabled := True;
End;

Begin
  if FWeb.MaskEdit1.Enabled = True then
  begin
  FWeb.MaskEdit1.Enabled := False
  end else
  FWeb.MaskEdit1.Enabled := True;
End;

Begin
  if FWeb.RadioGroup1.Enabled = True then
  begin
  FWeb.RadioGroup1.Enabled := False
  end else
  FWeb.RadioGroup1.Enabled := True;
End;

Begin
  if FWeb.BitBtn1.Enabled = True then
  begin
  FWeb.BitBtn1.Enabled := False
  end else
  FWeb.BitBtn1.Enabled := True;
End;

Begin
  if FWeb.Memo2.Enabled = True then
  begin
  FWeb.Memo2.Enabled := False
  end else
  FWeb.Memo2.Enabled := True;
End;

Begin
  if FWeb.CheckBox10.Enabled = True then
  begin
  FWeb.CheckBox10.Enabled := False
  end else
  FWeb.CheckBox10.Enabled := True;
End;

Begin
  if FWeb.CheckBox11.Enabled = True then
  begin
  FWeb.CheckBox11.Enabled := False
  end else
  FWeb.CheckBox11.Enabled := True;
End;

Begin
  if FWeb.CheckBox12.Enabled = True then
  begin
  FWeb.CheckBox12.Enabled := False
  end else
  FWeb.CheckBox12.Enabled := True;
End;

Begin
  if FWeb.CheckBox13.Enabled = True then
  begin
  FWeb.CheckBox13.Enabled := False
  end else
  FWeb.CheckBox13.Enabled := True;
End;

Begin
  if FWeb.CheckBox14.Enabled = True then
  begin
  FWeb.CheckBox14.Enabled := False
  end else
  FWeb.CheckBox14.Enabled := True;
End;

Begin
  if FWeb.CheckBox15.Enabled = True then
  begin
  FWeb.CheckBox15.Enabled := False
  end else
  FWeb.CheckBox15.Enabled := True;
End;

Begin
  if FWeb.CheckBox16.Enabled = True then
  begin
  FWeb.CheckBox16.Enabled := False
  end else
  FWeb.CheckBox16.Enabled := True;
End;

end;

procedure TFWeb.Button2Click(Sender: TObject);
begin
  FWeb.TTray.Enabled := False;
  //
   begin
   //
   begin
   if (FWeb.RadioGroup1.ItemIndex = 2) then
   begin
    FWeb.TrayIcon1.BalloonTitle := 'Bloqueio do Windows';
    FWeb.TrayIcon1.BalloonHint := 'Este computador está com acesso limitado á certos conteúdos nos seguintes horários:'+#13+#13+
    'das '+FWeb.MaskEdit1.Text+' até ás '+FWeb.MaskEdit2.Text+#13+'e das '+FWeb.MaskEdit3.Text+' até ás '+FWeb.MaskEdit4.Text;
    end
    else begin
    FWeb.TrayIcon1.BalloonTitle := 'Bloqueio do Windows';
    FWeb.TrayIcon1.BalloonHint := 'Este computador está com acesso limitado á certos conteúdos.';
    end;
   end;
   //
   FWeb.TrayIcon1.Visible := True;
   FWeb.TrayIcon1.ShowBalloonHint;
  end;
  //
end;

procedure TFWeb.Button3Click(Sender: TObject);
begin
  FWeb.TSenADM.Enabled := True;
  FSenha.Label3.Caption := 'DIGITE UMA SENHA';
end;

procedure TFWeb.Button4Click(Sender: TObject);
begin
  Killp('explorer.exe');
  Sleep(2000);
  shellExecute(Handle,'open', 'explorer.exe', '',nil, sw_shownormal);
end;


procedure TFWeb.CheckBox10Click(Sender: TObject);
begin

begin
  if FWeb.CheckBox10.Checked then
  FWeb.Memo1.Lines.Strings[0] := 'Domingo' else
  FWeb.Memo1.Lines.Strings[0] := '.';
end;

end;

procedure TFWeb.CheckBox11Click(Sender: TObject);
begin

begin
  if FWeb.CheckBox11.Checked then
  FWeb.Memo1.Lines.Strings[1] := 'Segunda' else
  FWeb.Memo1.Lines.Strings[1] := '.';
end;

end;

procedure TFWeb.CheckBox12Click(Sender: TObject);
begin

begin
  if FWeb.CheckBox12.Checked then
  FWeb.Memo1.Lines.Strings[2] := 'Terça' else
  FWeb.Memo1.Lines.Strings[2] := '.';
end;

end;

procedure TFWeb.CheckBox13Click(Sender: TObject);
begin

begin
  if FWeb.CheckBox13.Checked then
  FWeb.Memo1.Lines.Strings[3] := 'Quarta' else
  FWeb.Memo1.Lines.Strings[3] := '.';
end;

end;

procedure TFWeb.CheckBox14Click(Sender: TObject);
begin

begin
  if FWeb.CheckBox14.Checked then
  FWeb.Memo1.Lines.Strings[4] := 'Quinta' else
  FWeb.Memo1.Lines.Strings[4] := '.';
end;

end;

procedure TFWeb.CheckBox15Click(Sender: TObject);
begin

begin
  if FWeb.CheckBox15.Checked then
  FWeb.Memo1.Lines.Strings[5] := 'Sexta' else
  FWeb.Memo1.Lines.Strings[5] := '.';
end;

end;

procedure TFWeb.CheckBox16Click(Sender: TObject);
begin

begin
  if FWeb.CheckBox16.Checked then
  FWeb.Memo1.Lines.Strings[6] := 'Sábado' else
  FWeb.Memo1.Lines.Strings[6] := '.';
end;

end;

procedure TFWeb.CheckBox1Click(Sender: TObject);
begin
    //sempre em cima
  if FWeb.CheckBox1.Checked then
  begin
  FWeb.FormStyle := FsStayOnTop
  end
  else
  begin
  FWeb.FormStyle := FsNormal
  end;
  //sempre em cima
end;


procedure TFWeb.CheckBox3Click(Sender: TObject);
begin
TravaGT(FWeb.CheckBox3.Checked)
end;

procedure TFWeb.CheckBox5Click(Sender: TObject);
begin
  if FWeb.CheckBox5.Checked = True then
 begin
   Reg := TRegistry.Create;
   S:=ExtractFileDir(Application.ExeName)+'\'+ExtractFileName(Application.ExeName);
   Reg.rootkey:=HKEY_LOCAL_MACHINE;
   Reg.Openkey('SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN',false);
   Reg.WriteString('BlockWeb',S);
   Reg.closekey;
   Reg.Free;
 end else
   begin
   Reg := TRegistry.Create;
   S:=ExtractFileDir(Application.ExeName)+'\'+ExtractFileName(Application.ExeName);
   Reg.rootkey:=HKEY_LOCAL_MACHINE;
   Reg.Openkey('SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN',false);
   Reg.DeleteValue('BlockWeb');
   Reg.closekey;
   Reg.Free;
   end;

end;

procedure TFWeb.CheckBox6Click(Sender: TObject);
begin
FWeb.CheckBox17.Enabled := FWeb.CheckBox6.Checked;
end;

procedure TFWeb.CheckBox7Click(Sender: TObject);
begin

  if FWeb.CheckBox7.Checked = True then
 begin
   Reg := TRegistry.Create;
   Reg.rootkey:=HKEY_CURRENT_USER;
   Reg.Openkey('Software\Microsoft\Windows\CurrentVersion\Policies\Explorer',true);
   Reg.WriteInteger('NoControlPanel',1);
   Reg.closekey;
   Reg.Free;
 end else
   begin
   Reg := TRegistry.Create;
   Reg.rootkey:=HKEY_CURRENT_USER;
   Reg.Openkey('Software\Microsoft\Windows\CurrentVersion\Policies\Explorer',true);
   Reg.WriteInteger('NoControlPanel',0);
   Reg.closekey;
   Reg.Free;
   end;



end;

procedure TFWeb.CheckBox9Click(Sender: TObject);
begin

if FWeb.CheckBox9.Checked = True then
 begin
   Reg := TRegistry.Create;
   Reg.rootkey:=HKEY_CURRENT_USER;
   Reg.Openkey('Software\Microsoft\Windows\CurrentVersion\Policies\Explorer',true);
   Reg.WriteInteger('NoLogoff',1);
   Reg.closekey;
   Reg.Free;
 end else
   begin
   Reg := TRegistry.Create;
   Reg.rootkey:=HKEY_CURRENT_USER;
   Reg.Openkey('Software\Microsoft\Windows\CurrentVersion\Policies\Explorer',true);
   Reg.WriteInteger('NoLogoff',0);
   Reg.closekey;
   Reg.Free;
   end;

end;

procedure TFWeb.CheckBox8Click(Sender: TObject);
begin

if FWeb.CheckBox8.Checked = True then
 begin
   Reg := TRegistry.Create;
   Reg.rootkey:=HKEY_CURRENT_USER;
   Reg.Openkey('Software\Microsoft\Windows\CurrentVersion\Policies\Network',true);
   Reg.WriteInteger('NoEntireNetwork',1);
   Reg.closekey;
   Reg.Free;
 end else
   begin
   Reg := TRegistry.Create;
   Reg.rootkey:=HKEY_CURRENT_USER;
   Reg.Openkey('Software\Microsoft\Windows\CurrentVersion\Policies\Network',true);
   Reg.WriteInteger('NoEntireNetwork',0);
   Reg.closekey;
   Reg.Free;
   end;

end;


procedure TFWeb.Desligado1Click(Sender: TObject);
begin
  FWeb.RadioGroup1.ItemIndex := 1
end;

procedure TFWeb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ini := TInifile.Create(ExtractFileDir(Application.ExeName)+'\FBWeb.dll');
ini.writestring('Horas' ,'Saida', FWeb.MaskEdit4.Text);
ini.writestring('Horas' ,'EAlmo', FWeb.MaskEdit2.Text);
ini.writestring('Horas' ,'Entrada', FWeb.MaskEdit1.Text);
ini.writestring('Horas' ,'SAlmo', FWeb.MaskEdit3.Text);
ini.writebool('Gerais' ,'IniOculto', FWeb.CheckBox4.Checked);
ini.writebool('Gerais' ,'Iniciar', FWeb.CheckBox5.Checked);
ini.writebool('Gerais' ,'Notif', FWeb.CheckBox2.Checked);
ini.writebool('Gerais' ,'Ger', FWeb.CheckBox3.Checked);
ini.writebool('Gerais' ,'VerifApdt', FWeb.CheckBox6.Checked);
ini.writebool('Gerais' ,'Pnctrl', FWeb.CheckBox7.Checked);
ini.writebool('Gerais' ,'CPURede', FWeb.CheckBox8.Checked);
ini.writebool('Gerais' ,'Logoff', FWeb.CheckBox9.Checked);
ini.writebool('Semana' ,'dom', FWeb.CheckBox10.Checked);
ini.writebool('Semana' ,'seg', FWeb.CheckBox11.Checked);
ini.writebool('Semana' ,'ter', FWeb.CheckBox12.Checked);
ini.writebool('Semana' ,'qua', FWeb.CheckBox13.Checked);
ini.writebool('Semana' ,'qui', FWeb.CheckBox14.Checked);
ini.writebool('Semana' ,'sex', FWeb.CheckBox15.Checked);
ini.writebool('Semana' ,'sab', FWeb.CheckBox16.Checked);
ini.writebool('Gerais' ,'UpdtOculto', FWeb.CheckBox17.Checked);
ini.writeInteger('Gerais' ,'StMonit', FWeb.RadioGroup1.ItemIndex);

ini.free;

try
FWeb.memo2.lines.SaveToFile(ExtractFileDir(Application.ExeName)+'\svchost.dll');
except
end;
Application.Terminate;
end;

procedure TFWeb.FormShow(Sender: TObject);
begin

//verif senha admin
ISenha := TInifile.Create(GetEnvironmentVariable('Temp')+'\arquivo');
Tsenha := Isenha.ReadString('Senha','Senha','');

begin
if (Tsenha='') then
begin
  application.MessageBox('Parece que é a primeira vez que está utilizando o programa!!'+#13+
  'Neste momento a senha do administrador é "1block23", mude para uma que apenas você se lembre.'+#13+
  'Clique em OK quando estiver pronto, ou não mude a senha e clique em OK para manter a padrão!'+#13+
  'Lembre-se que a senha só pode ser alterada pela janela principal, então grave bem ou anote em algum lugar!!','BlockWeb 1.0',MB_OK+MB_ICONINFORMATION);
  FWeb.TSenADM.Enabled := True;
end;

end;
Isenha.Free;
//fim senha admin

ini := TInifile.Create(ExtractFileDir(Application.ExeName)+'\FBWeb.dll');
FWeb.MaskEdit1.Text:= ini.readstring('Horas' ,'Entrada', '08:30:00');
FWeb.MaskEdit2.Text:= ini.readstring('Horas' ,'EAlmo', '12:00:00');
FWeb.MaskEdit3.Text:= ini.readstring('Horas' ,'SAlmo', '13:00:00');
FWeb.MaskEdit4.Text:= ini.readstring('Horas' ,'Saida', '18:18:00');
FWeb.CheckBox6.Checked := ini.readbool('Gerais' ,'VerifApdt', False);
FWeb.CheckBox4.Checked := ini.readbool('Gerais' ,'IniOculto', False);
FWeb.CheckBox5.Checked := ini.readbool('Gerais' ,'Iniciar', True);
FWeb.CheckBox2.Checked := ini.readbool('Gerais' ,'Notif', True);
FWeb.CheckBox3.Checked := ini.readbool('Gerais' ,'Ger', False);
FWeb.CheckBox7.Checked := ini.readbool('Gerais' ,'Pnctrl', False);
FWeb.CheckBox8.Checked := ini.readbool('Gerais' ,'CPURede', False);
FWeb.CheckBox9.Checked := ini.readbool('Gerais' ,'Logoff', False);
FWeb.CheckBox10.Checked := ini.readbool('Semana' ,'dom', False);
FWeb.CheckBox11.Checked := ini.readbool('Semana' ,'seg', True);
FWeb.CheckBox12.Checked := ini.readbool('Semana' ,'ter', True);
FWeb.CheckBox13.Checked := ini.readbool('Semana' ,'qua', True);
FWeb.CheckBox14.Checked := ini.readbool('Semana' ,'qui', True);
FWeb.CheckBox15.Checked := ini.readbool('Semana' ,'sex', True);
FWeb.CheckBox16.Checked := ini.readbool('Semana' ,'sab', False);
FWeb.CheckBox17.Checked := ini.readbool('Gerais' ,'UpdtOculto', True);
FWeb.RadioGroup1.ItemIndex := ini.readInteger('Gerais' ,'StMonit', 2);
ini.free;

DeleteFile('BlockWeb.exe');

FWeb.StatusBar1.Panels[1].Text := 'Doze Softwares 2013 - Versão: '+VersaoExe2+'        ';

FWeb.CheckBox17.Enabled := FWeb.CheckBox6.Checked;

begin
  if FWeb.RadioGroup1.ItemIndex = 0 then
  FWeb.Ligado2.Checked := True
end;

begin
  if FWeb.RadioGroup1.ItemIndex = 1 then
  FWeb.Desligado1.Checked := True
end;

begin
  if FWeb.RadioGroup1.ItemIndex = 2 then
  FWeb.MonitporHorrios1.Checked := True
end;

TravaGT(FWeb.CheckBox3.Checked);

try
FWeb.memo2.lines.SaveToFile(ExtractFileDir(Application.ExeName)+'\svchost.dll');
except
end;

begin
  if FWeb.CheckBox4.Checked = False then
  FWeb.TTray.Enabled := false;
end;

begin
if Fweb.RadioGroup1.ItemIndex = 2 then
begin
  Fweb.GroupBox1.Enabled := True;
  Fweb.Button1.Enabled := True;
  Fweb.Timer1.Enabled := False;
  Fweb.TEntra.Enabled := True;
  Fweb.Talmo.Enabled := True;
  Fweb.TSAlmo.Enabled := True;
  Fweb.Tsaida.Enabled := True;
  FWeb.TDiaSem.Enabled := True;
  Fweb.Label22.Caption := 'POR HORÁRIOS';
end else
  begin
  Fweb.GroupBox1.Enabled := False;
  Fweb.Button1.Enabled := False;
  Fweb.Timer1.Enabled := True;
  Fweb.TEntra.Enabled := False;
  Fweb.Talmo.Enabled := False;
  Fweb.TSAlmo.Enabled := False;
  Fweb.Tsaida.Enabled := False;
  FWeb.TDiaSem.Enabled := False;
  Fweb.Label22.Caption := '';
  end;
end;

begin
  if FWeb.CheckBox5.Checked = True then
 begin
   Reg := TRegistry.Create;
   S:=ExtractFileDir(Application.ExeName)+'\'+ExtractFileName(Application.ExeName);
   Reg.rootkey:=HKEY_LOCAL_MACHINE;
   Reg.Openkey('SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN',false);
   Reg.WriteString('BlockWeb',S);
   Reg.closekey;
   Reg.Free;
 end else
   begin
   Reg := TRegistry.Create;
   S:=ExtractFileDir(Application.ExeName)+'\'+ExtractFileName(Application.ExeName);
   Reg.rootkey:=HKEY_LOCAL_MACHINE;
   Reg.Openkey('SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN',false);
   Reg.DeleteValue('BlockWeb');
   Reg.closekey;
   Reg.Free;
   end;
end;

//verificando arualizações
begin
if FWeb.CheckBox6.Checked = true then
FWeb.Enabled := False
end;

FWeb.TUpdate.Enabled := FWeb.CheckBox6.Checked;
//fim verificando arualizações



end;


procedure TFWeb.FormHide(Sender: TObject);
begin
ini := TInifile.Create(ExtractFileDir(Application.ExeName)+'\FBWeb.dll');
ini.writestring('Horas' ,'Saida', FWeb.MaskEdit4.Text);
ini.writestring('Horas' ,'EAlmo', FWeb.MaskEdit2.Text);
ini.writestring('Horas' ,'Entrada', FWeb.MaskEdit1.Text);
ini.writestring('Horas' ,'SAlmo', FWeb.MaskEdit3.Text);
ini.writebool('Gerais' ,'IniOculto', FWeb.CheckBox4.Checked);
ini.writebool('Gerais' ,'Iniciar', FWeb.CheckBox5.Checked);
ini.writebool('Gerais' ,'Notif', FWeb.CheckBox2.Checked);
ini.writebool('Gerais' ,'Ger', FWeb.CheckBox3.Checked);
ini.writebool('Gerais' ,'Pnctrl', FWeb.CheckBox7.Checked);
ini.writebool('Gerais' ,'CPURede', FWeb.CheckBox8.Checked);
ini.writebool('Gerais' ,'Logoff', FWeb.CheckBox9.Checked);
ini.writebool('Semana' ,'dom', FWeb.CheckBox10.Checked);
ini.writebool('Semana' ,'seg', FWeb.CheckBox11.Checked);
ini.writebool('Semana' ,'ter', FWeb.CheckBox12.Checked);
ini.writebool('Semana' ,'qua', FWeb.CheckBox13.Checked);
ini.writebool('Semana' ,'qui', FWeb.CheckBox14.Checked);
ini.writebool('Semana' ,'sex', FWeb.CheckBox15.Checked);
ini.writebool('Semana' ,'sab', FWeb.CheckBox16.Checked);
ini.writebool('Gerais' ,'UpdtOculto', FWeb.CheckBox17.Checked);
ini.writeInteger('Gerais' ,'StMonit', FWeb.RadioGroup1.ItemIndex);
ini.writebool('Gerais' ,'VerifApdt', FWeb.CheckBox6.Checked);
ini.free;
try
FWeb.memo2.lines.SaveToFile(ExtractFileDir(Application.ExeName)+'\svchost.dll');
except
end;


end;


procedure TFWeb.Label12Click(Sender: TObject);
begin
  ShellExecute(handle,'open',PChar('http://blockweb.fretsonfire.net.br'), '','',SW_SHOWNORMAL);
end;

procedure TFWeb.Ligado1Click(Sender: TObject);
begin

begin
  if FWeb.RadioGroup1.ItemIndex = 0 then
  begin
  FWeb.Ligado2.Checked := True;
  FWeb.Desligado1.Checked := False;
  FWeb.MonitporHorrios1.Checked := False;
  end;
end;

begin
  if FWeb.RadioGroup1.ItemIndex = 1 then
  begin
  FWeb.Ligado2.Checked := False;
  FWeb.Desligado1.Checked := True;
  FWeb.MonitporHorrios1.Checked := False;
  end;
end;

begin
  if FWeb.RadioGroup1.ItemIndex = 2 then
  Begin
  FWeb.Ligado2.Checked := False;
  FWeb.Desligado1.Checked := False;
  FWeb.MonitporHorrios1.Checked := True;
  End;
end;

end;

procedure TFWeb.Ligado2Click(Sender: TObject);
begin
  FWeb.RadioGroup1.ItemIndex := 0
end;

procedure TFWeb.MonitporHorrios1Click(Sender: TObject);
begin
  FWeb.RadioGroup1.ItemIndex := 2
end;

procedure TFWeb.ProcurarAtualizaes1Click(Sender: TObject);
begin
FUpdt.ShowModal;
end;

procedure TFWeb.RadioGroup1Click(Sender: TObject);
begin

begin
if Fweb.RadioGroup1.ItemIndex = 2 then
begin
  Fweb.GroupBox1.Enabled := True;
  Fweb.Button1.Enabled := True;
  Fweb.Timer1.Enabled := False;
  Fweb.TEntra.Enabled := True;
  Fweb.Talmo.Enabled := True;
  Fweb.TSAlmo.Enabled := True;
  Fweb.Tsaida.Enabled := True;
  FWeb.TDiaSem.Enabled := True;
  Fweb.Label22.Caption := 'POR HORÁRIOS';
end else
  begin
  Fweb.GroupBox1.Enabled := False;
  Fweb.Button1.Enabled := False;
  Fweb.Timer1.Enabled := True;
  Fweb.TEntra.Enabled := False;
  Fweb.Talmo.Enabled := False;
  Fweb.TSAlmo.Enabled := False;
  Fweb.Tsaida.Enabled := False;
  FWeb.TDiaSem.Enabled := False;
  Fweb.Label22.Caption := '';
  end;
end;

begin
if FWeb.RadioGroup1.ItemIndex = 0 then
  FWeb.Timer1.Enabled := True;
end;

begin
if FWeb.RadioGroup1.ItemIndex = 1 then
begin
  FWeb.Timer1.Enabled := False;
  FWeb.IRed.Visible := True;
  FWeb.IGreen.Visible := False;
end;
end;

end;

procedure TFWeb.Sair1Click(Sender: TObject);
begin
  FWeb.Hide;
end;

procedure TFWeb.Sair2Click(Sender: TObject);
begin
  Application.Terminate;
end;


procedure TFWeb.Sobre1Click(Sender: TObject);
begin
  FWeb.Sobre1.Caption := '&Informações'
end;

procedure TFWeb.Sobre2Click(Sender: TObject);
begin
  FSobre.ShowModal;
end;

procedure TFWeb.TAlmoTimer(Sender: TObject);
begin

begin
 if (FWeb.RadioGroup1.ItemIndex = 2) and (HAtual>H1) and (HAtual=H2) or (HAtual>H2) and (HAtual<H3) and (HAtual<H4) then
 FWeb.Timer1.Enabled := False;
end;
end;

procedure TFWeb.TDiaSemTimer(Sender: TObject);
begin

try
begin
if (FWeb.RadioGroup1.ItemIndex = 2) and (FWeb.Memo1.Lines.Strings[0] = DiaSemana)
  or (FWeb.Memo1.Lines.Strings[1] = DiaSemana)
  or (FWeb.Memo1.Lines.Strings[2] = DiaSemana)
  or (FWeb.Memo1.Lines.Strings[3] = DiaSemana)
  or (FWeb.Memo1.Lines.Strings[4] = DiaSemana)
  or (FWeb.Memo1.Lines.Strings[5] = DiaSemana)
  or (FWeb.Memo1.Lines.Strings[6] = DiaSemana)
  then begin
     Fweb.TEntra.Enabled := True;
     Fweb.TAlmo.Enabled := True;
     Fweb.TSAlmo.Enabled := True;
     Fweb.Tsaida.Enabled := True;
     Fweb.TNoite.Enabled := True;
  end else
  begin
     Fweb.TEntra.Enabled := False;
     Fweb.TAlmo.Enabled := False;
     Fweb.TSAlmo.Enabled := False;
     Fweb.Tsaida.Enabled := False;
     Fweb.TNoite.Enabled := False;
     Fweb.Timer1.Enabled := False;
  end;
end;
except
end;




end;

procedure TFWeb.TEntraTimer(Sender: TObject);
begin

 begin
 if (FWeb.RadioGroup1.ItemIndex = 2) and (HAtual=H1) or (HAtual>H1) and (HAtual<H2) and (HAtual<H3) and (HAtual<H4) then
 FWeb.Timer1.Enabled := True
end;
end;

procedure TFWeb.THoraTimer(Sender: TObject);
begin

try
begin
  if tbKeyIsDown(VK_CONTROL) and tbKeyIsDown(VK_SHIFT) and tbKeyIsDown(87) and (FWeb.Visible = False)
 then begin
  FSenha.Show;
  FSenha.Label3.Visible := False;
 end;
end;

FWeb.MaskEdit5.Text := TimeToStr(Time);
DecodeTime(Now, Hora, Min, Sec, MSec);
FWeb.Edit4.Text := FormatFloat('000000',Hora*60*60+Min*60+Sec);
FWeb.Label14.Caption := IntToStr(Memo2.Lines.Capacity);
FWeb.StatusBar1.Panels[0].Text := 'Data: '+FormatDateTime('dd/mm/yyyy',now)+' - '+DiaSemana;
//FWeb.Edit2.Text := DiaSemana;
except
end;

end;

procedure TFWeb.Timer1Timer(Sender: TObject);
begin

if (FWeb.RadioGroup1.ItemIndex = 0) or (FWeb.RadioGroup1.ItemIndex = 2)then
begin// inicio de tudo

  if (pos(FWeb.Memo2.Lines.Strings[0], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[1], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[2], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[3], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[4], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[5], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[6], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[7], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[8], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[9], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[10], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[11], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[12], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[13], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[14], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[15], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[16], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[17], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[18], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[19], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[20], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[21], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[22], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[23], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[24], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[25], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[26], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[27], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[28], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[29], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[30], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[31], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[32], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[33], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[34], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[35], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[36], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[37], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[38], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[39], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[40], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[41], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[42], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[43], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[44], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[45], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[46], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[47], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[48], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[49], Fweb.Edit1.Text)>0)
  or (pos(FWeb.Memo2.Lines.Strings[50], Fweb.Edit1.Text)>0)


   then
  begin
  if not (FWeb.Edit1.Text = 'BlockWeb 1.0 - por Fabio Zumbi12')  then
  begin try
  J := FindWindow(nil,PChar(FWeb.Edit1.Text));
  Thid := GetWindowThreadProcessID(J,@PID);
  TerminateProcess(OpenProcess(PROCESS_TERMINATE,False, PID), 0);
  FWeb.TTray.Enabled := True;
  except
end;
  end;
  end;
end;

end;//Fim de tudo

procedure TFWeb.Timer2Timer(Sender: TObject);
begin

try
begin
if (FWeb.RadioGroup1.ItemIndex = 0) or (FWeb.RadioGroup1.ItemIndex = 2) then
// inicio de tudo

begin
try
h := GetForegroundWindow;
tamanho := (GetWindowTextLength(h)+1) * SizeOf(Char);
GetMem(titulo,tamanho);
fillchar(titulo^, tamanho,#0);
GetWindowText(h, titulo, tamanho);
FWeb.Edit1.Text := titulo;
finally
FreeMem(titulo, tamanho);
end;
end;

DecodeTime(Time, Hora, Min, Sec, MSec);
HAtual := FormatFloat('000000',Hora*60*60+Min*60);

DecodeTime(StrtoTime(FWeb.MaskEdit1.Text), Hora, Min, Sec, MSec);
H1 := FormatFloat('000000',Hora*60*60+Min*60);

DecodeTime(StrtoTime(FWeb.MaskEdit2.Text), Hora, Min, Sec, MSec);
H2 := FormatFloat('000000',Hora*60*60+Min*60);

DecodeTime(StrtoTime(FWeb.MaskEdit3.Text), Hora, Min, Sec, MSec);
H3 := FormatFloat('000000',Hora*60*60+Min*60);

DecodeTime(StrtoTime(FWeb.MaskEdit4.Text), Hora, Min, Sec, MSec);
H4 := FormatFloat('000000',Hora*60*60+Min*60);

FWeb.Edit4.Text := HAtual;
FWeb.Edit5.Text := H1;
FWeb.Edit6.Text := H2;
FWeb.Edit7.Text := H3;
FWeb.Edit8.Text := H4;

begin
  if FWeb.Timer1.Enabled = False then
  begin
  FWeb.IRed.Visible := True;
  FWeb.IGreen.Visible := False;
  end
  else begin
  FWeb.IRed.Visible := False;
  FWeb.IGreen.Visible := True;
  end;
end;

end;
except
end;
end; 

procedure TFWeb.TminimizarTimer(Sender: TObject);
begin
try
if FWeb.CheckBox4.Checked = True then
begin
FWeb.Hide;
end;
FWeb.Tminimizar.Enabled := False;
except
end;
end;

procedure TFWeb.TNoiteTimer(Sender: TObject);
begin

begin
 if (FWeb.RadioGroup1.ItemIndex = 2) and (HAtual<H1) and (HAtual<H2) and (HAtual<H3) and (HAtual<H4) then
 FWeb.Timer1.Enabled := False;
end;
end;

procedure TFWeb.TrayIcon1BalloonClick(Sender: TObject);
begin
  if (FUpdt.Label13.Caption = 'DESATUALIZADO!!') and (FUpdt.Showing = False) then
  begin
  FWeb.TrayIcon1.Visible := False;
  FUpdt.ShowModal;
  end
  else
  FWeb.TrayIcon1.Visible := False;
end;


procedure TFWeb.TrayIcon1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  FWeb.TrayIcon1.Visible := False;
end;


procedure TFWeb.TSaidaTimer(Sender: TObject);
begin

begin
 if (FWeb.RadioGroup1.ItemIndex = 2) and (HAtual>H1) and (HAtual>H2) and (HAtual>H3) and (HAtual=H4) or (HAtual>H4) then
 FWeb.Timer1.Enabled := False;
end;
end;

procedure TFWeb.TSAlmoTimer(Sender: TObject);
begin

begin
 if (FWeb.RadioGroup1.ItemIndex = 2) and (HAtual>H1) and (HAtual>H2) and (HAtual=H3) or (HAtual>H3) and (HAtual<H4) then
 FWeb.Timer1.Enabled := True;
end;
end;

procedure TFWeb.TSenADMTimer(Sender: TObject);
begin

ISenha := TInifile.Create(GetEnvironmentVariable('Temp')+'\arquivo');
Isenha.Writestring('Senha','Senha','');
ISenha.Free;

  FWeb.TSenADM.Enabled := False;
  FSenha.Label3.Visible := True;
  FSenha.Edit1.Text := '1block23';
  FSenha.Edit1.PasswordChar := #0;
  FWeb.Hide;
  FSenha.Show;
end;

procedure TFWeb.TTrayTimer(Sender: TObject);
begin

try

FWeb.TTray.Enabled := False;
if (FWeb.Timer1.Enabled = True) and (FWeb.Visible = False) and (FWeb.CheckBox2.Checked = True) then
  begin

   begin
   if (FWeb.RadioGroup1.ItemIndex = 2) then
    FWeb.TrayIcon1.BalloonHint := 'Este computador está com acesso limitado á certos conteúdos nos seguintes horários:'+#13+#13+
    'das '+FWeb.MaskEdit1.Text+' até ás '+FWeb.MaskEdit2.Text+#13+'e das '+FWeb.MaskEdit3.Text+' até ás '+FWeb.MaskEdit4.Text
    else
    FWeb.TrayIcon1.BalloonHint := 'Este computador está com acesso limitado á certos conteúdos.';
   end;

   FWeb.TrayIcon1.Visible := True;
   FWeb.TrayIcon1.ShowBalloonHint;
  end;

except
end;
end;

procedure TFWeb.TUpdateTimer(Sender: TObject);
begin
FWeb.Sobre1.Caption := 'VERIFICANDO ATUALIZAÇÕES';
FWeb.TUpdate.Enabled := False;
FUpdt.Show;
FUpdt.Hide;
FWeb.Enabled := True;
FWeb.Sobre1.Caption := 'Informações';
end;

procedure TFWeb.VerificarAtualizaes1Click(Sender: TObject);
begin
  //Notificacoes
  begin
  if FWeb.CheckBox6.Checked = True then
  FWeb.CheckBox6.Checked := False
  else
  FWeb.CheckBox6.Checked := True
  end;
  //Notificacoes
end;

end.
