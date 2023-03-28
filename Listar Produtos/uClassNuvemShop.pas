unit uClassNuvemShop;

interface

type
  Tvariants = class
  private
   Fstock: integer;
   Fprice: string;
   Fgender: string;
   Fbarcode: string;
   Fweight: string;
   Fsku: string;
   Fwidth: string;
   Fheight: string;
   Fdepth: string;
 public
   property stock: integer read Fstock write Fstock;
   property price: string read Fprice write Fprice;
   property gender: string read Fgender write Fgender;
   property barcode: string read Fbarcode write Fbarcode;
   property weight: string read Fweight write Fweight;
   property sku: string read Fsku write Fsku;
   property width: string read Fwidth write Fwidth;
   property height: string read Fheight write Fheight;
   property depth: string read Fdepth write Fdepth;
 end;

 TprodutoPedido = class
 private
   Fvariants: Tarray<Tvariants>;
 public
   property variants: Tarray<Tvariants> read Fvariants write Fvariants;
 end;

 TProdutoAtualizacao = class
 private
    Fname: String;
    Fdescription: String;
    Fbrand: String;
 public
   property name: String read Fname write Fname;
   property description: String read Fdescription write Fdescription;
   property brand: String read Fbrand write Fbrand;
 end;

 TProdutoAtualizacaoDetalhe = class
 private
    Fstock: Double;
    Fprice: Double;
    Fweight: Double;
    Fwidth: Double;
    Fheight: Double;
    Fdepth: Double;
    Fbarcode: String;
 public
   property stock: Double read Fstock write Fstock;
   property price: Double read Fprice write Fprice;
   property weight: Double read Fweight write Fweight;
   property width: Double read Fwidth write Fwidth;
   property height: Double read Fheight write Fheight;
   property depth: Double read Fdepth write Fdepth;
   property barcode: String read Fbarcode write Fbarcode;
 end;


 TPedidoItem = class
 private
    Fname: String;
    Fprice: Double;
    Fquantity: Double;
    Fsku: String;
    Fbarcode: String;
    Fproduct_id: String;
 public
   property name: String read Fname write Fname;
   property price: Double read Fprice write Fprice;
   property quantity: Double read Fquantity write Fquantity;
   property sku: String read Fsku write Fsku;
   property barcode: String read Fbarcode write Fbarcode;
   property product_id: String read Fproduct_id write Fproduct_id;
 end;

 TEnderecoCliente = class
 private
    FAddress: String;
    Fcity: String;
    Fcountry: String;
    Ffloor: String;
    Fname: String;
    Fnumber: String;
    Fphone: String;
    Fprovince: String;
    Fzipcode: String;
 public
   property Address: String read FAddress write FAddress;
   property city: String read Fcity write Fcity;
   property country: String read Fcountry write Fcountry;
   property floor: String read Ffloor write Ffloor;
   property name: String read Fname write Fname;
   property number: String read Fnumber write Fnumber;
   property phone: String read Fphone write Fphone;
   property province: String read Fprovince write Fprovince;
   property zipcode: String read Fzipcode write Fzipcode;
 end;

 TCliente = class
 private
    Fname: String;
    Femail: string;
    Fidentification: String;
    Fphone: String;
    Fnote: String;
    Fdefault_address: TEnderecoCliente;
 public
   property name: String read Fname write Fname; 
   property email: string read Femail write Femail;
   property identification: String read Fidentification write Fidentification;
   property phone: String read Fphone write Fphone;
   property note: String read Fnote write Fnote;
   property default_address: TEnderecoCliente read Fdefault_address write Fdefault_address;
 end;

 TPedido = class
 private
    Fid: String;
    Fcontact_email: String;
    Fcontact_name: String;
    Fcontact_phone: String;
    Fsubtotal: Double;
    Fdiscount: Double;
    Ftotal: Double;
    Fcreated_at: String;
    Fcustomer: TCliente;
    Fproducts: Tarray<TPedidoItem>;
    Fnumber: String;
    Fstatus: String;
    Fpaymen_status: String;
    Fgateway_link: String;
    Fshipping_status: String;
    Fshipped_at: String;
 public
   property id: String read Fid write Fid;
   property contact_email: String read Fcontact_email write Fcontact_email;
   property contact_name: String read Fcontact_name write Fcontact_name;
   property contact_phone: String read Fcontact_phone write Fcontact_phone;
   property subtotal: Double read Fsubtotal write Fsubtotal;
   property discount: Double read Fdiscount write Fdiscount;
   property total: Double read Ftotal write Ftotal;
   property created_at: String read Fcreated_at write Fcreated_at;
   property customer: TCliente read Fcustomer write Fcustomer;
   property products: Tarray<TPedidoItem> read Fproducts write Fproducts;
   property number: String read Fnumber write Fnumber;
   property status: String read Fstatus write Fstatus;
   property paymen_status: String read Fpaymen_status write Fpaymen_status;
   property gateway_link: String read Fgateway_link write Fgateway_link;
   property shipping_status: String read Fshipping_status write Fshipping_status;
   property shipped_at: String read Fshipped_at write Fshipped_at;
 end;


  TListaPedido = class
  private
    FResult: TArray<TPedido>;
  public
    property Result: TArray<TPedido> read FResult write FResult;
  end;

  TprodutoCadastro = class
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

  Tcategoria = class
 private
   Fname: string;
 public
   property name: string read Fname write Fname;
end;

  TprodutoAtualizar = class
 public
   Fname: string;
   Fdescription: string;
 private
   property name: string read Fname write Fname;
   property description: string read Fdescription write Fdescription;
 end;

   TProdutoNome = class
  private
    Fpt: String;
  public
    property pt: String read Fpt write Fpt;
  end;

  TProduto = class
  private
    Fname: TProdutoNome;
  public
    property name: TProdutoNome read Fname write Fname;
  end;

  TListaProduto = class
  private
    FResult: TArray<TProduto>;
  public
    property Result: TArray<TProduto> read FResult write FResult;
  end;

implementation

end.
