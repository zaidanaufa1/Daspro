unit F01;

interface
    uses
        PokebonCSV;
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
        end else
        begin
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
                TTrain[jmlTrain].Nama := nama;
                TTrain[jmlTrain].File_Inventori := 'Inventori.csv';
                TTrain[jmlTrain].File_Stats := 'stats.csv';
                InvenCSVtoArray(TTrain[user].File_Inventori);
                StatsCSVtoArray(TTrain[user].File_Stats);
                user := jmlTrain;
            end else
            begin
                InvenCSVtoArray(TTrain[user].File_Inventori);
                StatsCSVtoArray(TTrain[user].File_Stats);
            end;   
        end;
        
    end;
end.