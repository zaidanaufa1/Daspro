unit F08;

interface
    uses 
        PokebonCSV,F01,F15;

    var
        unik :integer;
    procedure stats();
    procedure printStats();
implementation
    procedure stats();
    var
        i,j:integer;
        cari:boolean;
    begin
        for i:=1 to jmlInv-1 do
        begin
            j:=1;
            cari := false;
            while ((not cari) and (j<=jmlStats-1))do
            begin
                if(TInv[i].Nama_Pokebon = TStats[j].Nama_Pokebon)then
                begin
                    if(TInv[i].Level>TStats[j].Max_Level)then
                    begin
                        TStats[j].Max_Level := TInv[i].Level;
                    end;
                    cari := True;

                end; 
                j := j+1;
            end;
            if(not cari)then
            begin
                jmlStats := jmlStats +1;
                TStats[jmlStats-1].Nama_Pokebon := TInv[i].Nama_Pokebon;
                TStats[jmlStats-1].Max_Level := TInv[i].Level;
            end;
            
        end;
    end;

    
    procedure printStats();
    var
        i:integer;
    begin
        writeln('Sekarang adalah hari ke-',TTrain[user].Day_Passed);
        writeln('Pokebon unik yang dimiliki:',jmlStats-1,'/',jmlInv-1);
        writeln('Maksimum level dari setiap pokebon:');
        i:=1;
        while i <= jmlStats-1 do
        begin
            writeln(TStats[i].Nama_Pokebon,'|',TStats[i].Max_Level);
            i :=i+1;
        end;
    end;
end.