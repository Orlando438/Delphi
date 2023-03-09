object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'API Teste 2.0'
  ClientHeight = 366
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 37
    Width = 29
    Height = 13
    Caption = 'CNPJ:'
  end
  object Label2: TLabel
    Left = 24
    Top = 141
    Width = 64
    Height = 13
    Caption = 'Raz'#227'o Social:'
  end
  object Label3: TLabel
    Left = 24
    Top = 205
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label4: TLabel
    Left = 24
    Top = 269
    Width = 37
    Height = 13
    Caption = 'Estado:'
  end
  object EditCNPJ: TEdit
    Left = 24
    Top = 56
    Width = 321
    Height = 21
    TabOrder = 0
  end
  object EditRazao: TEdit
    Left = 24
    Top = 160
    Width = 233
    Height = 21
    TabOrder = 1
  end
  object Edittelefone: TEdit
    Left = 24
    Top = 224
    Width = 233
    Height = 21
    TabOrder = 2
  end
  object EditRua: TEdit
    Left = 24
    Top = 288
    Width = 233
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 368
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 4
    OnClick = Button1Click
  end
  object IdHTTP: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 328
    Top = 160
  end
  object IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 384
    Top = 184
  end
end
