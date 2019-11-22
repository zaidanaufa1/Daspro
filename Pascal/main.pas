Program main;

uses PokebonCSV,F01,F02,F03,F04,F05,F06,F07,F08,F09,F10,F11,F12,F13,F14,F15;

var
    pok,evo,trn:string;
    choice : integer;
    strchoice : string;
begin
    {default file}
    PokebonCSVtoArray('pokemon.csv');
    EvolutionCSVtoArray('Alur_Evolusi.csv');
    makeArrEcounterChance();
    {TrainerCSVtoArray('trainer.csv');
    login();
    if (roleAdmin)then//kalo admin bisa ngubah file pokebon,alur evolusi yang sudah ada
    begin
        write('Masukkan file pokebon: ');readln(pok);
        write('Masukkan file evolusi: ');readln(evo);  
        write('Masukkan file trainer: ');readln(trn);
        PokebonCSVtoArray(pok);
        EvolutionCSVtoArray(evo);
        TrainerCSVtoArray(trn);
        repeat
            writeln('');
            writeln('--------------------Menu--------------------');
            writeln('1. Membuat Pokebon');
            writeln('2. Membuat Evolusi Pokebon');
            writeln('3. Menghapus Evolusi Pokebon');
            writeln('0.Exit');
            write('Pengen ngapain: ');readln(choice);
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
    begin}

        repeat
        writeln('');
        writeln('--------------------Menu--------------------');
        writeln('2. Pokebon Database (pokedex)');
        writeln('3. Mengecek Inventori (inventori)');
        writeln('4. Lepaskan Pokebon (lepas)');
        writeln('5. Melihat Kemungkinan Bertemu Pokebon (pokebonChance)');
        writeln('6. Menangkap Pokebon (tangkap)');
        writeln('7. Bertarung (tarung)');
        writeln('8.Lihat stats (statistik)');
        writeln('11.Lihat chart evolusi (lihatEvolusi)');
        writeln('13.Evolusi Pokebon (evolusi)');
        writeln('14.Tidur (tidur)');
        writeln('15.Save File (save)');
        writeln('0.Exit (exit)');
        write('Masukkan hal yang ingin dilakukan: ');readln(strchoice);
        if (strchoice = 'pokedex') then
        begin
            batas();
            printPokeDex();
        end else if(strchoice='inventori')then
        begin
            batas();
            listInven();   
        end else if(strchoice='lepas')then
        begin
            batas();
            pelepasan();
            stats();
            cariUnik();
        end else if(strchoice='pokebonChance')then
        begin
        printEncounterChance();
        end else if(strchoice='tangkap')then
        begin
            batas();
            tangkap();
            stats();
            cariUnik();
        end else if(strchoice='tarung')then
        begin
            batas();
            bertarung();
            stats();
            cariUnik();
        end else if(strchoice='statistik')then
        begin
            stats();
            cariUnik();
            printStats();        
        end else if(strchoice='lihatEvolusi')then
        begin
            batas();
            printEvo();
        end else if(strchoice='evolusi')then
        begin
            batas();
            EvoPok();
        end else if(strchoice='tidur')then
        begin
            batas();
            tidur();
        end else if(strchoice='save')then
        begin
            save();
        end else  if(strchoice='exit')then
        begin
            batas();
            writeln('See you next time!');
        end else
        begin
            writeln('Masukkan salah');
            writeln('Masukkan input seperti yang tertera pada kurung di Menu.'); 
        end;
            
            
    until (strchoice = 'exit');
   
    {end;}  

end.
