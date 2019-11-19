unit PokebonCSV;

interface
    Uses sysutils;
    type pokemon = record
        ID_Pokebon : string;
        Nama : string;
        Tipe : string;
        Evolusi_Selanjutnya : string;
    end;

    type inventori = record
        Nomor_Inventori : string;
        Nama_Pokebon : string;
        Level : string;
        Kondisi : string;
    end;

    {type evolution = record
        ID_Evolusi : integer;
        Alur_Evolusi : array [1..100] of string;}


    const
        mark  =',';
    var
        File_Pokebon : TextFile;
        Pokebon:pokemon;
        TPok:array [1..1000] of pokemon;
        jmlPokebon : integer;

        File_Inven : TextFile;
        Inven : inventori;
        TInv : array [1..100] of inventori;
        jmlInv : integer;

        {File_Evolusi : file of evolution;
        Evo : evolution;
        TEvo : array [1..100] of evolution;
        jmlEvo:integer;}
        
    procedure PokebonCSVtoArray(CSV : string);
    procedure InvenCSVtoArray(CSV : string);
    

    //procedure EvolutionCSVtoArray();
implementation
    


    procedure PokebonCSVtoArray(CSV : string);
    var
        baris:integer;
        CC :String;
        kolom : integer;
        i: integer;
        tempText : string;
        
    begin

        Assign (File_Pokebon,CSV);
        Reset(File_Pokebon);
        //read(File_Pokebon,CC);
        if (eof(File_Pokebon))then
        begin
            writeln('File kosong');
        end else
        begin
            jmlPokebon := 0;
            baris := 0;//baris 0 untuk header
            
            repeat
                readln(File_Pokebon,CC);
                kolom := 0;
                i:=1;
                tempText := '';
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
                jmlPokebon := jmlPokebon+1;           
            until (eof(File_Pokebon));
        end;
        close(File_Pokebon);
    end;

    procedure InvenCSVtoArray(CSV : string);
	var 
		baris : integer;
		CC : string;
		kolom : integer;
		jmlInv : integer;
        i:integer;
        tempText : string;
	begin
		assign(File_Inven,CSV);
		reset(File_Inven);
		if(eof(File_Inven))then
		begin
			writeln('File kosong');
		end else 
        begin
			jmlInv := 0;
			baris := 0;
			
			repeat
                tempText:='';
				readln(File_Inven,CC);
                kolom := 0;
                i:=1;
                {while (kolom<4) do
                begin}
                while(i<=length(CC)+1)do //masukin pokebon sesuai kolom
                begin
                    if((CC[i] = ',') or (i=length(CC)+1))then
                    begin
                        if(kolom=0) then
                        begin
                            TInv[baris].Nomor_Inventori := tempText;
                        end else if (kolom =1)then
                        begin
                            TInv[baris].Nama_Pokebon := tempText;
                        end else if (kolom =2)then
                        begin
                            TInv[baris].Level := tempText;
                        end else
                        begin
                            TInv[baris].kondisi := tempText;
                        end;
                        kolom := kolom+1;
                        tempText := '';                       
                    end else
                    begin
                        tempText := tempText + CC[i];
                    end;                       
                    i := i+1;                    
                end;

                baris := baris+1; //baris ditambah 1
                jmlInv := jmlInv+1;
     
			until (eof(File_Inven));
		end;
        close(File_Inven);
	end;

end.
    {procedure EvolutionCSVtoArray();
    begin
        var 
		baris : integer;
		CC : string;
		kolom : integer;
		jmlInv : integer;
        i:integer;
        last_Ev : array [1..100] of integer;
        k:integer;
	begin
		assign(File_Evolusi,'file');
		reset(File_Evolusi);
		if(eof(File_Inven))then
		begin
			writeln('File kosong');
		end else begin
			jmlEvo := 0;
			baris := 0;
			kolom := 0;
            i:=0;
            k:=0;
			repeat
				readln(File_Evolusi,CC);
                while (i<=length(CC)+1) do
                begin
                    while(CC <> mark or  CC <> '-')do //masukin evo 
                    begin
                        if(kolom=0) then
                        begin
                            TEvo[baris].ID_Evolusi := baris;

                        end else //kolom evolusi mulai dari 1
                        begin
                            TEvo[baris].Alur_Evolusi[kolom] := TEvo[baris].Alur_Evolusi[kolom] + CC[i];
                        end;
                    end;
                    
                    kolom := kolom+1;
                    i := i+1;
                    
                end; 
                last_Ev[k] := kolom;
                baris := baris+1; //baris ditambah 1
                kolom := 0; //reset kolom 
                if(baris>1)then
                begin
                    jmlEvo := jmlEvo + 1;
                end;        
			until (eof(File_Evolusi));
		end;
        close(File_Inven);   
    end;}
