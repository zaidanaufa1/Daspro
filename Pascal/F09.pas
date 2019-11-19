unit F09;

interface
    uses
        PokebonCSV,sysutils;
    procedure tambahPokebon();

implementation
    procedure tambahPokebon();
    var 
        inp_nama : string;
        inp_jenis : string;
        ketemu : boolean;
        indeks : integer;
    begin
        write('Nama pokebon  yang ingin dibuat: ');readln(inp_nama);
        write('Tipe pokebon  yang ingin dibuat: ');readln(inp_jenis);
        indeks:=1;
        ketemu := False;
        repeat
            if (TPok[indeks].Nama = inp_nama) then//dobel
            begin
                ketemu := True;
                //TInv[indeks].Level := TInv[indeks].Level + 1;
            end else
            begin
                indeks:=indeks+1;
            end;
        until ( (ketemu) or (indeks>jmlPokebon) );
        if(ketemu)then
        begin
            writeln('Terdapat kesalahan pada pembuatan pokebon');
        end else
        begin
            jmlPokebon := jmlPokebon +1;
            TPok[jmlPokebon].ID_Pokebon := IntToStr(jmlPokebon);
            TPok[jmlPokebon].Nama := inp_nama;
            TPok[jmlPokebon].Tipe := inp_jenis;
            TPok[jmlPokebon].Evolusi_Selanjutnya:='-';
            writeln('Pokebon baru berhasil dibuat');
        end;
    end;
end.