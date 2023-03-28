unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, rest.JSON, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack,
  IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, System.JSON, uClassNuvemShop;

type

  TForm1 = class(TForm)
    Button1: TButton;
    IdHTTP: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    Memo1: TMemo;
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

procedure TForm1.Pesquisar;
var
  AURL: String;
  AJsonReturn: TstringStream;
  AListaProduto: TListaProduto;
  ARetorno: String;
  i: Integer;
begin
  AURL := 'https://api.tiendanube.com/v1/2933236/products';

  IdSSLIOHandlerSocketOpenSSL.SSLOptions.Method := sslvTLSv1_2;
  IdHTTP.ReadTimeout := 5000;
  IdHTTP.Response.ContentType := 'application/json';
  IdHTTP.Response.Charset := 'UTF-8';
  IdHTTP.Request.CustomHeaders.Values['Authentication'] := 'bearer ab66920be823ba82b281c7289576e35c20d0a1c0';
  IdHTTP.Request.CustomHeaders.Values['User-Agent'] := 'VEXCOM SISTEMAS (suporte@vexcomsistemas.com.br)';


  AJsonReturn := TstringStream.Create();
  try
    IdHTTP.Get(AURL, AJsonReturn);

    ARetorno := AJsonReturn.DataString;
    ARetorno := StringReplace(ARetorno, #10, '', [rfReplaceAll]);
    ARetorno := StringReplace(ARetorno, #13#10, '', [rfReplaceAll]);
    ARetorno := UTF8Decode(ARetorno);

    ARetorno := '{"Result": ' + ARetorno + '}';


    AListaProduto := TJson.JsonToObject<TListaProduto>(ARetorno);

    Memo1.Lines.Clear;
    for i := 0 to Length(AListaProduto.Result) -1 do
      Memo1.Lines.Add(AListaProduto.Result[i].name.pt);

  finally
    AJsonReturn.Free;
  end;
end;


end.
