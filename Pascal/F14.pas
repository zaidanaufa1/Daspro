unit F14;

interface
    uses
        PokebonCSV;
    
    procedure tidur();

implementation
    procedure tidur()
    var 
        i:integer;
    begin
        for i:=1 to jmlInv-1 do
        begin
            TInv[i].kondisi := 'Sehat';
        end;
    end;
end.
