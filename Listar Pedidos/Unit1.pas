unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, rest.json, uClassNuvemShop;

type

  TForm1 = class(TForm)
    Memo1: TMemo;
    EditID: TEdit;
    Label1: TLabel;
    Button1: TButton;
    IdHTTP: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    Label2: TLabel;
    EditDTInicial: TEdit;
    Label3: TLabel;
    EditDTFim: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure pesquisar;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  pesquisar;
end;

procedure Tform1.pesquisar;
var
  AURL: string;
  APedidos: TListaPedido;
  JsonString: string;
  AJsonReturn: TstringStream;
  dataInicial: string;
  dataFim: string;
begin
  dataInicial := EditDTInicial.Text;
  dataFim := EditDTFim.Text;

AURL := 'https://api.tiendanube.com/v1/2933236/orders/?';

  if dataInicial <> '' then
    begin
      AURL := AURL + 'created_at_min=' + dataInicial + 'T00:00:08+0000';
  if dataFim <> '' then
    begin
      AURL := AURL + '&created_at_max=' + dataFim + 'T00:00:08+0000';
    end;
    end

  else if dataFim <> '' then
    begin
      AURL := AURL + 'created_at_max=' + dataFim + 'T00:00:08+0000';
    end;

  IdSSLIOHandlerSocketOpenSSL.SSLOptions.Method := sslvTLSv1_2;
  IdHTTP.ReadTimeout := 5000;
  IdHTTP.Request.ContentType := 'application/json';
  IdHTTP.Request.Charset := 'UTF-8';
  IdHTTP.Request.CustomHeaders.Values['Authentication'] := 'bearer ab66920be823ba82b281c7289576e35c20d0a1c0';
  IdHTTP.Request.CustomHeaders.Values['User-Agent'] := 'VEXCOM SISTEMAS (suporte@vexcomsistemas.com.br)';

  AJsonReturn := TStringStream.Create;
  try
    IdHTTP.Get(AURL, AJsonReturn);
    JsonString := AJsonReturn.DataString;
    JsonString := StringReplace(JsonString, #10, '', [rfReplaceAll]);
    JsonString := StringReplace(JsonString, #13#10, '', [rfReplaceAll]);
    JsonString := '{"Result": ' + JsonString + '}';

    Memo1.Lines.Text := JsonString;
    APedidos := TJson.JsonToObject<TListaPedido>(JsonString);
    finally
  end;

end;

end.