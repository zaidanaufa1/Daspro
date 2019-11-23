unit F10;

interface
    uses 
        PokebonCSV,sysutils;
    procedure AddEvolution();
implementation   
    procedure AddEvolution();
    var
        bfr : string;//sblm evo
        aftr : string;//sesudah evo
        i: integer;
        j : integer;
        cari1 : boolean;baris1:integer;kolom1:integer;
        cari2 : boolean;baris2:integer;kolom2:integer;
    begin
        
        i := 1;//baris dari 1 karena yang 0 itu header
        cari1 := False;
        cari2 :=False;
        write('Masukkan nama pokebon sebelum evolusi: ');readln(bfr);
        write('Masukkan nama pokebon sesudah evolusi: ');readln(aftr);
        while (i<=jmlEvo-1) do
        begin
            j:=1;
            while (j<=last_Ev[i] )do
            begin
                writeln(TEvo[i].Alur_Evolusi[j] ,' ', bfr);
                if(TEvo[i].Alur_Evolusi[j] = bfr)then
                begin
                    cari1 := True;
                    baris1 := i;
                    kolom1 := j;
                end else if (TEvo[i].Alur_Evolusi[j] = aftr) then
                begin
                    cari2 := True;
                    baris2 := i;
                    kolom2 := j;
                end;
                j := j+1; 
            end;
            i := i+1;
        end;
        writeln(baris1,'|',kolom1);
        writeln(baris2,'|',kolom2);
        writeln(cari1);
        writeln(cari2);
        if(not cari1 and not cari2)then
        begin
            TEvo[jmlEvo].Alur_Evolusi[1] := bfr;
            TEvo[jmlEvo].Alur_Evolusi[2] := aftr;
            last_Ev[jmlEvo] := 2;
            TEvo[jmlEvo].ID_Evolusi := IntToStr(jmlEvo);
            jmlEvo:=jmlEvo+1;
        end else
        begin
            if( not cari2 ) then
            begin
                if ( (kolom1=1) or (kolom1=last_Ev[baris1]) ) then
                begin
                    TEvo[baris1].Alur_Evolusi[kolom1+1]:=aftr;
                    last_Ev[baris1]:=last_Ev[baris1]+1;    
                end else
                begin
                    writeln('Alur evolusi tidak memenuhi syarat');
                end;
                
            end else
            begin
                writeln('Alur evolusi tidak memenuhi syarat');
            end;
        end;
    end;
        
end.
