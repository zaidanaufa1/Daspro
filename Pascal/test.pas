uses 
    PokebonCSV,F09,F10,F15;
var
    i:integer;

begin
    PokebonCSVtoArray('pokemon.csv');
    EvolutionCSVtoArray('Alur_Evolusi.csv');
    for i:=1 to jmlPokebon-1 do
            begin
                //writeln(Tpok[i].nama);
                if(TPok[i].Evolusi_Selanjutnya='-')then
                begin
                    AddEvolution(TPok[i].Nama,'','test');
                end else
                begin
                    AddEvolution(TPok[i].Nama,TPok[i].Evolusi_Selanjutnya,'test');
                end; 
            end;
    saveevolusi('Alur_Evolusi.csv');

end.
