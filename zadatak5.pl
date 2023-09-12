sub ispis{
    @sorted = sort {$studenti{$b} <=> $studenti{$a}} keys %studenti; #$studenti{$b} <=> $studenti{$a} koristim za silazno soritanje, vracam sve kljuceve
    print "Lista po rangu:\n";
    print "-------------------------------\n";
    $n=1;
    foreach $key (@sorted){
        @dio= split ";",$key; #podijeli ime, prezime, jmbag koji su odvojeni ;
        $string = "$dio[1], $dio[2] ($dio[0])";
        printf "%d. %s : %.2f\n",$n,$string,$studenti{$key};
        $n++;
    }
} 


$prviRedakZastavica=0;
while(defined($line = <>)){ #čitaj iz datoteke
    chomp $line;
    
    next if(!rindex $line, "#", 0); #continue na sljedeci redak ako zapocinje sa #

    if($prviRedakZastavica == 0){
        @koef= split ";",$line; #spremam koef
        $prviRedakZastavica=1; #postavi zastavicu da je procitano
    }else{
        ($line) =~ /(^[\d]{10}[;][^\d]+)/; #skupi jmbag, prezime i ime
        $jmbag=$1; #u var jmbag spremi sve uhvaceno reg izrazom
        @grades = split ";",$line; #uzmi ocjene bez ;
        for(1..3){
            shift @grades; #izbacimo prva tri argumenta iz liste(jmbag,prezime,ime)
        }
        $sum=0;
        foreach $index (0..$#grades){ #od 0 do posljednjeg indexa polja
            if($grades[$index] ne "-"){ #ako je ocjena upisana
                $sum += $koef[$index]*$grades[$index]; #ukupna suma je ocjena puta koef
            }
        }
        $studenti{$jmbag}=$sum; #za odredenog studenta upisi ukupan br bodova
    }
}
&ispis(%studenti);