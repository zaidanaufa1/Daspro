unit F14;

interface
    uses
        PokebonCSV,sysutils;
    
    procedure tidur();

implementation
    procedure tidur();
    var 
        i:integer;
    begin
        Trainer[x].Day_Passed : IntToInt(StrToInt(Trainer.Day_Passed) +1);
        for i:=1 to jmlInv-1 do
        begin
            TInv[i].kondisi := 'Sehat';
        end;
    end;
end.
