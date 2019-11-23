unit F06;

interface
    uses 
        PokebonCSV,sysutils,F03,F05;
    procedure tangkap();

implementation
    procedure tangkap();
    var
        i : integer;
        new : string;
    begin
        //writeln('sebelum',jmlInv);
        new := EncounterChance(Tencounter, Tencounter.Neff);
        writeln('Kamu mendapatkan: ',new);
        writeln('Isi inventori saat ini:');
        jmlInv := jmlInv+1;
        TInv[jmlInv-1].Nomor_Inventori := IntToStr(jmlInv-1);
        TInv[jmlInv-1].Nama_Pokebon := new;
        TInv[jmlInv-1].Level := '1';
        TInv[jmlInv-1].Kondisi := 'lelah';
        listInven();
    end;
end.