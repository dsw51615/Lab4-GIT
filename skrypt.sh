#!/bin/bash

show_help(){
    echo "Dostepne opcje"
    echo "--date -d    Pokaz dzisiejsza date"
    echo "--logs -l [N]    Stworz plik N log (domyslnie: 100)"
    echo "--help -h    Pokaz pomoc"
    echo "--init       Kolnuj repozutorium do bierzacego katalogu"
    echo "--error -e [N]   Stworz plik N error (domyslnie: 100)"
}

create_logs(){
    num_files=${1:-100}
    for i in $(deq 1 $num_files); do
	echo -e "File name: log$i.txt\nScript name: $0\nDate: $(date)" > log$i.txt
    done
}

create_errors(){
    num_files=${1:-100}
    mkdir -p error
    for i in $(seq 1 $num_files); do
	echo -e "File name: error/error$i.txt\nScript name: $0\nDate: $(date)" > error
    done
}

init_repo(){
    git clone https://github.com/dsw51615/Lab4-GIT.git
    ewxport PATH=$PATH:$(pwd)/Lab4-GIT
}

case "$1" in
    --date|-d)
	date
	;;
    --logs|-1)
	create_logs "$2"
	;;
    --init)
	init_repo
	;;
    --error|-e)
	create_errors "$2"
	;;
    *)
	echo "Bledna opcja. Uzyj --help lub -h w celu uzyskania pomocy."
	;;
esac
