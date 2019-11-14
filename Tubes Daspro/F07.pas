interface
    uses 
        PokebonCSV;
    procedure bertarung ();

implementation
    procedure bertarung();
    var
        inp : string;
        indeks : integer;
        ketemu : boolean;
        chance : integer;
        cape: boolean;
    begin
        Randomize;
        writeln('Kamu menemukan: ');
        write('Pilih pokebon!');
        readln(inp);
        //cari pokebon
        indeks := 1;
        ketemu := False;
        cape := True
        repeat
            if (TInv[indeks].Nama_Pokebon = inp) then
            begin
                ketemu := True;
                //TInv[indeks].Level := TInv[indeks].Level + 1;
            end else
            begin
                indeks:=indeks+1;
            end;
        until (ketemu or indeks>jmlPokebon);

        if(TInv[indeks].Kondisi<>'lelah')then
        begin
            writeln(TInv[indeks].Nama_Pokebon,' Siap bertarung!');
            writeln(TInv[indeks].Nama_Pokebon,' menang');
            writeln(TInv[indeks].Nama_Pokebon, ' mengalami kenaikan level');
            writeln('Level dari ',TInv[indeks].Nama_Pokebon,' sekarang adalah level ',TInv[indeks].Level);
            if(Random(2)=1)then
            begin
                writeln('Karena pertarungan yang sengit ini,',TInv[indeks].Nama_Pokebon,  'menjadi lelah. Ia ingin segera kembali ke rumah.');
                TInv[indeks].Kondisi := 'lelah';
            end;  
        end else
        begin
            writeln(TInv[indeks].Nama_Pokebon,' lelah silahkan ulangi lagi');
        end;
            
        
    end;
