object FSenha: TFSenha
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'BlockWeb 1.0'
  ClientHeight = 96
  ClientWidth = 261
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 54
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object Label2: TLabel
    Left = 10
    Top = 9
    Width = 237
    Height = 23
    Caption = 'Senha do Administrador:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 12
    Top = 78
    Width = 141
    Height = 13
    Caption = 'INSIRA UMA NOVA SENHA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Edit1: TEdit
    Left = 55
    Top = 50
    Width = 98
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 159
    Top = 48
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BalloonHint1: TBalloonHint
    Left = 200
    Top = 80
  end
end
