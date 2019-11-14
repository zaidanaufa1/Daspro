interface
    uses
        PokebonCSV;
    procedure EvoPok();

implementation

    procedure EvoPok();
    var
        inp : integer;
        ketemu : boolean;
        i : integer;
    begin
        ketemu :=False;
        i:=1
        writeln('Masukkan nomor pokebon yang ingin dievolusi: ');readln(inp);
        if(TInv[inp].Level >= 5)then
        begin
            while(not ketemu)do
            begin
                if(TInv[inp].Nama_Pokebon = TPok[i].Nama )then//cari nama pokebon di inventori pada arr pokebon baris berapa
                begin
                    ketemu := True;
                end else
                begin
                    i := i+1;
                end;
            end;//udah ketemu
            if(TPok[i].Evolusi_Selanjutnya = '-')then
            begin
                writeln(TInv[inp].Nama_Pokebon,'  sudah merupakan evolusi terakhir');

            end else
            begin
                writeln(TInv[inp].Nama_Pokebon,' telah dievolusi menjadi ',TPok[i].Evolusi_Selanjutnya);
                TInv[inp].Nama_Pokebon := TPok[i].Evolusi_Selanjutnya;//assign nama jadi evolusi yang baru
            end;
        end else//kurang level
        begin
            writeln('Tidak ada yang bisa dievolusi');
        end;
    end;