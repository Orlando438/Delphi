unit UnitGetValidadorCpf;

interface

function VAlidaCpf(_ACpf: String; _AValidoSeVazio: Boolean= False; _AValidoSeZerado: Boolean = False): Boolean;
function ValidaCnpj(_ACnpj: String; _AValidoSeVazio: Boolean= False; _AValidoSeZerado: Boolean = False): Boolean;
function RetiraCaracteresNaoNumericos(_AValor : string) : string;
implementation

uses system.SysUtils;

function RetiraCaracteresNaoNumericos(_AValor : string) : string;
var
  i : Integer;
begin
  result := '';
  for i := 1 to Length(_AValor) do
  if _AValor[i] in ['0'..'9'] then
     result := result + _AValor[i];
end;

function SomenteNumeros(_AValor: string): boolean;
var
  i:integer;
begin
  Result := True;
  if (_AValor = '') then
    Result := False;
  for i:= 1 to Length(_AValor) do
  begin
    if (copy(_AValor,i,1) <> '0' ) and (copy(_AValor,i,1) <> '1' ) and (copy(_AValor,i,1) <> '2' )
       and (copy(_AValor,i,1) <> '3' ) and (copy(_AValor,i,1) <> '4' ) and (copy(_AValor,i,1) <> '5' )
       and (copy(_AValor,i,1) <> '6' ) and (copy(_AValor,i,1) <> '7' ) and (copy(_AValor,i,1) <> '8' )
       and (copy(_AValor,i,1) <> '9' ) then
      Result := False;
  end;
end;

function TodosNumerosZerados(_ANroDocumento : string) : Boolean;
var
  j: Integer;
begin
  result := true;
  for j := 1 to Length(_ANroDocumento) do
  begin
    if _ANroDocumento[j] <> '0' then
    begin
      result := False;
      Exit;
    end;
  end;
end;

function ValidaCnpj(_ACnpj: String; _AValidoSeVazio: Boolean= False; _AValidoSeZerado: Boolean = False): Boolean;

   procedure DefineRetornoEFinaliza(_ARetorno : boolean);
   begin
     result := _ARetorno;
     Abort;
   end;
var
  ADigito1, ADigito2: Integer;
  ASoma: Integer;
  i: Integer;
begin
  result := False;
  if not(SomenteNumeros(_ACnpj)) then
  begin
    //DefineRetornoEFinaliza(false);
    result := false;
    Exit;
  end;

  if (_ACnpj = '') and (_AValidoSeVazio) then
  begin
    //DefineRetornoEFinaliza(true);
    result := true;
    Exit;
  end;

  if (not _AvalidoseZerado) and (TodosNumerosZerados(_ACnpj)) then
  begin
    //DefineRetornoEFinaliza(false);
    result := false;
    Exit;
  end;

  if Length(_ACnpj) <> 14 then
  begin
    //DefineRetornoEFinaliza(false);
    result := false;
    Exit;
  end;

  ASoma := 0;

  for i := 1 to 12 do
  begin
    if i < 5 then
      ASoma := ASoma + StrToInt(Copy(_ACnpj, i, 1)) * (6 - i)
    else
      ASoma := ASoma + StrToInt(Copy(_ACnpj, i, 1)) * (14 - i)
  end;
  ADigito1 := 11 - (ASoma mod 11);
  if ADigito1 > 9 then
    ADigito1 := 0;

  ASoma := 0;
  for i := 1 to 13 do
  begin
    if i < 6 then
      ASoma := ASoma + StrToInt(Copy(_ACnpj, i, 1)) * (7 - i)
    else
      ASoma := ASoma + StrToInt(Copy(_ACnpj, i, 1)) * (15 - i)
  end;
  ADigito2 := 11 - (ASoma mod 11);
  if ADigito2 > 9 then
    ADigito2 := 0;

  result := ((ADigito1 = StrToInt(_ACnpj[13])) and (ADigito2 = StrToInt(_ACnpj[14])));
end;

  function VAlidaCpf(_ACpf: String; _AValidoSeVazio: Boolean= False; _AValidoSeZerado: Boolean = False): Boolean;
var
  ACpfLocal: string;
  ADigito1, ADigito2: Integer;
  i: Integer;
  ASoma: Integer;
  ACalc: Integer;

  function TodosDigitosIguais: Boolean;
  var
    j, k: Integer;
  begin
    result := False;
    for j := 1 to 9 do
    begin
      if result then
        Break;
      for k := 1 to Length(ACpfLocal) do
      begin
        result := (ACpfLocal[k] = inttostr(j));
        if not result then
           break;
      end;
    end;
  end;

begin
  result := False;
  if not(SomenteNumeros(_ACpf)) then
    Exit;

  if (_ACpf = '') and (_AValidoSeVazio) then
  begin
    result := true;
    Exit;
  end;

  // SE NAO TEM 11 CARACTERES
  if (Length(_ACpf) <> 11) then
    Exit;

  if (_ACpf <> '') and (not _AvalidoseZerado) then
  begin
    if TodosNumerosZerados(_ACpf) then
      Exit;
  end;

  ACpfLocal := _ACpf;

  // SE TODOS OS NÚMEROS SAO IGUAIS ENTAO RETORNA
  (*result := TodosDigitosIguais;
  if result then
    Exit;
  *)
  if TodosDigitosIguais then
  begin
    result := false;
    Exit;
  end;

  ASoma := 0;
  for i := 1 to 9 do
  begin
    ACalc := StrToInt(Copy(ACpfLocal, 10 - i, 1)) * (i + 1);
    ASoma := ASoma + ACalc;
  end;
  ADigito1 := 11 - (ASoma Mod 11);
  if ADigito1 > 9 then
    ADigito1 := 0;

  ASoma := 0;
  for i := 1 to 10 do
  begin
    ACalc := StrToInt(Copy(ACpfLocal, 11 - i, 1)) * (i + 1);
    ASoma := ASoma + ACalc;
  end;
  ADigito2 := 11 - (ASoma Mod 11);
  if ADigito2 > 9 then
    ADigito2 := 0;

  result := ((ADigito1 = StrToInt(ACpfLocal[10])) and (ADigito2 = StrToInt(ACpfLocal[11])));
end;


end.
