#!/bin/bash

show_help(){
    echo "Dostepne opcje:"
    echo "--date	-d Pokaz dzisiejsza date"
    echo "--logs [N]	-l Stworz plik N log (domyslnie: 100)"
    echo "--help	-h Pokaz pomoc"
}

create_logs(){
    num_files=${1:-100}
    for i in $(deq 1 $num_files); do
	echo -e "Nazwa pliku: log$i.txt\nScript name: $0\nDate: $(date)" > log$i.txt
    done
}

case "$1" in
    --date|-d)
	date
	;;
    --logs|-l)
	create_logs "$2"
	;;
    --help|-h)
	show_help
	;;
    *)
	echo "Bledna opcja. Uzyj --help lub -h w celu uzyskania pomocy."
	;;
esac
