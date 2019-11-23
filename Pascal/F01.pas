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
        if ( isAdmin(nama) ) then
        begin
           writeln('User admin telah login'); 
        end ;

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
                {writeln(jmlTrain);
                writeln(user);
                for i := 1 to user do
                begin
                    writeln(TTrain[i].Nama);   
                end;}
                    
                    
                TTrain[user].Nama := nama;
                TTrain[user].Day_Passed := '0';
                TTrain[user].File_Inventori := 'Inventori_'+nama+'.csv';
                TTrain[user].File_Stats := 'stats_'+nama+'.csv';
                jmlInv := 0;
                jmlStats:=0;
                //savetrainer('trainer.csv');
                saveStats('Inventori_'+nama+'.csv');
                saveinventori('stats_'+nama+'.csv');
                
                
            end ;
            
                InvenCSVtoArray(TTrain[user].File_Inventori);
                StatsCSVtoArray(TTrain[user].File_Stats);

        
        
    end;
end.