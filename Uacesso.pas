unit Uacesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.FMTBcd, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Data.SqlExpr, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Menus, inifiles;

type
  TfrmLogin = class(TForm)
    editUsuario: TEdit;
    Label1: TLabel;
    editSenha: TEdit;
    Label2: TLabel;
    btAcesso: TButton;
    bdDados: TFDConnection;
    PopupMenu1: TPopupMenu;
    Novodataset1: TMenuItem;
    OpenDialog1: TOpenDialog;
    FDQuery: TFDQuery;
    dsLogin: TDataSource;
    procedure btAcessoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Novodataset1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    tentativas:integer;
    iniconf:TiniFile;
  public

  end;

var
  frmLogin: TfrmLogin;
  usuario:string;

implementation


{$R *.dfm}

uses Unit1;

procedure TfrmLogin.btAcessoClick(Sender: TObject);
begin
  FDQuery.Close;
  FDQuery.SQL.Text := ' SELECT * ' +
                      '   FROM login ' +
                      '  WHERE log_nome = :log_nome ' +
                      '    and log_senha = :log_senha ' ;

  FDQuery.ParambyName('log_nome').asString := editUsuario.text;
  FDQuery.ParambyName('log_senha').asString := editSenha.text;
  FDQuery.Open;

  if (FDQuery.RecordCount > 0) then
  begin
    usuario := editUsuario.text;
  end
  else
  begin
    ModalResult :=mrNone;
    if (tentativas = 1) then
    begin
      inc(tentativas);
      showMessage('Infomações Incorretas!, mais uma chance...');
    end
    else
    begin
      showMessage('Acesso Bloqueado!');
      close;
    end;
  end;
end;


procedure TfrmLogin.Button1Click(Sender: TObject);
var
  AQuery: TFDQuery;
begin
  AQuery := TFDQuery.Create(Self);
  try
    AQuery.SQL.Text := 'teste';
  finally
    AQuery.Free;
  end;

  try

  finally

  end;

end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin

  tentativas:=1;
  IniConf:= TIniFile.Create(ExtractFilePath(application.ExeName) + 'conf.ini');
  try
    bdDados.connected:=false;
    bdDAdos.name := IniConf.ReadString('bdDados', 'path', '');
    bdDados.connected := True;

    try
      bdDados.connected := true;
    except
      ShowMessage('erro na conexao');
    end;
  finally
    iniconf.Free;
  end;
end;

procedure TfrmLogin.Novodataset1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    bdDados.connected :=false;
    bdDados.name := OpenDialog1.FileName;
    iniconf.WriteString('bdDados', 'path', bdDados.name);

    try
      bdDados.connected := true;
      fdQuery.open;
    except
       showMessage('erro na conexao');
    end;
  end;
end;

end.





