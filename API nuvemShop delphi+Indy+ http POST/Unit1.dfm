object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cadastrar Produtos NuvemShop'
  ClientHeight = 561
  ClientWidth = 853
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
    Left = 8
    Top = 55
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label2: TLabel
    Left = 8
    Top = 101
    Width = 25
    Height = 13
    Caption = 'QTD:'
  end
  object Label3: TLabel
    Left = 8
    Top = 149
    Width = 31
    Height = 13
    Caption = 'Pre'#231'o:'
  end
  object Label4: TLabel
    Left = 8
    Top = 242
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label5: TLabel
    Left = 8
    Top = 191
    Width = 51
    Height = 13
    Caption = 'Categoria:'
  end
  object Label6: TLabel
    Left = 8
    Top = 8
    Width = 23
    Height = 13
    Caption = 'Cod:'
  end
  object Label7: TLabel
    Left = 8
    Top = 288
    Width = 39
    Height = 13
    Caption = 'G'#234'nero:'
  end
  object Label8: TLabel
    Left = 8
    Top = 333
    Width = 33
    Height = 13
    Caption = 'Marca:'
  end
  object Label9: TLabel
    Left = 376
    Top = 33
    Width = 39
    Height = 13
    Caption = 'CodBar:'
  end
  object Label10: TLabel
    Left = 376
    Top = 82
    Width = 27
    Height = 13
    Caption = 'Peso:'
  end
  object Label11: TLabel
    Left = 376
    Top = 127
    Width = 41
    Height = 13
    Caption = 'Largura:'
  end
  object Label12: TLabel
    Left = 376
    Top = 172
    Width = 33
    Height = 13
    Caption = 'Altura:'
  end
  object Label13: TLabel
    Left = 376
    Top = 223
    Width = 68
    Height = 13
    Caption = 'Profundidade:'
  end
  object EditNome: TEdit
    Left = 8
    Top = 74
    Width = 249
    Height = 21
    TabOrder = 0
  end
  object EditStock: TEdit
    Left = 8
    Top = 120
    Width = 249
    Height = 21
    TabOrder = 1
  end
  object EditPreco: TEdit
    Left = 8
    Top = 168
    Width = 249
    Height = 21
    TabOrder = 2
  end
  object EditDesc: TEdit
    Left = 8
    Top = 261
    Width = 313
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 694
    Top = 340
    Width = 123
    Height = 46
    Caption = 'Cadastrar'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 400
    Width = 853
    Height = 161
    Align = alBottom
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object EditCategoria: TEdit
    Left = 8
    Top = 210
    Width = 249
    Height = 21
    TabOrder = 6
  end
  object EditCod: TEdit
    Left = 8
    Top = 27
    Width = 97
    Height = 21
    TabOrder = 7
  end
  object EditGenero: TEdit
    Left = 8
    Top = 307
    Width = 249
    Height = 21
    TabOrder = 8
  end
  object EditMarca: TEdit
    Left = 8
    Top = 352
    Width = 249
    Height = 21
    TabOrder = 9
  end
  object EditCodBar: TEdit
    Left = 376
    Top = 52
    Width = 249
    Height = 21
    TabOrder = 10
  end
  object EditPeso: TEdit
    Left = 376
    Top = 101
    Width = 113
    Height = 21
    TabOrder = 11
  end
  object EditLargura: TEdit
    Left = 376
    Top = 146
    Width = 113
    Height = 21
    TabOrder = 12
  end
  object EditAltura: TEdit
    Left = 376
    Top = 191
    Width = 113
    Height = 21
    TabOrder = 13
  end
  object EditProfundidade: TEdit
    Left = 376
    Top = 242
    Width = 121
    Height = 21
    TabOrder = 14
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
    Left = 712
    Top = 64
  end
  object IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 720
    Top = 144
  end
end
