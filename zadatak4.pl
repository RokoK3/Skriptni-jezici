
sub ispis(){
 @data=split ";",$_[0]; #podijeli na temelju dvotocke
 print "$data[0] $data[1] $data[2] - PROBLEM: "; #ispisi jmbag prezime ime -problem
 ($pocetak) = $data[3] =~ m/(^[\d-]+[ ][\d:]+)/; #datum(u njemu su brojevi i -) pa razmak pa pocetak(brojevi i :)
 print "$pocetak --> $data[4]\n";
}

while(<>){
    chomp;
    #provjeri datum
    if(! m/([\d]{4}-[\d]{2}-[\d]{2}).*\1/){ #trazi datum GGGG-MM-DD pa zatim bilo sto .* i onda opet taj datum \1
        &ispis($_);
    }else{ 
        m/([\d]+):[\d]{2}.*([\d]{2}):[\d]{2}:[\d]{2}/; #prva () je $1 druga () je $2. prvo trazimo HH:MM, nakon toga bilo sto .*, a zatim HH:MM:SS
        if ($2 >= $1 + 1){ #ako je predaja nakon vise od 1h
            &ispis($_);
        } 
    }
}

