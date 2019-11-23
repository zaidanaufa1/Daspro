unit F03;

interface
    uses 
        PokebonCSV;
    procedure listInven();

implementation
    procedure listInven();
    var
        i : integer;
    begin
        i:=1;
        while i <= jmlInv-1 do
        begin
            writeln( TInv[i].Nomor_Inventori,'|',TInv[i].Nama_Pokebon, '|', TInv[i].Level,'|',TInv[i].kondisi );
            i:=i+1;
        end;
    end;
end.