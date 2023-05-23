program Project1;

uses
  Vcl.Forms,
  UnitValidaCpf in 'UnitValidaCpf.pas' {FormValidaCpf},
  UnitGetValidadorCpf in 'UnitGetValidadorCpf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormValidaCpf, FormValidaCpf);
  Application.Run;
end.
