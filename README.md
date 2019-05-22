# MAC Vendor Finder
*Tool to export the MAC Vendor from file list local or through the API from site **macvendors.com** (https://macvendors.com)*

<br />

# ATTENZIONE
# *Per chi avesse gia scaricato il repository... si prega di cancellarlo e di scaricarlo nuovamente.*

<br />

# Descrizione
Esporta il MAC Vendor tramite l'API fornita dal sito **https://macvendors.com**
o da un file contentente una lista di MAC-Vendor. Generalmente il file (per la ricerca in locale) e' *oui.txt*.

# Dipendenze
- curl

# Settings

Importa la tua API da ***macvendors***. Effettua il login su https://app.macvendors.com/auth/login, genera il token
dalla pagina e inseriscila in ***macfinder*** nella variabile **API**:
```
#!/bin/bash

# Coded by: vincenzogianfelice <developer.vincenzog@gmail.com>
# View my github at https://github.com/vincenzogianfelice
# My site: https://vincenzogianfelice.altervista.org

set -o noclobber

########################
API=''  # INSERT YOUR API BEETWEN ' '. (eg.) API='saadljhniu2y78yinh21iuh21nyh2112....'
########################
```

# Download and Upgrade

*Download*
```
git clone https://github.com/vincenzogianfelice/macfinder
cd macfinder
git submodule init
git submodule update
```

*Upgrade*
```
cd macfinder
git pull
git submodule update --remote --merge
```

# Installazione

*Prima installazione:*
```
sudo ./install.sh
```

*Upgrade installazione:*
```
sudo ./install.sh -u
```

*Help:*
```
sudo ./install.sh -h
````

# Donazioni

**BTC:** *3EwV4zt9r5o4aTHyqjcM6CfqSVirSEmN6y*

# Contatti

**Email:** *developer.vincenzog@gmail.com*
