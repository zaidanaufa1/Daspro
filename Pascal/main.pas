Program main;

uses PokebonCSV,F01,F02,F03,F04,F06,F07,F08,F09,F10,F11,F12,F13,F14,F15;

var
    pok,evo,trn:string;
    choice : integer;
begin
    {default file}
    PokebonCSVtoArray('pokemon.csv');
    EvolutionCSVtoArray('Alur_Evolusi.csv');
    TrainerCSVtoArray('trainer.csv');
    login();
    if ( roleAdmin)then//kalo admin bisa ngubah file pokebon,alur evolusi yang sudah ada
    begin
        writeln('Masukkan file pokebon: ');readln(pok);
        writeln('Masukkan file evolusi: ');readln(evo);  
        writeln('Masukkan file trainer: ');readln(trn);
        PokebonCSVtoArray(pok);
        EvolutionCSVtoArray(evo);
        TrainerCSVtoArray(trn);
        repeat
            writeln('');
            writeln('--------------------Menu--------------------');
            writeln('1. Membuat Pokebon');
            writeln('2. Membuat Evolusi Pokebon');
            writeln('3.Menghapus Evolusi Pokebon');
            writeln('0.Exit');
            writeln('Pengen ngapain: ');readln(choice);
            if(choice=1)then
            begin
                batas();
                tambahPokebon(); 
                printPokeDex();    
            end else if(choice=2)then
            begin
                batas();
                AddEvolution();
                printEvo();        
            end else if(choice=3)then
            begin
                batas();
                hapusEvo();
                printEvo();    
            end else if(choice=0)then
            begin
                batas();
                writeln('Babay');
            end else
            begin
                batas();
                writeln('Input ngaco');
            end;
        until (choice=0);
    end else
    begin

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