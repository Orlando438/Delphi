unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, rest.JSON;

type
  Tempresa = class
  private
    Fnome: string;
    FTelefone: string;
    Fmunicipio: string;

  public
    property nome: string read Fnome write Fnome;
    property telefone: string read FTelefone write FTelefone;
    property municipio: string read Fmunicipio write Fmunicipio;
  end;


  TForm1 = class(TForm)
    EditCNPJ: TEdit;
    Label1: TLabel;
    EditRazao: TEdit;
    Label2: TLabel;
    Edittelefone: TEdit;
    Label3: TLabel;
    EditRua: TEdit;
    Label4: TLabel;
    Button1: TButton;
    IdHTTP: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Pesquisar;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Pesquisar;
end;

procedure Tform1.Pesquisar;
var
  AURL: String;
  JsonReturn: TStringStream;
  Apessoa: Tempresa;
begin
  AURL :=  'https://receitaws.com.br/v1/cnpj/' + EditCNPJ.Text;

  IdSSLIOHandlerSocketOpenSSL.SSLOptions.Method := sslvTLSv1_2;
  IdHTTP.ReadTimeout := 5000;
  IdHTTP.Request.UserAgent := 'Mozilla / 4.0';
  IdHTTP.Response.ContentType := 'application/json';
  IdHTTP.Response.Charset := 'UTF-8';

  JsonReturn := TStringStream.create();
  try
    IdHTTP.Get(AURL, JsonReturn);

    Apessoa := Tempresa.Create;
    try
      APessoa := TJson.JsonToObject<Tempresa>(JsonReturn.DataString);

      EditRazao.Text := Apessoa.nome;
      Edittelefone.Text := Apessoa.telefone;
      EditRua.Text :=  Apessoa.municipio;
    finally
       Apessoa.Free;
    end;
  finally
    JsonReturn.Free;
  end;

end;

end.
