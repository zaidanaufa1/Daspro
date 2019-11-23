unit F15;
interface
uses
PokebonCSV;
procedure save;
procedure saveStats(NamaFile : string);
procedure savepokebon(NamaFile : string);
{
procedure saveevolusi(NamaFile: string);
procedure saveinventori(NamaFile: string);
procedure savestats(NamaFile : string);
}

implementation
    procedure saveStats(NamaFile : string);
        var
        CSV : Text ;
        i : integer;
        isi : string;

        begin
        Assign(CSV,NamaFile);
        i := 0;
        Rewrite(CSV);
        while i <= jmlPokebon-1 do 
            begin
            isi := '';
            isi := isi + ((TStats[i].Nama_Pokebon)+','+(TStats[i].Max_Level));
            writeln(CSV,isi);
            i := i +1;
            end;
        close(CSV)
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
        while i <= jmlPokebon-1 do 
            begin
            isi := '';
            isi := isi + ((TPok[i].ID_Pokebon)+','+(TPok[i].Nama)+','+(TPok[i].Tipe)+','+(TPok[i].Evolusi_Selanjutnya));
            writeln(CSV,isi);
            i := i +1;
            end;
        close(CSV)
        end;
      {  CSV : Text ;
        i : integer;
        isi : string;
}
    {procedure saveevolusi(NamaFile: string);}
        
    procedure save();
        var
        NamaFilePok : string;
        begin
        write('Tulis nama File save untuk pokebon: ');
        readln(NamaFilePok);
        savepokebon(NamaFilePok);
        end;
end.
