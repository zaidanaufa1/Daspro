unit B02;
interface
    uses
        PokebonCSV,F15;
    var
        user:integer;//buat cari username di array train
        
    procedure defaultsave(user : integer; nama : string);

implementation

procedure defaultsave(user : integer; nama : string);
    begin
    TTrain[user].Nama := nama;
    TTrain[user].Day_Passed := '1';
    TTrain[user].File_Inventori := 'Inventori_'+nama+'.csv';
    TTrain[user].File_Stats := 'stats_'+nama+'.csv';
    jmlInv := 2;
    jmlStats:=2;
    //Inven default
    TInv[0].Nomor_Inventori:='No_Inventori';
    TInv[0].Nama_Pokebon:='Nama_Pokebon';
    TInv[0].Level:='Level';
    TInv[0].Kondisi:='Kondisi';
    TInv[1].Nomor_Inventori:='1';
    TInv[1].Nama_Pokebon:='Pikaboo';
    TInv[1].Level:='1';
    TInv[1].Kondisi:='sehat';

    //stats default
    TStats[0].Nama_Pokebon:='Nama_Pokebon';
    TStats[0].Max_Level := 'Max_Level';
    TStats[1].Nama_Pokebon:='Pikaboo';
    TStats[1].Max_Level:='1';

    saveStats('stats_'+nama+'.csv');
    saveinventori('Inventori_'+nama+'.csv');
    savetrainer('trainer.csv');
end;
end.