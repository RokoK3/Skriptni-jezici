#!/bin/bash
#1 zad
proba="Ovo je proba"

#2 zad
echo $proba
#

#3 zad
lista_datoteka=(*.*)
echo "${lista_datoteka[*]}" #prikazi sve elemente polja

#4 zad
proba3="${proba}. ${proba}. ${proba}."
echo "$proba3"

#5 zad
a=4; 
b=3; 
c=7;
d=$(((a+4)*b%c))
echo "a: $a"
echo "b: $b"
echo "c: $c"
echo "d: $d"


#6 zad
broj_rijeci=$(cat *.txt | wc -w)
echo "Ukupan broj riječi u .txt datotekama: $broj_rijeci"

#7
ls ~