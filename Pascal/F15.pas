unit F15;
interface
uses
    PokebonCSV;
procedure save;
procedure saveStats(NamaFile : string);
procedure savepokebon(NamaFile : string);

procedure saveevolusi(NamaFile: string);
procedure saveinventori(NamaFile: string);
procedure savetrainer(NamaFile:string);


implementation
    procedure savetrainer(NamaFile : string);
        var
        CSV : Text ;
        i : integer;
        isi : string;

        begin
        Assign(CSV,NamaFile);
        i := 0;
        Rewrite(CSV);
        if jmlTrain =0 then
        begin
            writeln(CSV,'');
        end else
        begin
            while i <= jmlTrain-1 do 
            begin
            isi := '';
            isi := isi + ((TTrain[i].Nama)+','+(TTrain[i].Day_Passed)+','+(TTrain[i].File_Inventori)+','+(TTrain[i].File_Stats));
            writeln(CSV,isi);
            i := i +1;
            end;
        close(CSV)   
        end;
        
    end;

    procedure saveinventori(NamaFile : string);
        var
        CSV : Text ;
        i : integer;
        isi : string;

        begin
        Assign(CSV,NamaFile);
        i := 0;
        Rewrite(CSV);
        if jmlTrain =0 then
        begin
            writeln(CSV,'');
        end else
        begin
        while i <= jmlInv-1 do 
            begin
            isi := '';
            isi := isi + ((TInv[i].Nomor_Inventori)+','+(TInv[i].Nama_Pokebon)+','+(TInv[i].Level)+','+(TInv[i].Kondisi));
            writeln(CSV,isi);
            i := i +1;
            end;
        close(CSV)
        end;
    end;
    procedure saveevolusi(NamaFile : string);
        var
        CSV : Text ;
        i : integer;
        isi : string;
        j:integer;

        begin
        Assign(CSV,NamaFile);
        i := 0;
        
        Rewrite(CSV);
        if jmlTrain =0 then
        begin
            writeln(CSV,'');
        end else
        begin
        while i <= jmlEvo-1 do 
            begin
            j:=1;
            isi :='';
            isi:=isi+TEvo[i].ID_Evolusi+',';
            while j <= last_Ev[i] do
            begin
                if((j>1) and (j<last_Ev[i]+1) )then
                begin
                    isi:=isi+'-';
                end;
                isi:=isi+TEvo[i].Alur_Evolusi[j];
                j := j+1;
            end;
            writeln(CSV,isi);
            i := i +1;
            end;
        close(CSV)
        end;
    end;
    procedure saveStats(NamaFile : string);
        var
        CSV : Text ;
        i : integer;
        isi : string;

        begin
        Assign(CSV,NamaFile);
        i := 0;
        Rewrite(CSV);
        if jmlTrain =0 then
        begin
            writeln(CSV,'');
        end else
        begin
        while i <= jmlStats-1 do 
            begin
            isi := '';
            isi := isi + ((TStats[i].Nama_Pokebon)+','+(TStats[i].Max_Level));
            writeln(CSV,isi);
            i := i +1;
            end;
        close(CSV)
        end;
    end;
    procedure savepokebon(NamaFile : string);
        var
        CSV : Text ;
        i : integer;
        isi : string;

        begin
        Assign(CSV,NamaFile);
        i := 0;
        Rewrite(CSV);
        if jmlTrain =0 then
        begin
            writeln(CSV,'');
        end else
        begin
        while i <= jmlPokebon-1 do 
            begin
            isi := '';
            isi := isi + ((TPok[i].ID_Pokebon)+','+(TPok[i].Nama)+','+(TPok[i].Tipe)+','+(TPok[i].Evolusi_Selanjutnya));
            writeln(CSV,isi);
            i := i +1;
            end;
        close(CSV)
        end;
    end;
      
        
    procedure save();
        var
        NamaFilePok,NamaFileEvo, NamaFileInv, NamaFileStat : string;
        
        begin
            
                write('Tulis nama File save untuk pokebon: ');
                readln(NamaFilePok);
                savepokebon(NamaFilePok);
                write('Tulis nama File save untuk Evolusi');
                readln(NamaFileEvo);
                saveevolusi(NamaFileEvo);
        
                write('Tulis nama File save untuk Inventori');
                readln(NamaFileInv);
                saveinventori(NamaFileInv);
                write('Tulis nama File save untuk Stats');
                readln(NamaFileStat);
                saveStats(NamaFileStat);
       end; 
end.
