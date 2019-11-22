unit F05;

interface

uses 
PokebonCSV,sysutils;

{Agar mempermudah setiap pokemon awal/rank1 (yang tidak mempunyai pokemon
yang berevolusi menjadi dirinya(sumber evolusi) memiliki 10(defaultPoke-1) petak array, dan pokemon
yang memiliki sumber evolusi pokemon rank1) meiliki petak array default - 1 ,begitupun setelahnya  )}

    function EncounterChance(Neff : integer):string;
    procedure InputArrEncounter(NamaPokebon: string, IPos :integer, jumlah : integer);
    procedure PrintEncounterChance()
    procedure makeArrEcounterChance()


implementation

    function EncounterChance(Neff : integer):string;
    
        begin
        Randomize;
        EncounterChance := Tencounter.ArrNamaPokebon[(Random(Neff))]
        end;

    procedure InputArrEncounter(NamaPokebon: string, IPos :integer, jumlah : integer);
        begin
        while Ipos <= jumlah do
            begin
            Tencounter.ArrNamaPokebon[Ipos] := NamaPokebon;
            end;
        end;

    procedure PrintEncounterChance()
    
        Const
        defaultPoke :=11;
    
        var
        i : integer;
    
        begin   
        writeln ('Kemungkinan menemukan setiap pokebon:');
        for i := 1 to jmlEvo-1 do
            begin
            while j := 1 to last_Ev[i] do 
            writeln(TEvo[i].Alur_Evolusi[j],' = ', (((defaultPoke * 100) / Tencounter.Neff):0:2), '%')
            end;
        end;

    procedure makeArrEcounterChance()

        Const
        defaultPoke := 11;

        var
        i, j : integer;
        Tencounter : EncounterChance;
        
        begin
        Tencounter.Neff := 1;
        for i := 1 to jmlEvo-1 do
            begin
            for j := 1 to last_Ev[i] do
                begin
                InputArrEncounter((Tevo[i].Alur_Evolusi[j]),Tencounter.Neff,(defaultPoke-j));
                Tencounter.Neff := Tencounter.Neff + (defaultPoke-j);
                j := j + 1;
                end;
            end;
        end;







     
    

