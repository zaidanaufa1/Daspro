uses 
    PokebonCSV,F05;
var
    i:integer;

begin
    StatsCSVtoArray('stats.csv');
    EvolutionCSVtoArray('Alur_Evolusi.csv');
    makeArrEncounterChance();
    {for i:=1 to Tencounter.Neff do
    begin
        writeln(i,' ',Tencounter.ArrNamaPokebon[i]);
    end;}
    writeln(EncounterChance(Tencounter,Tencounter.Neff));

end.
