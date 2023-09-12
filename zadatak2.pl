print "Unesite niz brojeva odvojenih razmakom: ";
my $input = <STDIN>;
chomp($input);

my @numbers = split(/\s+/, $input); #splitaj po prazninama
my $sum = 0;
my $brojac = 0;

foreach my $number (@numbers) {
    $sum += $number;
    $brojac++;
}

my $average = $sum / $brojac;
print "Aritmeticka sredina unesenih brojeva je: $average\n";