#!/bin/sh
#
# nagrywarka.sh: cd recording script.
#
# written by:  Michal Kosinski, <mkosinski@info-trade.pl>
#

KATALOG="/home/samba/temporary/2CD"
CDRECORD="/usr/bin/cdrecord"
MKISOFS="/usr/bin/mkisofs"
MKDIR="/bin/mkdir -p"
SPEED="24"
BLANK=""
NAZWA="-V \"\""

echo "

Pliki do nagrania nalezy umiescic w katalogu Temporary/2CD/pliki
Nastepnie w katalogu Temporary/2CD tworzymy pusty plik (bez rozszerzenia):

'start' - nagranie plyty

lub

'start-multi' - nagranie plyty wielosesyjnej

W celu wyczyszczenia nosnika CD-RW umieszamy w katalogu plik o nazwie 'erase'.

Domyslna predkosc nagrywania wynosi 24 - jezeli ma byc inna, nalezy
zdefiniowac ja w pliku o nazwie 'speed' (przed utworzeniem pliku start).

Nazwe plyty mozna zdefiniowac poprzez utworzenie pliku 'nazwa'.

Skrypt sprawdza obecnosc w/w plikow co dwie minuty.
Nie zapomnij o wlozeniu plyty do nagrywarki przed uruchomieniem!
 
W takcie pracy skryptu, w katalogu, pojawiac sie beda pliki:

status-<data>-generuje_iso - generowany jest obraz ISO
status-<data>-nagrywam     - plyta jest w trakcie nagrywania
status-idle                - skrypt w danej chwili nie pracuje

Komunikaty bledow:

niewlasciwy_rozmiar - pliki do nagrania maja objetosc wieksza niz 700MB
nagrywarka_zablokowana - inny uzytkownik korzysta z urzadzenia

Po nagraniu plyty nalezy usunac swoje pliki.
Automatyczne usuwanie odbywa sie codziennie o polnocy.

" > $KATALOG/instrukcja.txt

#ROZMIAR=`du -sm /mnt/samba/Temporary/2CD/pliki |cut -d"/" -f1|sed s/" "/""/g`
#if "700" = "700" ; then {

if [ -f $KATALOG/speed ]; then {
	SPEED=`cat $KATALOG/speed`
	}
fi

if [ -f $KATALOG/erase ]; then {
	BLANK="blank=fast"
	}
fi     

if [ -f $KATALOG/nazwa ]; then {
        NAZWA="-V \"`cat $KATALOG/nazwa`\""
        }
fi

if [ -f /tmp/nagrywarka.lock ] ; then
   exit 1
fi

	if [ -f $KATALOG/start ]; then {

          touch /tmp/nagrywarka.lock
	  rm -f $KATALOG/start* $KATALOG/status* $KATALOG/blad*
          DATA=`date "+%Y-%m-%d_%H-%M-%S"`
	  touch $KATALOG/status-$DATA-generuje_iso
	  $MKISOFS -J -R -joliet-long -o /tmp/cd.iso $KATALOG/pliki/.
	  rm -f $KATALOG/status*
          DATA=`date "+%Y-%m-%d_%H-%M-%S"`
	  touch $KATALOG/status-$DATA-nagrywam
	  $CDRECORD dev=/dev/cd0c speed=$SPEED $BLANK /tmp/cd.iso 
	  rm -f $KATALOG/status* $KATALOG/speed $KATALOG/erase $KATALOG/nagrywarka_zablokowana
	  touch $KATALOG/status-idle
          rm -f /tmp/nagrywarka.lock 
	  }

	  else {
	  
                 if [ -f $KATALOG/start-multi ]; then {
		          touch /tmp/nagrywarka.lock
	        	  rm -f $KATALOG/start* $KATALOG/status* $KATALOG/blad*
			  DATA=`date "+%Y-%m-%d_%H-%M-%S"`
		          touch $KATALOG/status-$DATA-generuje_iso
		          $MKISOFS -J -R -joliet-long -o /tmp/cd.iso $KATALOG/pliki/.
	        	  rm -f $KATALOG/status*
                          DATA=`date "+%Y-%m-%d_%H-%M-%S"`
		          touch $KATALOG/status-$DATA-nagrywam
		          $CDRECORD -multi dev=/dev/cd0c speed=$SPEED $BLANK /tmp/cd.iso
		          rm -f $KATALOG/status* $KATALOG/speed $KATALOG/erase $KATALOG/nagrywarka_zablokowana
		          touch $KATALOG/status-idle
		          rm -f /tmp/nagrywarka.lock
		          }
                  else {
        	          exit 1
                  }
                  fi
                }
           fi
        }
fi

