
uses
PokebonCSV, F05;
var
i : integer;
enemy : string;

begin
    EvolutionCSVtoArray('Alur_Evolusi.csv');
    makeArrEncounterChance();
    for i := 1 to Tencounter.Neff do
        begin
        writeln(Tencounter.ArrNamaPokebon[i]); 
        end;
   { Randomize;
    writeln(Random(Tencounter.Neff));}
    {enemy := Tencounter.ArrNamaPokebon[(Random(Tencounter.Neff))];
    writeln(enemy);}
end.