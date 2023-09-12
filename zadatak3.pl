sub print_header {
    my $datum = shift;
    print "\nDatum: $datum\n";
    print "sat : broj ponavljanja\n";
    print "----------------------------\n";
}

#iz datoteke
if ($ARGV[0]) {
    my $file = $ARGV[0];
    open my $data, $file or die "Ne postoji file $file: $!";

    ($datum) = $ARGV[0] =~ m/([\d]{4}-[\d]{2}-[\d]{2})/; #usporedbi argv0 sa regularnim izrazom koji trazi datum u formatu GGGG-MM-DD, taj datum dodaj u varijablu datum
    print_header($datum);

    while (my $line = <$data>) {
        ($hour) = $line =~ m/[\d]{4}:([\d]{2}):[\d]{2}:[\d]{2}/;   #godina:SAT:minuta:sekunda, zadrzi samo sat u oblim zagradama
        $counter{$hour}++;
        if (eof) {
            foreach $sat (sort keys %counter) {
                printf "%d : %d\n", $sat, $counter{$sat}; #za svaki sat ispisi vrijednost
            }
        }
    }
#s ulaza
} else {
    ($datum) = <> =~ m/([\d]{4}-[\d]{2}-[\d]{2})/;
    print_header($datum);

    while (<>) {
        ($hour) = $_ =~ m/[\d]{4}:([\d]{2}):[\d]{2}:[\d]{2}/; #godina:SAT:minuta:sekunda, zadrzi samo sat u oblim zagradama
        $counter{$hour}++;
        if (eof) {
            foreach $sat (sort keys %counter) {
                printf "%3d : %d\n", $sat, $counter{$sat};
            }
        }
    }
}