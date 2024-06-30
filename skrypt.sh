#!/bin/bash

show_help(){
    echo "Dostepne opcje"
    echo "--date -d    Pokaz aktualna date"
    echo "--logs -l [N]  Stworz plik N log (domyslnie: 100)"
    echo "--help -h    Pokaz pomoc"
    echo "--init       Kompiuj repozytorium do bierzacego katalogu"
}

create_logs(){
    num_files=${1:-100}
    for i in $(seq 1 $num_files); do
	echo -e "Nazwa pliku: log$i.txt\nScript name: $0\nDate: $(date)" > log$i.txt
    done
}

init_repo(){
    git clone https://github.com/dsw51615/Lab4-GIT.git
    export PATH=$PATH:$(pwd)/Lab4-GIT
}

case "$1" in
    --date|-d)
	date
	;;
    --logs|-l)
	create_logs "$2"
	;;
    --init)
	init_repo
	;;
    --help|-h)
	show_help
	;;
    *)
	echo "Bledna opcja. Uzyj --help lub -h w celu uzyskania pomocy."
	;;
esac
