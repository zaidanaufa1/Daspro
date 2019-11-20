unit F12;

interface
    uses
        PokebonCSV,sysutils,F11;
    
    procedure hapusEvo();
    procedure batas();
implementation
    procedure hapusEvo();
    var
        i,j,x,baris,kolom : integer;
        evolve : string;
        foundi,foundj : boolean;
    begin
        foundi := false;
        foundj :=false;
        write('Masukan evolusi yang ingin dihapus : ');
        readln(evolve);
        writeln('');
        baris:=1;
        while (not foundi) and (baris<=jmlEvo-1) do
        begin
            if TEvo[baris].ID_Evolusi = evolve then
            begin
                for j:=baris to (jmlEvo-2) do
                begin
                    TEvo[j].Alur_Evolusi := TEvo[j+1].Alur_Evolusi;
                    last_Ev[j] := last_Ev[j+1];
                end;
                jmlEvo := (jmlEvo-1);
                foundi := true;
            end else
            begin
                baris:= baris+1;
            end;
        end;
        if (not foundi) then
        begin
            baris:=1;
            while (not foundj) and (baris<=(jmlEvo-1)) do
            begin
                kolom :=1;
                i:=1;
                x:=1;
                while (not foundj) and (kolom<=last_Ev[baris]) do
                begin
                    if TEvo[baris].Alur_Evolusi[kolom] = evolve then
                    begin
                        foundj :=true;
                        
                        TEvo[baris].Alur_Evolusi[kolom] :='';
                        if kolom = 1 then
                        begin
                            if last_Ev[baris] =1 then
                            begin
                                for j:=baris to (jmlEvo-2) do
                                begin
                                    TEvo[j].Alur_Evolusi := TEvo[j+1].Alur_Evolusi;
                                    last_Ev[j] := last_Ev[j+1];
                                end;
                                jmlEvo := (jmlEvo-1);
                            end else
                            begin
                                for i:=(kolom+1) to (last_Ev[baris]) do
                                begin
        
                                    TEvo[baris].Alur_Evolusi[x] :=TEvo[baris].Alur_Evolusi[i];
                                    x:= x+1;
                                end;
                                last_Ev[baris] := last_Ev[baris]-1;
                            end;
                        end else if kolom = last_Ev[baris] then
                        begin
                            TEvo[baris].Alur_Evolusi[kolom] :='';
                            last_Ev[baris]:=last_Ev[baris]-1;
                        end else
                        begin
                            i:= jmlEvo+1;
                            repeat
                                TEvo[i-1].Alur_Evolusi := TEvo[i-2].Alur_Evolusi;
                                last_Ev[i]:= last_Ev[i-1];
                                i:= i-1;
                            until (i=(baris+1));
                            jmlEvo := jmlEvo+1;
                            TEvo[jmlEvo-1].ID_Evolusi := IntToStr(StrToInt(TEvo[jmlEvo-2].ID_Evolusi)+1);
                            for i:=(kolom+1) to (last_Ev[baris]) do
                            begin
                                TEvo[baris+1].Alur_Evolusi[x] :=TEvo[baris].Alur_Evolusi[i];
                                TEvo[baris].Alur_Evolusi[i] :='';
                                x:= x+1;
                            end;
                            last_Ev[baris] := kolom-1;
                            last_Ev[baris+1] := x-1;
                        end;
                    end else
                    begin
                        kolom := kolom+1;
                        writeln('kolom ',kolom);
                    end;
                end;
                baris := baris+1;
                writeln('baris ',baris);
            end;
        end;
    end;
    procedure batas();
    begin
        writeln('------------------------------------');
    end;
end.