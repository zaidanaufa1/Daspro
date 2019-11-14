unit PokebonCSV;

interface
    type pokebon = record
        ID_Pokebon : integer;
        Nama : string;
        Tipe : string;
        Evolusi_Selanjutnya : string;
    end;

    type inventori =record;
        Nomor_Inventori : integer;
        Nama_Pokebon : string;
        Level : integer;
        Kondisi : string;
    end;

    type evolution = record;
        ID_Evolusi : integer;
        Alur_Evolusi : array [1..100] of string;


    const
        mark  =',';
    var
        File_Pokebon : file of pokebon;
        Pokebon:pokebon;
        TPok:array [1..1000] of pokebon;
        jmlPokebon : integer;

        File_Inven : file of inventori;
        Inven : inventori;
        TInv : array [1..100] of inventori;
        jmlInv : integer;

        File_Evolusi : file of evolution;
        Evo : evolution;
        TEvo : array [1..100] of evolution;
        jmlEvo:integer;
        
    procedure PokebonCSVtoArray();
    procedure InvenCSVtoArray();
    procedure EvolutionCSVtoArray();
implementation
    procedure PokebonCSVtoArray();
    var
        baris:integer;
        CC :string;
        //temp : string;
        kolom : integer;
        jmlPokebon : integer;
        i: integer;
    begin

        assign (File_Pokebon,'file');
        reset(File_Pokebon);
        //read(File_Pokebon,CC);
        if (eof(File_Pokebon))then
        begin
            writeln('File kosong');
        end else
        begin
            jmlPokebon := 0;
            baris := 0;//baris 0 untuk header
            kolom := 0;
            i:=1;
            repeat
                readln(File_Pokebon,CC);
                while (kolom<4) do
                begin
                    while(CC[i]<>mark and i<=length(CC)+1 )do //masukin pokebon sesuai kolom
                    begin
                        if(kolom=0) then
                        begin
                            TPok[baris].ID_Pokebon := baris;

                        end else if (kolom =1)then
                        begin
                            TPok[baris].Nama := Tpok[baris].Nama + CC[i];
                        end else if (kolom =2)then
                        begin
                            Tpok[baris].Tipe := Tpok[baris].Tipe +CC[i];
                        end else
                        begin
                            TPok[baris].Evolusi_Selanjutnya := TPok[baris].Evolusi_Selanjutnya+CC[i];
                        end;
                        i := i+ 1;
                    end;
                    kolom := kolom+1;
                    i := i+1;
                    
                end; 
                baris := baris+1; //baris ditambah 1
                kolom := 0; //reset kolom 
                if(baris>1)then
                begin
                    jmlPokebon := jmlPokebon+1;
                end;            
            until (eof(File_Pokebon));
        end;
        close(File_Pokebon);
    end;

    procedure InvenCSVtoArray();
	var 
		baris : integer;
		CC : string;
		kolom : integer;
		jmlInv : integer;
        i:integer;
	begin
		assign(File_Inven,'file');
		reset(File_Inven);
		if(eof(File_Inven))then
		begin
			writeln('File kosong');
		end else begin
			jmlInv := 0;
			baris := 0;
			kolom := 0;
            i:=0;
			repeat
				readln(File_Inven,CC);
                while (kolom<4) do
                begin
                    while(CC<>mark and i<=length(CC)+1)do //masukin pokebon sesuai kolom
                    begin
                        if(kolom=0) then
                        begin
                            TInv[baris].Nomor_Inventori := baris;

                        end else if (kolom =1)then
                        begin
                            TInv[baris].Nama := TInv[baris].Nama_Pokebon + CC[i];
                        end else if (kolom =2)then
                        begin
                            TInv[baris].Level := TInv[baris].Level +CC[i];
                        end else
                        begin
                            TInv[baris].kondisi := TInv[baris].kondisi+CC[i];
                        end;
                        i := i +1;
                    end;
                    kolom := kolom+1;
                    i := i+1;
                    
                end; 
                baris := baris+1; //baris ditambah 1
                kolom := 0; //reset kolom 
                if(baris>1)then
                begin
                    jmlInv := jmlInv+1;
                end;        
			until (eof(File_Inven));
		end;
        close(File_Inven);
	end;

    procedure EvolutionCSVtoArray();
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
                    while(CC <> mark or  CC = '-')do //masukin evo 
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
    end;