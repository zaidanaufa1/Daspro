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
        i:=1;
        writeln(TTrain[i].Nama,', Kamu memilih tidur untuk mengakhiri hari ke-',TTrain[i].Day_Passed);
        TTrain[i].Day_Passed := (IntToStr(StrToInt(TTrain[i].Day_Passed) +1));
        writeln('Pokebonmu sudah tidur dengan lelap. Mereka sudah kembali sehat');
        writeln('Sekarang adalah hari ke-',TTrain[i].Day_Passed);
        for i:=1 to jmlInv-1 do
        begin
            TInv[i].kondisi := 'sehat';
        end;
    end;
end.
