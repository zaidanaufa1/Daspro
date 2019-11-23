uses F08,PokebonCSV;

begin
    PokebonCSVtoArray('pokemon.csv');
    InvenCSVtoArray('Inventori.csv');
    EvolutionCSVtoArray('Alur_Evolusi.csv');
    TrainerCSVtoArray('trainer.csv');
    StatsCSVtoArray('stats.csv');

    stats();
    cariUnik();
    printStats();

    
end.
