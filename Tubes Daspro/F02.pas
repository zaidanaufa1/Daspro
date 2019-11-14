unit F02;

interface
    uses 
        PokebonCSV;
    procedure printPokeDex();
    
implementation
    procedure printPokeDex();
    var
        i : integer;
    begin
        assign (File_Pokebon,'file');
        reset(File_Pokebon);
        if(jmlPokebon=0)then
        begin
            writeln('Tidak ada pokebon yang terdaftar');
        end else then
        begin
            writeln('Pokebon di pokedex:')
            i:=1;
            repeat
                read(File_Pokebon,Pokebon);
                write(TPok[i].ID_Pokebon,'|',TPok[i].Nama,'|',TPok[i].Tipe,'|',TPok[i].Evolusi_Selanjutnya);
                i := i+1;
            until ((i>JumPok) or eof(File_Pokebon));
        end;
        //close(File_Pokebon);
    end.
    