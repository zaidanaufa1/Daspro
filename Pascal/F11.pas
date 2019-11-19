uses
    PokebonCSV;

interface
    procedure printEvo();

implementation
    procedure printEvo();
    begin
        for i := 1 to jmlEvo do//print baris
        begin
            write(i,'|');
            for j:=1 to last_Ev[i]do//print ada berapa alur evolusinya
            begin
                write(TEvo[i].Alur_Evolusi[j]);//i = baris dan j = alur evolusi ke berapa
                if(j<last_Ev[i])then
                begin
                    write('-');
                end;
            end;
            writeln('');
        end;
    end;