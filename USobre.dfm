object FSobre: TFSobre
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sobre'
  ClientHeight = 178
  ClientWidth = 212
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 5
    Width = 192
    Height = 39
    Caption = 'BlockWeb 1.0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 71
    Top = 48
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 28
    Top = 48
    Width = 37
    Height = 13
    Caption = 'Vers'#227'o:'
  end
  object GroupBox1: TGroupBox
    Left = 6
    Top = 67
    Width = 192
    Height = 105
    TabOrder = 0
    object Label4: TLabel
      Left = 19
      Top = 6
      Width = 139
      Height = 13
      Caption = 'Produzido por: FabioZumbi12'
    end
    object Label5: TLabel
      Left = 19
      Top = 19
      Width = 156
      Height = 13
      Caption = 'Grupo de Sofwares : Doze Corp.'
    end
    object Label6: TLabel
      Left = 19
      Top = 32
      Width = 101
      Height = 13
      Caption = 'Ano do C'#243'digo: 2012'
    end
    object Label7: TLabel
      Left = 19
      Top = 46
      Width = 76
      Height = 13
      Caption = 'P'#225'gina da Web:'
    end
    object Label8: TLabel
      Left = 7
      Top = 56
      Width = 3
      Height = 13
    end
    object Label9: TLabel
      Left = 99
      Top = 46
      Width = 53
      Height = 13
      Cursor = crHandPoint
      Caption = 'Clique Aqui'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = Label9Click
    end
    object Label10: TLabel
      Left = 19
      Top = 72
      Width = 76
      Height = 13
      Caption = 'Agradecimento:'
    end
    object Label11: TLabel
      Left = 19
      Top = 84
      Width = 124
      Height = 13
      Caption = 'Comunidade Active Delphi'
    end
  end
end
