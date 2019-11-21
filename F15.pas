unit F15;
interface
uses
sysutils;
procedure save;
procedure savepokebon(NamaFile : string);
{procedure saveevolusi();
procedure saveinventori();
procedure savestats();
}
implementation

    procedure savepokebon(NamaFile : string);
    var
    CSV : file;
    i : integer;
    isi : string;

    assign(CSV,NamaFile);
    rewrite(CSV);
    isi := '';
    i := 1;
    while i <= jumlahpokebon do 
        begin
            isi :+ (TPok[i].pokemon,',',TPok[i].ID_Pokebon,',',TPok[i].Nama,',',TPok[i].Tipe,',',TPok[i].Evolusi_Selanjutnya);
            writeln(CSV,isi);
            i := i +1;
        end;
    close(CSV)
    end;

    procedure save()
        var
        NamaFilePok : string;

        write('Tulis nama File save untuk pokebon: ')
        readln(NamaFilePok);
        savepokebon(NamaFilePok);
        end;
end.
