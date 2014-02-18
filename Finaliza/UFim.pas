unit UFim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Tlhelp32, Shellapi, Vcl.StdCtrls;

type
  TFFim = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFim: TFFim;
  J : THandle;
  H : THandle;
  titulo : PChar;
  tamanho : Integer;
  PID,Thid : Dword;
  S: string;

implementation

{$R *.dfm}

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


procedure TFFim.Button1Click(Sender: TObject);
begin
  J := FindWindow(nil,PChar('BlockWeb 1.0 - por Fabio Zumbi12'));
  Thid := GetWindowThreadProcessID(J,@PID);
  FFim.Label1.Caption := IntToStr(Thid);

  begin
  if not (FFim.Label1.Caption='0') then
  begin
  TerminateProcess(OpenProcess(PROCESS_TERMINATE,False, PID), 0);
  shellExecute(Handle,'open', 'BlockWeb.exe', '',nil, sw_shownormal);
  Sleep(2000);
  DeleteFile('BlockWeb.exe');
  DeleteFile('..\update');
  Killp('update.exe');
  Showmessage('Fechou')
  end;
  end;
end;

procedure TFFim.FormShow(Sender: TObject);
begin
  J := FindWindow(nil,PChar('BlockWeb 1.0 - por Fabio Zumbi12'));
  Thid := GetWindowThreadProcessID(J,@PID);
  FFim.Label1.Caption := IntToStr(Thid);

  begin
  if not (FFim.Label1.Caption='0') then
  begin
  TerminateProcess(OpenProcess(PROCESS_TERMINATE,False, PID), 0);
  shellExecute(Handle,'open', 'BlockWeb.exe', '',nil, sw_shownormal);
  Sleep(2000);
  DeleteFile('BlockWeb.exe');
  DeleteFile('..\update');
  Killp('update.exe');
  Showmessage('Fechou')
  end else
  shellExecute(Handle,'open', 'svchost.exe', '',nil, sw_shownormal);
  Killp('update.exe');
  end;

end;

end.
