unit F14;

interface
    uses
        PokebonCSV,sysutils,F01;
    
    procedure tidur();

implementation
    procedure tidur();
    var 
        i:integer;
    begin
        writeln(TTrain[user].Nama,', Kamu memilih tidur untuk mengakhiri hari ke-',TTrain[user].Day_Passed);
        TTrain[user].Day_Passed := (IntToStr(StrToInt(TTrain[user].Day_Passed) +1));
        writeln('Pokebonmu sudah tidur dengan lelap. Mereka sudah kembali sehat');
        writeln('Sekarang adalah hari ke-',TTrain[user].Day_Passed);

        for i:=1 to jmlInv-1 do
        begin
            TInv[i].kondisi := 'sehat';
        end;
    end;
end.
