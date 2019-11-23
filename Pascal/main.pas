Program main;

uses PokebonCSV,F01,F02,F03,F04,F05,F06,F07,F08,F09,F10,F11,F12,F13,F14,F15;

var
    pok,evo,trn:string;
    choice : integer;
    str_choice : string;
begin
    {default file}
    PokebonCSVtoArray('pokemon.csv');
    EvolutionCSVtoArray('Alur_Evolusi.csv');
    TrainerCSVtoArray('trainer.csv');
    makeArrEncounterChance();
    login();
    stats();
    if (roleAdmin)then//kalo admin bisa ngubah file pokebon,alur evolusi yang sudah ada
    begin
        writeln('User telah login sebagai admin');
        {write('Masukkan file pokebon: ');readln(pok);
        write('Masukkan file evolusi: ');readln(evo);  
        write('Masukkan file trainer: ');readln(trn);
        PokebonCSVtoArray(pok);
        EvolutionCSVtoArray(evo);
        TrainerCSVtoArray(trn);}
        repeat
        writeln('');
        writeln('--------------------Menu--------------------');
        writeln('1. Pokebon Database (pokedex)');
        writeln('2. Mengecek Inventori (inventori)');
        writeln('3. Lepaskan Pokebon (lepas)');
        writeln('4. Melihat kemungkinan bertemu Pokebon (pokebonChance)');
        writeln('5. Menangkap Pokebon (tangkap)');
        writeln('6. Bertarung (tarung)');
        writeln('7. Lihat stats (statistik)');
        writeln('8. Membuat Pokebon (buatPokebon)');
        writeln('9. Membuat Evolusi Pokebon baru (buatEvolusi)');
        writeln('10. Lihat chart evolusi (lihatEvolusi)');
        writeln('11. Menghapus tahapan evolusi pada Pokebon (hapusEvolusi)');
        writeln('12. Evolusi Pokebon (evolusi)');
        writeln('13. Tidur (tidur)');
        writeln('14. Save File (save)');
        writeln('0.Exit (exit)');
        write('Masukkan hal yang ingin dilakukan: ');readln(str_choice);
        if (str_choice = 'pokedex') then
        begin
            batas();
            printPokeDex();
        end else if(str_choice='inventori')then
        begin
            batas();
            listInven();   
        end else if(str_choice='lepas')then
        begin
            batas();
            pelepasan();
            stats();
            //cariUnik();
        end else if(str_choice='pokebonChance')then
        begin
            batas();
            PrintEncounterChance();
        end else if(str_choice='tangkap')then
        begin
            batas();
            tangkap();
            stats();
            //cariUnik();
        end else if(str_choice='tarung')then
        begin
            batas();
            bertarung();
            stats();
            //cariUnik();
        end else if(str_choice='statistik')then
        begin
            stats();
            //cariUnik();
            printStats();  
        end else if(str_choice='buatPokebon')then
        begin
            batas();
            tambahPokebon(); 
            printPokeDex(); 
        end else if(str_choice='buatEvolusi')then
        begin
            batas();
            inputEvo();
            printEvo();   
        end else if(str_choice='lihatEvolusi')then
        begin
            batas();
            printEvo();
        end else if(str_choice='hapusEvolusi')then
        begin
            batas();
            hapusEvo();
            printEvo(); 
        end else if(str_choice='evolusi')then
        begin
            batas();
            EvoPok();
        end else if(str_choice='tidur')then
        begin
            batas();
            tidur();
        end else if(str_choice='save')then
        begin
            save();
        end else  if(str_choice='exit')then
        begin
            batas();
            writeln('See you next time!');
        end else
        begin
            writeln('Masukkan salah');
            writeln('Masukkan input seperti yang tertera pada kurung di Menu.'); 
        end;
        until (str_choice= 'exit');
    end else
    begin

        repeat
        writeln('');
        writeln('--------------------Menu--------------------');
        writeln('1. Pokebon Database (pokedex)');
        writeln('2. Mengecek Inventori (inventori)');
        writeln('3. Lepaskan Pokebon (lepas)');
        writeln('4. Melihat kemungkinan bertemu Pokebon (pokebonChance)');
        writeln('5. Menangkap Pokebon (tangkap)');
        writeln('6. Bertarung (tarung)');
        writeln('7.Lihat stats (statistik)');
        writeln('8.Lihat chart evolusi (lihatEvolusi)');
        writeln('9.Evolusi Pokebon (evolusi)');
        writeln('10.Tidur (tidur)');
        writeln('11.Save File (save)');
        writeln('0.Exit (exit)');
        write('Masukkan hal yang ingin dilakukan: ');readln(str_choice);
        if (str_choice = 'pokedex') then
        begin
            batas();
            printPokeDex();
        end else if(str_choice='inventori')then
        begin
            batas();
            listInven();   
        end else if(str_choice='lepas')then
        begin
            batas();
            pelepasan();
            stats();
            //cariUnik();
        end else if(str_choice='pokebonChance')then
        begin
            batas();
            PrintEncounterChance();
        end else if(str_choice='tangkap')then
        begin
            batas();
            tangkap();
            stats();
            //cariUnik();
        end else if(str_choice='tarung')then
        begin
            batas();
            bertarung();
            //stats();
            //cariUnik();
        end else if(str_choice='statistik')then
        begin
            stats();
            //cariUnik();
            printStats();  
            //saveStats(TTrain[user].File_Stats);      
        end else if(str_choice='lihatEvolusi')then
        begin
            batas();
            printEvo();
        end else if(str_choice='evolusi')then
        begin
            batas();
            EvoPok();
        end else if(str_choice='tidur')then
        begin
            batas();
            tidur();
        end else if(str_choice='save')then
        begin
            save();
        end else  if(str_choice='exit')then
        begin
            batas();
            writeln('See you next time!');
        end else
        begin
            writeln('Masukkan salah');
            writeln('Masukkan input seperti yang tertera pada kurung di Menu.'); 
        end;
            
            
    until (str_choice = 'exit');
   
    end;  

end.
