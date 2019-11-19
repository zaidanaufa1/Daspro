Uses sysutils;
type 
    pokemon = record
        ID_Pokebon : string;
        Nama : string;
        Tipe : string;
        Evolusi_Selanjutnya : string;
    end;

var
    File_Pokebon : text;
    TPok:array [1..1000] of pokemon;
    //jmlPokebon : integer;
    baris:integer;
    CC :String;
    kolom : integer;
    i,j: integer;
    tempText : string;
begin
    assign (File_Pokebon,'pokemon.csv');
    reset(File_Pokebon);
    //jmlPokebon := 0;
    baris := 0;//baris 0 untuk header          
    repeat
        kolom := 0;
        i:=1;
        tempText := '';
        readln(File_Pokebon,CC);
        while(i<=length(CC)+1 )do //masukin pokebon sesuai kolom
        begin
            if((CC[i] = ',') or (i=length(CC)+1))then
            begin
                if(kolom = 0) then
                begin
                    TPok[baris].ID_Pokebon := tempText;
                end else if (kolom = 1)then
                begin
                    TPok[baris].Nama := tempText;
                end else if (kolom = 2)then
                begin
                    Tpok[baris].Tipe := tempText;
                end else if (kolom = 3) then
                begin
                    TPok[baris].Evolusi_Selanjutnya := tempText;
                end;
                tempText := '';
                kolom := kolom+1;
            end else
            begin
                tempText := tempText + CC[i];
            end;                       
            i := i+1;  
        end;

        baris := baris+1; //baris ditambah 1
        {if(baris>=1)then
        begin
            jmlPokebon := jmlPokebon+1;
        end; }           
    until (eof(File_Pokebon));
    
    for j:=0 to baris do
    begin
        writeln(TPok[j].ID_Pokebon,'|',TPok[j].Nama,'|',TPok[j].Tipe,'|',TPok[j].Evolusi_Selanjutnya);    
    end;
end.
//Procedure
    {procedure PokebonCSVtoArray();
    var
        baris:integer;
        CC :String;
        kolom : integer;
        i: integer;
        tempText : string;
        
    begin

        assign (File_Pokebon,'pokebon.csv');
        reset(File_Pokebon);
        //read(File_Pokebon,CC);
        if (eof(File_Pokebon))then
        begin
            writeln('File kosong');
        end else
        begin
            jmlPokebon := 0;
            baris := 0;//baris 0 untuk header
            
            repeat
                kolom := 0;
                i:=1;
                tempText := '';
                readln(File_Pokebon,CC);

                while(i<=length(CC)+1 )do //masukin pokebon sesuai kolom
                begin
                    if((CC[i] = ',') or (i=length(CC)+1))then
                    begin
                        if(kolom=0) then
                        begin
                            TPok[baris].ID_Pokebon := tempText;

                        end else if (kolom =1)then
                        begin
                            TPok[baris].Nama := tempText;
                        end else if (kolom =2)then
                        begin
                            Tpok[baris].Tipe := tempText;
                        end else
                        begin
                            TPok[baris].Evolusi_Selanjutnya := tempText;
                        end;
                        tempText := '';
                        kolom := kolom+1;
                    end else
                    begin
                        tempText := tempText + CC[i];
                    end;                       
                    i := i+1;  
                end;

                baris := baris+1; //baris ditambah 1
                if(baris>=1)then
                begin
                    jmlPokebon := jmlPokebon+1;
                end;            
            until (eof(File_Pokebon));
        end;
        close(File_Pokebon);
    end;

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
            for i:=1 to jmlPokebon do
            begin
                writeln(TPok[i].ID_Pokebon,'|',TPok[i].Nama,'|',TPok[i].Tipe,'|',TPok[i].Evolusi_Selanjutnya);   
            end;
        end;
        //close(File_Pokebon);
    end;
    
begin
    PokebonCSVtoArray();
    printPokeDex();
end.}