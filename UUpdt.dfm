object FUpdt: TFUpdt
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Atualiza'#231#227'o do Programa'
  ClientHeight = 207
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label16: TLabel
    Left = 352
    Top = 153
    Width = 37
    Height = 13
    Caption = 'Label16'
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 172
    Width = 423
    Height = 35
    Align = alBottom
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 316
    Height = 164
    Caption = ' Informa'#231#245'es '
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 43
      Width = 102
      Height = 13
      Caption = 'Vers'#227'o dispon'#237'vel:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 122
      Top = 43
      Width = 28
      Height = 13
      Caption = '-.-.-.-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 97
      Height = 13
      Caption = 'Vers'#227'o instalada:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 122
      Top = 24
      Width = 28
      Height = 13
      Caption = '-.-.-.-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 62
      Width = 50
      Height = 13
      Caption = 'Descri'#231#227'o:'
    end
    object Label6: TLabel
      Left = 72
      Top = 62
      Width = 6
      Height = 13
      Caption = '_'
    end
    object Label7: TLabel
      Left = 16
      Top = 81
      Width = 52
      Height = 13
      Caption = 'Mudan'#231'as:'
    end
    object Label8: TLabel
      Left = 74
      Top = 81
      Width = 6
      Height = 13
      Caption = '_'
    end
    object Label9: TLabel
      Left = 16
      Top = 100
      Width = 64
      Height = 13
      Caption = 'Coment'#225'rios:'
    end
    object Label10: TLabel
      Left = 86
      Top = 100
      Width = 6
      Height = 13
      Caption = '_'
    end
    object Label12: TLabel
      Left = 16
      Top = 119
      Width = 35
      Height = 13
      Caption = 'Status:'
    end
    object Label13: TLabel
      Left = 57
      Top = 119
      Width = 7
      Height = 13
      Caption = '_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 16
      Top = 138
      Width = 46
      Height = 13
      Caption = 'Sistemas:'
    end
    object Label15: TLabel
      Left = 68
      Top = 138
      Width = 7
      Height = 13
      Caption = '_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 222
      Top = 145
      Width = 76
      Height = 13
      Caption = 'Conectando...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Button2: TButton
    Left = 330
    Top = 13
    Width = 75
    Height = 25
    Caption = 'Baixar'
    Enabled = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 330
    Top = 44
    Width = 75
    Height = 25
    Caption = 'Instalar'
    Enabled = False
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button1: TButton
    Left = 330
    Top = 75
    Width = 75
    Height = 25
    Caption = 'For'#231'ar'
    TabOrder = 4
    OnClick = Button1Click
  end
  object IdHTTP1: TIdHTTP
    OnWork = IdHTTP1Work
    OnWorkBegin = IdHTTP1WorkBegin
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 208
    Top = 96
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 272
    Top = 88
  end
end
