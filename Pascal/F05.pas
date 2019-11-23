unit F05;

interface

uses 
PokebonCSV,sysutils;

{Agar mempermudah setiap pokemon awal/rank1 (yang tidak mempunyai pokemon
yang berevolusi menjadi dirinya(sumber evolusi) memiliki 10(defaultPoke-1) petak array, dan pokemon rank 2
(yang memiliki sumber evolusi pokemon rank1) meiliki petak array defaultPoke - 2 ,begitupun setelahnya, 
jadi rank X pokemon memiliki petak array defaultPoke - x  }

    function EncounterChance(T: EncounterChance ;Neff : integer):string;
    procedure InputArrEncounter(NamaPokebon: string; IPos , jumlah : integer);
    procedure PrintEncounterChance();
    procedure makeArrEncounterChance();


implementation

    function EncounterChance(T: EncounterChance ;Neff : integer):string;
    
        begin
        {Randomize;}
        EncounterChance := T.ArrNamaPokebon[(Random(Neff))];
        end;

    procedure InputArrEncounter(NamaPokebon: string; IPos , jumlah : integer);
        var
        count : integer;

        begin
        count := 1;
        repeat
        Tencounter.ArrNamaPokebon[Ipos] := NamaPokebon;
            ipos := ipos +1;
            count := count +1;            
        until count > jumlah; 
        end;

    procedure PrintEncounterChance();
    
        Const
        defaultPoke =11;
    
        var
        i,j : integer;
        persen : single;
    
        begin   
        writeln ('Kemungkinan menemukan setiap pokebon:');
        for i := 1 to jmlEvo-1 do
                begin
                persen := ((((defaultPoke-j) * 100)/Tencounter.Neff));
                writeln(TEvo[i].Alur_Evolusi[j],' = ',persen:0:2, '%');
                end;
        end;

    procedure makeArrEncounterChance();

        Const
        defaultPoke = 11;

        var
        i, j : integer;
        
        begin
        Tencounter.Neff := 1;
        for i := 1 to jmlEvo-1 do
            begin
            for j := 1 to last_Ev[i] do
                begin
                InputArrEncounter((Tevo[i].Alur_Evolusi[j]),Tencounter.Neff,(defaultPoke-j));
                Tencounter.Neff := Tencounter.Neff + (defaultPoke-j);
                end;
            end;
        Tencounter.Neff := Tencounter.Neff-1;    
        end;
end.






     
    

