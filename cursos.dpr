program cursos;

uses
  Vcl.Forms,
  sysutils,
  Uacesso in 'Uacesso.pas' {frmLogin},
  Unit1 in 'Unit1.pas' {frmClienteNovo},
  UProd in 'UProd.pas' {frmProd};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown := True;
  Application.CreateForm(TfrmClienteNovo, frmClienteNovo);
  Application.Run;

end.
