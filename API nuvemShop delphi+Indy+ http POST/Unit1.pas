unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, rest.JSON, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack,
  IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  Tvariants = class
     private
       Fstock: integer;
       Fprice: string;
       Fgender: string;
       Fbarcode: integer;
       Fsku: integer;
       Fweight: string;
       Fwidth: string;
       Fheight: string;
       Fdepth: string;
     public
       property stock: integer read Fstock write Fstock;
       property price: string read Fprice write Fprice;
       property gender: string read Fgender write Fgender;
       property barcode: integer read Fbarcode write Fbarcode;
       property sku: integer read Fsku write Fsku;
       property weight: string read Fweight write Fweight;
       property width: string read Fwidth write Fwidth;
       property height: string read Fheight write Fheight;
       property depth: string read Fdepth write Fdepth;
   end;

   Tproduto = class
     private
       Fid: integer;
       Fname: string;
       Fdescription: string;
       Fbrand: string;
       Fcategories: Tarray<string>;
       Fvariants: Tarray<Tvariants>;
     public
       property id: integer read Fid write Fid;
       property name: string read Fname write Fname;
       property description: string read Fdescription write Fdescription;
       property brand: string read Fbrand write Fbrand;
       property categories: Tarray<string> read Fcategories write Fcategories;
       property variants: Tarray<Tvariants> read Fvariants write Fvariants;
   end;

  TForm1 = class(TForm)
    EditNome: TEdit;
    Label1: TLabel;
    EditStock: TEdit;
    Label2: TLabel;
    EditPreco: TEdit;
    Label3: TLabel;
    EditDesc: TEdit;
    Label4: TLabel;
    Button1: TButton;
    Memo1: TMemo;
    EditCategoria: TEdit;
    Label5: TLabel;
    EditCod: TEdit;
    Label6: TLabel;
    EditGenero: TEdit;
    Label7: TLabel;
    EditMarca: TEdit;
    Label8: TLabel;
    EditCodBar: TEdit;
    Label9: TLabel;
    EditPeso: TEdit;
    Label10: TLabel;
    EditLargura: TEdit;
    Label11: TLabel;
    EditAltura: TEdit;
    Label12: TLabel;
    IdHTTP: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    EditProfundidade: TEdit;
    Label13: TLabel;
    procedure Button1Click(Sender: TObject);
  private
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
  AURL: String;
  Aproduto: Tproduto;
  Avariants: Tvariants;
  AstringJson: string;
  AstringJsonRequire: TstringStream;
begin

Aproduto := Tproduto.Create;
try
  Aproduto.name := editNome.Text;
  Aproduto.description := editDesc.Text;
  Aproduto.id := strToInt(EditCod.Text);
  Aproduto.brand := EditMarca.Text;

  SetLength(AProduto.Fvariants, 0);
  Avariants := Tvariants.Create;
  Avariants.stock := strToInt(editStock.Text);
  Avariants.price := (EditPreco.Text);
  Avariants.gender := EditGenero.Text;
  Avariants.barcode := strToInt(EditCodBar.Text);
  Avariants.weight := (EditPreco.Text);
  Avariants.width := (EditLargura.Text);
  Avariants.height := (EditAltura.Text);
  Avariants.sku := strToInt(EditCod.Text);
  Avariants.depth := EditProfundidade.Text;

  SetLength(AProduto.Fvariants, length(AProduto.Fvariants) +1);
  AProduto.Fvariants[High(AProduto.Fvariants)] := Avariants;

SetLength(AProduto.Fcategories, 0);
if (editCategoria.text <> '') then
  begin
    SetLength(AProduto.Fcategories, length(AProduto.Fcategories) +1);
    Aproduto.Fcategories[High(AProduto.Fcategories)] := (editCategoria.text);
  end;

  AstringJson := Tjson.ObjectToJsonString(Aproduto);
  memo1.Lines.Text := AstringJson;

  AURL := 'https://api.tiendanube.com/v1/2933236/products';
  IdSSLIOHandlerSocketOpenSSL.SSLOptions.Method := sslvTLSv1_2;
  IdHTTP.ReadTimeout := 5000;
  IdHTTP.Request.ContentType := 'application/json';
  IdHTTP.Request.Charset := 'UTF-8';
  IdHTTP.Request.CustomHeaders.Values['Authentication'] := 'bearer ef035e9a6ad43f2e8d6374a9bf5a32ec122afca1';
  IdHTTP.Request.CustomHeaders.Values['User-Agent'] := 'VEXCOM SISTEMAS (suporte@vexcomsistemas.com.br)';

AstringJsonRequire := TstringStream.create;
try
  AstringJsonRequire.WriteString(AstringJson);
  IdHTTP.Post(AURL,AstringJsonRequire);
finally

end;

finally
  Aproduto.Free;
end;

end;
end.

