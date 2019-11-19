unit F10;

interface
    uses 
        PokebonCSV;

    
    procedure AddEvolution();
    var
        bfr : string;//sblm evo
        aftr : string;//sesudah evo
        i: integer;
        j : integer;
        cari1 : boolean;baris1:integer;kolom1:integer;
        cari2 : boolean;baris2:integer;kolom2:integer;
    begin
        j := 1;//kolom dari 1 karena yang 0 itu id
        i := 1;//baris dari 1 karena yang 0 itu header
        cari1 := False;
        cari2 :=False;
        write('Masukkan nama pokebon sebelum evolusi: ');readln(bfr);
        write('Masukkan nama pokebon sesudah evolusi: ');readln(aftr);
        while ((!cari1 or !cari2) or i<=jmlEvo) do
        begin
            while (j<=last_Evo[i] )do
            begin
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
        end;
        if(baris1 = baris 2)then
        begin
            if ((TEvo[baris1].Alur_Evolusi[kolom1+1]=nil) and (TEvo[baris2].Alur_Evolusi[kolom2-1]=nil)) then
            begin
                TEvo[baris1].Alur_Evolusi[ko]
            end;    
        end;
        
    end;
end.
