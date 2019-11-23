unit F02;

interface
    uses 
        PokebonCSV,F01;

    procedure printPokeDex();
    
implementation
    procedure printPokeDex();
    var
        i : integer;
    begin
        if(jmlPokebon=0)then
        begin
            writeln('Tidak ada pokebon yang terdaftar');
        end else 
        begin
            writeln('Pokebon di pokedex:');
            i:=1;
            while i <= jmlPokebon-1  do
            begin
                writeln(TPok[i].ID_Pokebon,'|',TPok[i].Nama,'|',TPok[i].Tipe,'|',TPok[i].Evolusi_Selanjutnya);  
                i := i+1; 
            end;   
        end;
        //close(File_Pokebon);
    end;
end.
    