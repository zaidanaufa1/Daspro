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
        for i:=1 to jmlInv do
        begin
            writeln( TInv[i].Nomor_Inventori,'|',TInv[i].Nama_Pokebon, '|', TInv[i].Level,'|',TInv[i].kondisi );
        end;
    end;
end.