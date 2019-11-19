unit F06;

interface
    uses 
        PokebonCSV,sysutils,F03;
    procedure tangkap();

implementation
    procedure tangkap();
    var
        //i : integer;
    begin
        writeln('Kamu mendapatkan: pikaboo');
        writeln('Isi inventori saat ini:');
        jmlInv := jmlInv+1;
        TInv[jmlInv].Nomor_Inventori := IntToStr(jmlInv);
        TInv[jmlInv].Nama_Pokebon := 'pikaboo';
        TInv[jmlInv].Level := '1';
        TInv[jmlInv].Kondisi := 'lelah';
        listInven();
    end;
end.