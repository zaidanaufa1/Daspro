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

    type evolution = record
        ID_Evolusi : string;
        Alur_Evolusi : array [1..1000] of string;
    end;

    const
        mark  =',';
    var
        File_Pokebon : TextFile;
        Pokebon:pokemon;
        TPok:array [0..1000] of pokemon;
        jmlPokebon : integer;

        File_Inven : TextFile;
        Inven : inventori;
        TInv : array [0..1000] of inventori;
        jmlInv : integer;

        File_Evolusi : TextFile;
        Evo : evolution;
        TEvo : array [0..1000] of evolution;
        jmlEvo:integer;
        last_Ev : array [0..1000] of integer;

    procedure PokebonCSVtoArray(CSV : string);
    procedure InvenCSVtoArray(CSV : string);
    procedure EvolutionCSVtoArray(CSV : string);
implementation
    


    procedure PokebonCSVtoArray(CSV : string);
    var
        baris:integer;
        CC :String;
        kolom : integer;
        i: integer;
        tempText : string;
        
    begin

        assign (File_Pokebon,CSV);
        reset(File_Pokebon);
        //read(File_Pokebon,CC);
        if (eof(File_Pokebon))then
        begin
            writeln('File kosong');
        end else
        begin
            jmlPokebon := 0;
            baris := 0;//baris 0 untuk header
            
            while (not(eof(File_Pokebon)))do
            begin
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
                if(baris>=1)then
                begin
                    jmlPokebon := jmlPokebon+1;    
                end;
                          
            end;
        end;
        close(File_Pokebon);
    end;

    procedure InvenCSVtoArray(CSV : string);
	var 
		baris : integer;
		CC : string;
		kolom : integer;
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
			
			while (not(eof(File_Inven)))do
            begin
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
                if(baris>=1)then
                begin
                    jmlInv := jmlInv+1;    
                end;
                
     
			end;
		end;
        close(File_Inven);
	end;


    procedure EvolutionCSVtoArray(CSV:string);
    var 
		baris : integer;
		CC,tempText : string;
		kolom : integer;
        i:integer;
        k:integer;
	begin
		assign(File_Evolusi,CSV);
		reset(File_Evolusi);
		if(eof(File_Evolusi))then
		begin
			writeln('File kosong');
		end else 
        begin
            jmlEvo:=0;
            baris:=0;
            while(not(eof(File_Evolusi)))do
            begin
                readln(File_Evolusi,CC);
                kolom:=0;
                i:=1;
                tempText:='';
                while(i<=length(CC)+1)do
                begin
                    if ( (CC[i] = ',') or (i=length(CC)+1) or (CC[i]='-') )then
                    begin
                        if(kolom=0)then
                        begin
                            TEvo[baris].ID_Evolusi := tempText;
                        end else
                        begin
                            TEvo[baris].Alur_Evolusi[kolom]:=tempText;
                        end;
                        tempText:='';
                        kolom:=kolom+1;
                    end else
                    begin
                        tempText := tempText+CC[i];
                    end;
                    i:=i+1;
                end;
                last_Ev[baris]:=kolom-1;//buat liat evolusi terakhir baris ke-n
                baris:=baris+1;
                if(baris>=1)then
                begin
                    jmlEvo:=jmlEvo+1;
                end;

            end;

		end;
    end;
end.