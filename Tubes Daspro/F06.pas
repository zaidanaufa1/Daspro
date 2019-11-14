interface
    uses 
        PokebonCSV;
    procedure tangkap();

implementation
    procedure tangkap();
    var
        i : integer;
    begin
        writeln('Kamu mendapatkan: ');
        writeln('Isi inventori saat ini:');
        for  i:=1 to jmlInv do
        begin
            writeln(TInv[i].Nomor_Inventori,'|',TInv[i].Nama_Pokebon,'|',TInv[i].Level,'|',TInv[i].Kondisi);

        end;
    end;
