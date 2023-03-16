unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef, uProd,
  FireDAC.VCLUI.Wait, Vcl.Mask;

const
  WM_AFTERSHOW = WM_USER + 1;
type
  TfrmClienteNovo = class(TForm)
    Label1: TLabel;
    newClient: TPageControl;
    tbConsulta: TTabSheet;
    tbCadastro: TTabSheet;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    StatusBar2: TStatusBar;
    Button2: TButton;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    Button4: TButton;
    btnCancelar: TButton;
    btnExcluir: TButton;
    btnAlterar: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button6: TButton;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Panel2: TPanel;
    Image1: TImage;
    Button1: TButton;
    PageControl1: TPageControl;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    texto: String;
    procedure WMAfterShow(var Message: TMessage); message WM_AFTERSHOW;

    procedure FazerLogin;
  public
    procedure DoShow; override;
  end;

var
  frmClienteNovo: TfrmClienteNovo;

implementation

uses Uacesso;

{$R *.dfm}

procedure TfrmClienteNovo.btnAlterarClick(Sender: TObject);
begin
  FDQuery1.Edit;
  tbConsulta.TabVisible:= false;
  tbCadastro.TabVisible:= true;
  DBEdit1.SetFocus;
end;

procedure TfrmClienteNovo.Button1Click(Sender: TObject);
begin
  try
    frmProd := TfrmProd.create(self);
    frmProd.showmodal;
  finally
     frmProd.free;
  end;

end;

procedure TfrmClienteNovo.Button2Click(Sender: TObject);
begin
  tbConsulta.TabVisible := false;
  tbCadastro.TabVisible := true;
  FDQuery1.Insert;
  DBEdit1.SetFocus;

end;

procedure TfrmClienteNovo.btnExcluirClick(Sender: TObject);
begin
try
  if (Fdquery1.RecordCount > 0) then
  FDQuery1.Delete;
  except
  showMessage('Sem dados para deletar!')
end;
end;

procedure TfrmClienteNovo.Button4Click(Sender: TObject);
begin
try
  tbConsulta.TabVisible := true;
  tbCadastro.TabVisible := false;
  Dbgrid1.SetFocus;
except

end;

end;

procedure TfrmClienteNovo.btnCancelarClick(Sender: TObject);
begin
  try
  FDQuery1.Cancel;
  tbCadastro.TabVisible := false;
  tbConsulta.TabVisible := true;
  DbGrid1.SetFocus;

  except
  showmessage('Não foi possível localizar o registro a ser cancelado!');
  end;

end;

procedure TfrmClienteNovo.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_RETURN) then
  begin
    if (texto <> '') then
    begin
      FDQuery1.Locate('log_nome', texto, [loCaseInsensitive, loPartialKey]);
      texto := '';
      StatusBar2.Panels[1].Text := texto;
    end
    else if(FDQuery1.RecordCount >0 ) then
      begin
      btnAlterar.click;
      end;
  end
  else if(key = VK_DELETE) then
    btnExcluir.Click
end;

procedure TfrmClienteNovo.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin

  if key = #8 then
  begin
    texto := Trim(copy(texto, 1, length(texto) -1));
    StatusBar2.Panels[1].Text := texto;
  end
  else
  begin
    texto := Trim(texto + key);
    StatusBar2.Panels[1].Text := texto;
  end;
end;


procedure TfrmClienteNovo.DoShow;
begin
//  inherited;
  PostMessage(Handle, WM_AFTERSHOW, 0, 0);
end;

procedure TfrmClienteNovo.FazerLogin;
var
  AResultLoginOK: Boolean;
begin
  frmLogin := Tfrmlogin.Create(Self);
  try
    AResultLoginOK := (frmLogin.ShowModal = 1);
  finally
//    FreeAndNil(frmLogin);
  end;

  if (not AResultLoginOK) then
    Application.Terminate;
    FDQuery1.Close;
    FDQuery1.SQL.Text := 'SELECT * FROM login';
    FDQuery1.Open;
end;

procedure TfrmClienteNovo.FormCreate(Sender: TObject);
begin
  texto := '';
  tbConsulta.TabVisible:= true;
  tbCadastro.TabVisible:= false;
end;


procedure TfrmClienteNovo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) then
  if(newClient.ActivePageIndex = 0) then
    close
  else
    btnCancelar.Click;
  end;

procedure TfrmClienteNovo.FormShow(Sender: TObject);
begin
  tbConsulta.TabVisible := true;
  tbCadastro.TabVisible := false;
  DBGrid1.SetFocus;
end;

procedure TfrmClienteNovo.WMAfterShow(var Message: TMessage);
begin
  FazerLogin;
end;

end.
