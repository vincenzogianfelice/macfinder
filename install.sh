#!/bin/bash
set +o noclobber

NAME_SCRIPT='macfinder'
LIB='lib'
DIR_BIN='/usr/bin'
DIR_CONF='/etc'
COPY='cp -R'

function copy() {
	echo "* Copia script in $DIR_BIN"
	$COPY "$NAME_SCRIPT" "$DIR_BIN" && chmod +x "$DIR_BIN/$NAME_SCRIPT"

	echo "* Creazione cartella di configurazione $DIR_BIN/$NAME_SCRIPT"
	$COPY lib -R $DIR_CONF/$NAME_SCRIPT
}

if [[ $EUID -ne 0 ]]; then
	echo "Devi lanciarlo da amministratore"
	exit 1
fi

# Se presente, usa il comando rsync per la copia... moolto meglio ;)
if command -v rsync &>/dev/null; then
	COPY='rsync -a --delete'
fi

while getopts "hu" arg; do
	case "$arg" in
		h)
			echo "Usage: $0 -u | -h"
			echo "	-u	Upgrade (Sovrascrive se e' presente gia' qualcosa)"
			echo "	-h	Help"
			exit 0
			;;
		u)
			copy
			find $DIR_CONF/$NAME_SCRIPT -name ".git*" -delete
			exit 0
			;;
		*|?)
		        echo "Digita -h"
			exit 1
			;;
	esac
done

if [ -f "$DIR_BIN/$NAME_SCRIPT" ]; then
	echo "Errore: Esiste gia un qualcosa chiamato '$NAME_SCRIPT' in $DIR_BIN"
	exit 1
fi

if [ -d "$DIR_CONF/$NAME_SCRIPT" ]; then
	echo "Errore: Esiste gia una cartella chiamata '$NAME_SCRIPT' in $DIR_CONF"
	exit 1
fi

mkdir "$DIR_CONF/$NAME_SCRIPT"
copy
find $DIR_CONF/$NAME_SCRIPT -name ".git*" -delete
