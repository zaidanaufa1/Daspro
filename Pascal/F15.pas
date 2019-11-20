unit F15;
interface
uses
PokebonCSV;
procedure save;
procedure savepokebon(NamaFile : string);
{procedure saveevolusi();
procedure saveinventori();
procedure savestats();
}
implementation

    procedure savepokebon(NamaFile : string);
    var
    CSV : Text ;
    i : integer;
    isi : string;

    begin
    Assign(CSV,NamaFile);
    isi := '';
    i := 0;
    Rewrite(CSV);
    while i <= jmlPokebon do 
        begin
            isi := isi + ((TPok[i].ID_Pokebon)+','+(TPok[i].Nama)+','+(TPok[i].Tipe)+','+(TPok[i].Evolusi_Selanjutnya));
            writeln(CSV,isi);
            i := i +1;
        end;
    close(CSV)
    end;

    procedure save();
        var
        NamaFilePok : string;
        begin
        write('Tulis nama File save untuk pokebon: ');
        readln(NamaFilePok);
        savepokebon(NamaFilePok);
        end;
end.
