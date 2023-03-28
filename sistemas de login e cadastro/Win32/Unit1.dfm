object frmClienteNovo: TfrmClienteNovo
  Left = 0
  Top = 0
  Caption = 'New Client'
  ClientHeight = 398
  ClientWidth = 588
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 464
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label3: TLabel
    Left = 17
    Top = 131
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object newClient: TPageControl
    Left = 0
    Top = 0
    Width = 588
    Height = 379
    ActivePage = tbConsulta
    Align = alClient
    TabOrder = 0
    object tbConsulta: TTabSheet
      Caption = 'Consulta'
      object Panel1: TPanel
        Left = 0
        Top = 310
        Width = 580
        Height = 41
        Align = alBottom
        TabOrder = 0
        object Button2: TButton
          Left = 229
          Top = 14
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
          OnClick = Button2Click
        end
        object btnExcluir: TButton
          Left = 387
          Top = 14
          Width = 75
          Height = 25
          Caption = 'Excluir'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          OnClick = btnExcluirClick
        end
        object btnAlterar: TButton
          Left = 308
          Top = 14
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 2
          OnClick = btnAlterarClick
        end
      end
      object DBNavigator1: TDBNavigator
        Left = 3
        Top = 402
        Width = 212
        Height = 25
        DataSource = DataSource1
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 1
      end
      object StatusBar2: TStatusBar
        Left = 0
        Top = 291
        Width = 580
        Height = 19
        Panels = <
          item
            Text = 'Digite o que deseja pesquisar...'
            Width = 250
          end
          item
            Width = 250
          end>
      end
      object Button1: TButton
        Left = 465
        Top = 324
        Width = 75
        Height = 25
        Caption = 'Produ'#231#227'o'
        TabOrder = 3
        OnClick = Button1Click
      end
      object PageControl1: TPageControl
        Left = 3
        Top = 0
        Width = 574
        Height = 289
        TabOrder = 4
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 580
        Height = 291
        Align = alClient
        DataSource = DataSource1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = DBGrid1KeyDown
        OnKeyPress = DBGrid1KeyPress
      end
    end
    object tbCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object Label2: TLabel
        Left = 13
        Top = 62
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label4: TLabel
        Left = 16
        Top = 104
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object Label5: TLabel
        Left = 16
        Top = 144
        Width = 34
        Height = 13
        Caption = 'Senha:'
      end
      object Label6: TLabel
        Left = 16
        Top = 181
        Width = 37
        Height = 13
        Caption = 'Cidade:'
      end
      object Button4: TButton
        Left = 144
        Top = 258
        Width = 75
        Height = 25
        Caption = 'Salvar'
        TabOrder = 0
        OnClick = Button4Click
      end
      object btnCancelar: TButton
        Left = 63
        Top = 258
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 1
        OnClick = btnCancelarClick
      end
      object Button6: TButton
        Left = 392
        Top = 9
        Width = 105
        Height = 25
        Caption = 'Capture WebCam'
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 56
        Top = 178
        Width = 121
        Height = 21
        DataField = 'log_nivel'
        DataSource = DataSource1
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 56
        Top = 142
        Width = 121
        Height = 21
        DataField = 'log_senha'
        DataSource = DataSource1
        TabOrder = 4
      end
      object DBEdit2: TDBEdit
        Left = 56
        Top = 100
        Width = 121
        Height = 21
        DataField = 'log_nome'
        DataSource = DataSource1
        TabOrder = 5
      end
      object DBEdit1: TDBEdit
        Left = 56
        Top = 59
        Width = 121
        Height = 21
        DataField = 'log_codigo'
        DataSource = DataSource1
        TabOrder = 6
      end
      object Panel2: TPanel
        Left = 320
        Top = 40
        Width = 241
        Height = 177
        Caption = 'Panel2'
        TabOrder = 7
        object Image1: TImage
          Left = 72
          Top = 38
          Width = 105
          Height = 105
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 379
    Width = 588
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 300
      end
      item
        Width = 300
      end>
  end
  object FDQuery1: TFDQuery
    Connection = frmLogin.bdDados
    Left = 476
    Top = 249
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 388
    Top = 248
  end
end
