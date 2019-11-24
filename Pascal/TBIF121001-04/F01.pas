unit F01;

interface
    uses
        PokebonCSV,B02;
    var
        user:integer;//buat cari username di array train
        roleAdmin:boolean;
    procedure login(nama :string);
    function isAdmin(nama:string):boolean;
implementation

    function isAdmin(nama:string):boolean;
    begin
        isAdmin := ( (nama = 'admin') or (nama='Admin'));
    end;

    procedure login(nama : string);
    var
        i:integer;
        cari:boolean;
    
    begin
        cari:=false;
        i:=1;
        roleAdmin := isAdmin(nama);
        

            while( (i<=jmlTrain-1) and (not cari) )do//search user di indeks berapa
            begin
                if(TTrain[i].Nama = nama)then
                begin
                    cari:=true;
                    user :=i;
                end else
                begin   
                i := i+1;
                end;
            end;

            if(not cari)then
            begin
                writeln('Tidak ada username ',nama,' pada database. Sistem akan memulai permainan baru. ');
                jmlTrain := jmlTrain +1;
                user := jmlTrain-1;
                defaultsave(user, nama);
            end;
            
                InvenCSVtoArray(TTrain[user].File_Inventori);
                StatsCSVtoArray(TTrain[user].File_Stats);

        
        
    end;
end.