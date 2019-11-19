Uses sysutils;
type 
    rekamanMHS = record
        NIM :string;
        nilai:string;
    end;
var
    CC:string;
    f :text;
    i,j,baris:integer;
    kolom:integer;
    RekMHS : rekamanMHS;
    TabelMHS : array [1..100] of rekamanMHS;
    temp:string;
begin
    assign(f,'test.csv');
    reset(f);
    baris:=0;
    repeat
        temp:='';
        i:=1;
        kolom:=0;
      
        readln(f,CC);
        while(i<=length(CC)+1)do
        begin
            if( (CC[i] = ',') or (i=length(CC)+1) )then
            begin
               
                    if(kolom=0)then
                    begin
                        TabelMHS[baris].NIM := temp;
                    end else
                    begin
                        TabelMHS[baris].nilai:=temp; 
                    end;   
                
                
                kolom:=kolom+1;
                temp := '';
            end else
            begin
                temp := temp+CC[i];
            end;
            i := i+1;
            
        end;
        baris := baris +1;
    until (eof(f));

    for j:=0 to baris-1 do
    begin
        writeln(TabelMHS[j].NIM,'|',TabelMHS[j].nilai);
    end;
end.