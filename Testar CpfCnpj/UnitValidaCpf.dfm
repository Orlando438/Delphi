object FormValidaCpf: TFormValidaCpf
  Left = 0
  Top = 0
  Caption = 'Valida CpfCnpj'
  ClientHeight = 538
  ClientWidth = 917
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 42
    Width = 46
    Height = 13
    Caption = 'DataBase'
  end
  object Label2: TLabel
    Left = 24
    Top = 98
    Width = 49
    Height = 13
    Caption = 'UserName'
  end
  object Label3: TLabel
    Left = 24
    Top = 154
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Label6: TLabel
    Left = 320
    Top = 42
    Width = 172
    Height = 13
    Caption = 'Cadastros com CPF/CNPJ Invalidos:'
  end
  object EditDataBase: TEdit
    Left = 24
    Top = 61
    Width = 265
    Height = 21
    TabOrder = 0
    Text = 'KARISMA'
  end
  object Button1: TButton
    Left = 214
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object EditUserName: TEdit
    Left = 24
    Top = 117
    Width = 265
    Height = 21
    TabOrder = 2
    Text = 'evsis'
  end
  object EditSenha: TEdit
    Left = 24
    Top = 173
    Width = 265
    Height = 21
    TabOrder = 3
    Text = 'evsis8731'
  end
  object Memo1: TMemo
    Left = 320
    Top = 61
    Width = 553
    Height = 409
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
  object CheckBoxCNPJ: TCheckBox
    Left = 580
    Top = 484
    Width = 55
    Height = 17
    Caption = 'CNPJ'
    TabOrder = 5
  end
  object ButtonListar: TButton
    Left = 769
    Top = 476
    Width = 105
    Height = 25
    Caption = 'Listar Invalidos'
    TabOrder = 6
    OnClick = ButtonListarClick
  end
  object CheckBoxExibirApenasCodigo: TCheckBox
    Left = 641
    Top = 484
    Width = 122
    Height = 17
    Caption = 'Exibir Apenas Codigo'
    TabOrder = 7
  end
  object Query: TFDQuery
    Left = 112
    Top = 376
  end
  object FDConexao: TFDConnection
    Params.Strings = (
      'DriverID=PG')
    Left = 40
    Top = 384
  end
end