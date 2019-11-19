Program main;

uses PokebonCSV,F02,F03,F04,F06,F07,F09,F11,F13,F14;

var
    pok,inv,evo,trn,sts:string;
    choice : integer;
begin
    write('Masukkan file pokebon: ');readln(pok);
    write('Masukkan file inventori: ');readln(inv);
    write('Masukkan file evolusi: ');readln(evo);
    Write('Masukan file trainer: ');readln(trn);
    write('Masukan file Stats: ');readln(sts);
    //loading file
    PokebonCSVtoArray(pok);
    InvenCSVtoArray(inv);
    EvolutionCSVtoArray(evo);
    TrainerCSVtoArray(trn);
    StatsCSVtoArray(sts);
    repeat
        writeln('');
        writeln('Menu');
        writeln('2.Pokebon Database');
        writeln('3.Mengecek Inventori');
        writeln('4.Lepaskan Pokebon');
        writeln('6.Menangkap Pokebon');
        writeln('7.Bertarung');
        writeln('9.Membuat Pokebon');
        writeln('11.Lihat chart evolusi');
        writeln('13.Evolusi Pokebon');
        writeln('14.Tidur');
        writeln('Masukkan hal yang ingin dilakukan: ');readln(choice);
        if (choice = 2) then
        begin
            printPokeDex();
        end else if(choice=3)then
        begin
            listInven();   
        end else if(choice=4)then
        begin
            pelepasan();
        end else if(choice=6)then
        begin
            tangkap();
        end else if(choice=7)then
        begin
            bertarung();
        end else if(choice=9)then
        begin
            tambahPokebon();
        end else if(choice=11)then
        begin
            printEvo();
        end else if(choice=13)then
        begin
            EvoPok();
        end else if(choice=14)then
        begin
            tidur();
        end else  if(choice=0)then
        begin
            writeln('babay');
        end else
        begin
            writeln('Masukkan salah')   
        end;
            
            
    until (choice = 0);
    


   

end.