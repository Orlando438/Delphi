object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 312
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 61
    Width = 40
    Height = 13
    Caption = 'Usu'#225'rio:'
  end
  object Label2: TLabel
    Left = 16
    Top = 133
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object editUsuario: TEdit
    Left = 16
    Top = 80
    Width = 233
    Height = 21
    TabOrder = 0
  end
  object editSenha: TEdit
    Left = 16
    Top = 152
    Width = 233
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object btAcesso: TButton
    Left = 174
    Top = 199
    Width = 75
    Height = 25
    Caption = 'Acessar'
    ModalResult = 1
    TabOrder = 2
    OnClick = btAcessoClick
  end
  object bdDados: TFDConnection
    Params.Strings = (
      'Database=postgres'
      'User_Name=postgres'
      'DriverID=PG')
    LoginPrompt = False
    Left = 128
    Top = 18
  end
  object PopupMenu1: TPopupMenu
    Left = 24
    Top = 248
    object Novodataset1: TMenuItem
      Caption = 'Novo dataset'
      OnClick = Novodataset1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Bancos Firebird|*.fdb|Bancos interbase|*.gdb'
    Left = 104
    Top = 248
  end
  object FDQuery: TFDQuery
    Connection = bdDados
    Left = 176
    Top = 18
  end
  object dsLogin: TDataSource
    DataSet = FDQuery
    Left = 72
    Top = 16
  end
end
