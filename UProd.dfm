object frmProd: TfrmProd
  Left = 0
  Top = 0
  Caption = 'Prod'
  ClientHeight = 479
  ClientWidth = 809
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
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 777
    Height = 417
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Produtos'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 769
        Height = 389
        Align = alClient
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Controle das parcelas'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 769
        Height = 389
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            Visible = True
          end>
      end
    end
  end
  object FDProdutos: TFDConnection
    Params.Strings = (
      'Database=postgres'
      'User_Name=postgres'
      'DriverID=PG')
    LoginPrompt = False
    Left = 596
    Top = 88
  end
  object FDQuery2: TFDQuery
    AfterOpen = FDQuery2AfterOpen
    Connection = FDProdutos
    Left = 676
    Top = 88
  end
  object DataSource1: TDataSource
    DataSet = FDQuery2
    OnUpdateData = DataSource1UpdateData
    Left = 692
    Top = 216
  end
end
