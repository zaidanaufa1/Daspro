unit F04

interface
    uses F02;
procedure pelepasan();

implementation
    procedure pelepasan();
    var
        nomor:integer;
    begin
        write('Masukkan nomor yang ingin dilepas: ');readln(nomor);
        if(nomor>jmlPokebon)then
        begin
            writeln('Tidak ada pokebon pada nomor inventori: ',nomor);
        end else
        begin
            for int i:=nomor+1 to jmlPokebon do
            begin
                Tpok[i-1] := Tpok[i];
                Tpok[i-1].ID_Pokebon := Tpok[i-1].ID_Pokebon - 1;
            end; 
            jmlPokebon := jmlPokebon-1;
            printPokeDex();   
        end;
    end;

