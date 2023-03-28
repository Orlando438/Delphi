unit UProd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Uacesso, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Vcl.ComCtrls, math;

type
  TfrmProd = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    FDProdutos: TFDConnection;
    FDQuery2: TFDQuery;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FDQuery2BeforePost(DataSet: TDataSet);
    procedure DataSource1UpdateData(Sender: TObject);
    procedure FDQuery2AfterOpen(DataSet: TDataSet);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProd: TfrmProd;

implementation

{$R *.dfm}


procedure TfrmProd.DataSource1UpdateData(Sender: TObject);
var diasAtraso: TDateTime;
    valor1, valor2, juros: Real;
begin
  diasAtraso := FDQuery2.FieldByNAme('parc_datapagto').asDateTime  -
  FDQuery2.FieldByNAme('parc_datavencto').asDateTime;

  if diasAtraso >0 then
  begin
    valor1 := (1+(0.01 * 0.2));
    valor2 := Power(valor1, diasAtraso);
    juros := (FDQuery2.FieldByName('parc_valorparc').value * valor2) -
                FDQuery2.FieldByName('parc_valorparc').value;

    FDQuery2.FieldByName('parc_juros').value := juros;
  end
  else
    FDQuery2.FieldByName('parc_juros').Value := 0;


end;

procedure TfrmProd.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (FDQuery2.FieldByName('parc_saldo').Value = 0)   then
  begin
  DBGrid1.Canvas.Brush.Color := clGreen;
  DBGrid1.Canvas.font.Color := clWhite;
  DBGrid1.DefaultDrawColumnCell(rect, datacol, column, state);
  end
  else
  DBGrid1.Canvas.Brush.Color := clRed;
  DBGrid1.Canvas.font.Color := clWhite;
  DBGrid1.DefaultDrawColumnCell(rect, datacol, column, state);
end;

procedure TfrmProd.FDQuery2AfterOpen(DataSet: TDataSet);
begin
  tfloatfield(FDQuery2.FieldByName('parc_valorparc')).DisplayFormat := ',0.00';
  tfloatfield(FDQuery2.FieldByName('parc_juros')).DisplayFormat := ',0.00';
  tfloatfield(FDQuery2.FieldByName('parc_desconto')).DisplayFormat := ',0.00';
  tfloatfield(FDQuery2.FieldByName('parc_valorpago')).DisplayFormat := ',0.00';
  tfloatfield(FDQuery2.FieldByName('parc_saldo')).DisplayFormat := ',0.00';

  //tfloatfield(FDQuery2.FieldByName('parc_valorparc')).DisplayFormat := ',0.00' ;
end;

procedure TfrmProd.FDQuery2BeforePost(DataSet: TDataSet);
begin
  FDQuery2.FieldByNAme('parc_saldo').Asfloat :=
  FDQuery2.FieldByNAme('parc_valorparc').Asfloat +
  FDQuery2.FieldByNAme('parc_juros').Asfloat -
  FDQuery2.FieldByNAme('parc_desconto').Asfloat -
  FDQuery2.FieldByNAme('parc_valorpago').Asfloat ;
end;


procedure TfrmProd.FormCreate(Sender: TObject);
begin
  FDQuery2.SQL.Text := 'SELECT * FROM parcelas';
  FDQuery2.Open;

  DBGrid1.Columns[0].Title.Caption := 'Parcela';
  DBGrid1.Columns[1].Title.Caption := 'Código';
  DBGrid1.Columns[2].Title.Caption := 'Valor';
  DBGrid1.Columns[3].Title.Caption := 'Data Venc.';
  DBGrid1.Columns[4].Title.Caption := 'Data Pagto';
  DBGrid1.Columns[5].Title.Caption := 'Juros';
  DBGrid1.Columns[6].Title.Caption := 'Desconto';
  DBGrid1.Columns[7].Title.Caption := 'Valor Pago';
  DBGrid1.Columns[8].Title.Caption := 'Número Banco';
  DBGrid1.Columns[9].Title.Caption := 'Saldo';

end;


end.
