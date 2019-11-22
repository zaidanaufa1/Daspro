Program main;

uses PokebonCSV,F01,F02,F03,F04,F06,F07,F08,F09,F10,F11,F12,F13,F14,F15;

var
    pok,inv,evo,trn,sts:string;
    choice : integer;
begin
    {default file}
    PokebonCSVtoArray('pokemon.csv');
    EvolutionCSVtoArray('Alur_Evolusi.csv');
    TrainerCSVtoArray('trainer.csv');
    login();
    if ( roleAdmin)then//kalo admin bisa ngubah file pokebon,alur evolusi yang sudah ada
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
        writeln('--------------------Menu--------------------');
        writeln('2. Pokebon Database');
        writeln('3. Mengecek Inventori');
        writeln('4. Lepaskan Pokebon');
        writeln('6. Menangkap Pokebon');
        writeln('7. Bertarung');
        writeln('8.Lihat stats');
        writeln('11.Lihat chart evolusi');
        writeln('13.Evolusi Pokebon');
        writeln('14.Tidur');
        writeln('15.Save File');
        writeln('0.Exit');
        write('Masukkan hal yang ingin dilakukan: ');readln(choice);
        if (choice = 2) then
        begin
            batas();
            printPokeDex();
        end else if(choice=3)then
        begin
            batas();
            listInven();   
        end else if(choice=4)then
        begin
            batas();
            pelepasan();
            stats();
            cariUnik();
        end else if(choice=6)then
        begin
            batas();
            tangkap();
            stats();
            cariUnik();
        end else if(choice=7)then
        begin
            batas();
            bertarung();
            stats();
            cariUnik();
        end else if(choice=8)then
        begin
            stats();
            cariUnik();
            printStats();        
        end else if(choice=11)then
        begin
            batas();
            printEvo();
        end else if(choice=13)then
        begin
            batas();
            EvoPok();
        end else if(choice=14)then
        begin
            batas();
            tidur();
        end else if(choice=15)then
        begin
            save();
        end else  if(choice=0)then
        begin
            batas();
            writeln('babay');
        end else
        begin
            writeln('Masukkan salah')   
        end;
            
            
    until (choice = 0);
   
    end;  

end.