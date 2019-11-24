unit F10;

interface
    uses 
        PokebonCSV,sysutils;
    procedure AddEvolution(curr,next,state:string);
    procedure inputEvo();

implementation   
    procedure inputEvo();
    var
        bfr:string;
        aftr:string;
    begin
        write('Masukkan nama pokebon sebelum evolusi: ');readln(bfr);
        write('Masukkan nama pokebon sesudah evolusi: ');readln(aftr);
        AddEvolution(bfr,aftr,'update');    
    end;

    procedure AddEvolution(curr,next,state:string);
    var
        i: integer;
        j : integer;
        cari1 : boolean;baris1:integer;kolom1:integer;
        cari2 : boolean;baris2:integer;kolom2:integer;
    begin
        
        i := 1;//baris dari 1 karena yang 0 itu header
        cari1 := False;
        cari2 :=False;
        
        while (i<=jmlEvo-1) do
        begin
            j:=1;
            while (j<=last_Ev[i] )do
            begin
                if(TEvo[i].Alur_Evolusi[j] = curr)then
                begin
                    cari1 := True;
                    baris1 := i;
                    kolom1 := j;
                end else if (TEvo[i].Alur_Evolusi[j] = next) then
                begin
                    cari2 := True;
                    baris2 := i;
                    kolom2 := j;
                end;
                j := j+1; 
            end;
            i := i+1;
        end;
        if( (kolom2=1) and (kolom1=last_Ev[baris1]))then
        begin
            i:=last_Ev[baris1]+1;
            j:=1;
            last_Ev[baris1]:=last_Ev[baris1]+last_Ev[baris2];
            while(i<=last_Ev[baris1]+1)do
            begin
                TEvo[baris1].Alur_Evolusi[i] := TEvo[baris2].Alur_Evolusi[j];
                j:=j+1;
                i:=i+1;  
            end;
            if(baris2=jmlEvo-1)then
            begin
                jmlEvo:=jmlEvo-1;    
            end else
            begin
                for i:=baris2+1 to jmlEvo-1 do
                begin
                    TEvo[i].ID_Evolusi := IntToStr(StrToInt(TEvo[i].ID_Evolusi)-1);
                    TEvo[i-1]:=TEvo[i];
                    last_Ev[i-1]:=last_Ev[i];
                end;  
                jmlEvo:=jmlEvo-1;  

            end;
            writeln('Alur evolusi berhasil disambungkan') ;
        end;
        
        if(not cari1 and not cari2)then
        begin
            TEvo[jmlEvo].Alur_Evolusi[1] := curr;
            TEvo[jmlEvo].Alur_Evolusi[2] := next;
            last_Ev[jmlEvo] := 2;
            TEvo[jmlEvo].ID_Evolusi := IntToStr(jmlEvo);
            jmlEvo:=jmlEvo+1;
            writeln('Alur evolusi berhasil disambungkan') ;
        end else
        begin
            if( not cari2 ) then
            begin
                if ( (kolom1=1) or (kolom1=last_Ev[baris1]) ) then
                begin
                    TEvo[baris1].Alur_Evolusi[kolom1+1]:=next;
                    last_Ev[baris1]:=last_Ev[baris1]+1;
                    writeln('Alur evolusi berhasil disambungkan') ; 
                end else
                begin
                    if(state='update')then
                    begin
                        writeln('Alur evolusi tidak memenuhi syarat');   
                    end;
                    
                end;
                
            end else
            begin
                if (state='update') then
                begin
                  writeln('Alur evolusi tidak memenuhi syarat');  
                end else
                begin
                    if(next='')then
                    begin
                         if ( not cari1 ) then
                         begin
                            TEvo[jmlEvo].Alur_Evolusi[1] := curr;
                            //TEvo[jmlEvo].Alur_Evolusi[2] := next;
                            last_Ev[jmlEvo] := 1;
                            TEvo[jmlEvo].ID_Evolusi := IntToStr(jmlEvo);
                            jmlEvo:=jmlEvo+1;    
                        end;
                    end;
                end;
                
            end;
        end;
    end;
        
end.
