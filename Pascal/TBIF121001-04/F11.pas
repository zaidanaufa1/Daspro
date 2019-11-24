unit F11;


interface
    uses
        PokebonCSV;
    procedure printEvo();

implementation
    procedure printEvo();
    var
        i,j:integer;
    begin
        writeln('List alur evolusi:');
        for i := 1 to jmlEvo-1 do//print baris
        begin
            write(TEvo[i].ID_Evolusi,'|');
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
end.