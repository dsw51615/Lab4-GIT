#!/bin/bash

case "$1" in
    --date|-d)
	date
	;;
    --help|-h)
	echo "Dostepne opcje:"
	echo "--date -d  Pokaz dzisiejsza date"
	echo "--help -h  Pokaz pomoc"
	;;
    *)
	echo "Opcja niedostepna. Uzyj --help lub --h w celu uzyskania pomocy"
	;;

esac
