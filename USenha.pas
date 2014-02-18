unit USenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Inifiles;

type
  TFSenha = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BalloonHint1: TBalloonHint;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSenha: TFSenha;
  Itxt : TInifile;
  Txt : String;

implementation

uses UBWeb;



{$R *.dfm}




procedure TFSenha.BitBtn1Click(Sender: TObject);
begin

if not (FSenha.Edit1.Text = '')  then
  begin


  Itxt := TInifile.Create(GetEnvironmentVariable('Temp')+'\arquivo');
  Txt := Itxt.ReadString('Senha','Senha','');

  if not(Txt='') then
   begin
    if FSenha.Edit1.Text = Txt then
    begin
    FSenha.Edit1.Text := '';
    FSenha.Edit1.Color := clWindow;
    FWeb.Show;
    FSenha.Hide;
    end else
    begin
    FSenha.Label3.Caption := 'SENHA INCORRETA';
    FSenha.Label3.Visible := True;
    end;
 end else
 begin
 Itxt.WriteString('Senha','Senha',FSenha.Edit1.Text);
 Application.MessageBox('Senha cadastrada com sucesso!!'+#13+
 'Clique em OK novamente para acessar o programa.','BlockWeb 1.0',MB_OK+MB_ICONINFORMATION);
 FSenha.Label3.Visible := False;
 FSenha.Edit1.PasswordChar := '*';
 end;

Itxt.Free;
end;

end;


end.
