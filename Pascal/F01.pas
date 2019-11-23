unit F01;

interface
    uses
        PokebonCSV,F15;
    var
        user:integer;//buat cari username di array train
        roleAdmin:boolean;
    procedure login();
    function isAdmin(nama:string):boolean;
implementation

    function isAdmin(nama:string):boolean;
    begin
        isAdmin := ( (nama = 'admin') or (nama='Admin'));
    end;
    procedure login();
    var
        i:integer;
        nama:string;
        cari:boolean;
    begin
        cari:=false;
        i:=1;
        write('Masukkan username: ');readln(nama);
        roleAdmin := isAdmin(nama);
        

            while( (i<=jmlTrain-1) and (not cari) )do//search user di indeks berapa
            begin
                if(TTrain[i].Nama = nama)then
                begin
                    cari:=true;
                    user :=i;
                end;   
                i := i+1;
            end;

            if(not cari)then
            begin
                writeln('Tidak ada username ',nama,' pada database. Sistem akan memulai permainan baru. ');
                jmlTrain := jmlTrain +1;
                user := jmlTrain-1;
                                        
                TTrain[user].Nama := nama;
                TTrain[user].Day_Passed := '0';
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
                
                
            end ;
            
                InvenCSVtoArray(TTrain[user].File_Inventori);
                StatsCSVtoArray(TTrain[user].File_Stats);

        
        
    end;
end.