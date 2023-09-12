use locale;
use utf8;
use open ':locale';

my $prefiksDuljina = pop @ARGV;
my @files = @ARGV;

# Ako nema navedenih datoteka, čitaj sa standardnog ulaza
if (@files == 0) {
    @files = ('-');
}

foreach my $file (@files) {
    open my $data, $file or die "Ne postoji file $file: $!";

    while( my $line = <$data>)  {   #za svaki line
        @words = split " ",$line; #podijeli razmake

        foreach (@words){ #za svaku rijec
            if(length($_) >= $prefiksDuljina ){ #$_ je trenutna rijec, gledaj je li rijec >= od prefiksa
                $count{lc substr $_, 0, $prefiksDuljina}++; #lowercase, gledaj substring trenutne rijeci od indexa 0 do duljine prefiksa
            }
        }
    }
    close $data;
}

foreach my $string (sort keys %count) {
    printf "%s : %s\n", $string, $count{$string}; #ispisi ime prefiksa i njegov count
}