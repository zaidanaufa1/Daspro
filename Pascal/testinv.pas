Uses sysutils;
    type inventori = record
        Nomor_Inventori : string;
        Nama_Pokebon : string;
        Level : string;
        Kondisi : string;
    end;
var
    File_Inven : text;
    //Inven : inventori;
    TInv : array [1..100] of inventori;
    jmlInv : integer;
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
                if(baris>1)then
                begin
                    jmlInv := jmlInv+1;
                end;        
			until (eof(File_Inven));
		end;
        close(File_Inven);
	end;

    procedure listInven();
    var
        i : integer;
    begin
        for i:=1 to jmlInv do
        begin
            writeln( TInv[i].Nomor_Inventori,'|',TInv[i].Nama_Pokebon, '|', TInv[i].Level,'|',TInv[i].kondisi );
        end;
    end;

    begin
        InvenCSVtoArray('Inventori.csv');
        listInven();
    end.