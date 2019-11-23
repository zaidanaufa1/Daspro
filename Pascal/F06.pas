unit F06;

interface
    uses 
        PokebonCSV,sysutils,F03;
    procedure tangkap();

implementation
    procedure tangkap();
    var
        i : integer;
        enemy : string;
    begin
        //writeln('sebelum',jmlInv);
        //enemy := EncounterChance(Tencounter, Tencounter.Neff);
        writeln('Kamu mendapatkan: pikaboo');
        writeln('Isi inventori saat ini:');
        jmlInv := jmlInv+1;
        TInv[jmlInv-1].Nomor_Inventori := IntToStr(jmlInv-1);
        TInv[jmlInv-1].Nama_Pokebon := 'pikaboo';
        TInv[jmlInv-1].Level := '1';
        TInv[jmlInv-1].Kondisi := 'lelah';
        listInven();
    end;
end.