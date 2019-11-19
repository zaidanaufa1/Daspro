unit F04;

interface
    uses PokebonCSV,F03,sysutils;
procedure pelepasan();

implementation
    procedure pelepasan();
    var
        nomor:integer;
        i :integer;
    begin
        write('Masukkan nomor yang ingin dilepas: ');readln(nomor);
        if(nomor>jmlPokebon)then
        begin
            writeln('Tidak ada pokebon pada nomor inventori: ',nomor);
        end else
        begin
            writeln('Pelepasan berhasil');
            for i:=nomor+1 to jmlInv-1 do
            begin
                TInv[i-1].Nomor_Inventori := IntToStr(StrToInt(TInv[i-1].Nomor_Inventori)-1);
                TInv[i-1] := TInv[i];
                
            end; 
            jmlPokebon := jmlPokebon-1;
            listInven();   
        end;
    end;
end.
