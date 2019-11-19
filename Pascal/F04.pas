unit F04;

interface
    uses PokebonCSV,F02,sysutils;
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
            for i:=nomor+1 to jmlPokebon do
            begin
                Tpok[i-1].ID_Pokebon := IntToStr(StrToInt(Tpok[i-1].ID_Pokebon)-1);
                Tpok[i-1] := Tpok[i];
                
            end; 
            jmlPokebon := jmlPokebon-1;
            printPokeDex();   
        end;
    end;
end.
