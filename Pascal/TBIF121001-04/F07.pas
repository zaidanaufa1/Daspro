unit F07;

interface
    uses 
        PokebonCSV,sysutils,F05,F03;
    procedure bertarung ();

implementation
    procedure bertarung();
    var
        inp : integer;
        //indeks : integer;
        ketemu : string;
        //chance : integer;
        //cape: boolean;
    begin
        Randomize;
        ketemu := EncounterChance(Tencounter,Tencounter.Neff);
        writeln('Kamu menemukan: ', ketemu);
        writeln('Pilih pokebon untuk bertarung : ');
        listInven();
        write('Masukan angka pokebon yang akan bertarung : ');
        readln(inp);
        //cari pokebon
        //indeks := 1;
        //ketemu := False;
        //cape := True;
        if((inp>jmlInv-1) or (inp=0))then
        begin
            writeln('Tidak ada pokebon pada nomor tersebut');
        end else
        begin
            if(TInv[inp].Kondisi<>'lelah')then
            begin
                writeln(TInv[inp].Nama_Pokebon,' Siap bertarung!');
                writeln(TInv[inp].Nama_Pokebon,' menang');
                writeln(TInv[inp].Nama_Pokebon, ' mengalami kenaikan level');
                TInv[inp].Level := IntToStr(StrToInt(TInv[inp].Level)+1);
                writeln('Level dari ',TInv[inp].Nama_Pokebon,' sekarang adalah level ',TInv[inp].Level);
                if(Random(2)=1)then
                begin
                    writeln('Karena pertarungan yang sengit ini ,',TInv[inp].Nama_Pokebon,  ' menjadi lelah. Ia ingin segera kembali ke rumah.');
                    TInv[inp].Kondisi := 'lelah';
                end;  
            end else
            begin
                writeln(TInv[inp].Nama_Pokebon,' lelah silahkan ulangi lagi');
            end;     
        end;           
        
    end;
end.