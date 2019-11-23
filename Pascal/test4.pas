
uses
PokebonCSV, F05;
var
i : integer;
enemy : string;

begin
    EvolutionCSVtoArray('Alur_Evolusi.csv');
    makeArrEncounterChance();
    {for i := 1 to Tencounter.Neff do
        begin
        writeln(Tencounter.ArrNamaPokebon[i]); 
        end;}
    enemy := EncounterChance(Tencounter, Tencounter.Neff);
    writeln(enemy);
end.