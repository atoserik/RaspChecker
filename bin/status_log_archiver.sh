#!/bin/bash

rootDir="/opt/Software/RaspChecker/"
LogDir=$rootDir"logs/"

if [ $# -eq 0 ] ; then
   LastMonth=$(($(date +%Y%m) - 1))
else
  echo "Interactive mode detected: LastMonth will be set to $1" 
  LastMonth="$1" 
fi

LogFile="Archive_"$LastMonth".log"

echo "--- Inizio archiviazione ---" >> $LogDir"/"$LogFile

mkdir -p $LogDir/$LastMonth
if [ -d $LogDir/$LastMonth ] ; then
    echo "Cartella LastMonth correttamente creata" >> $LogDir"/"$LogFile
else
    echo "Cartella non creata" >> $LogDir"/"$LogFile
    exit 99
fi

find $LogDir -name "*$LastMonth*log" | xargs -I {} mv {} $LogDir/$LastMonth/
rc=$?
if [ $rc == 0 ]; then
    NumFile=`ls -A $LogDir/$LastMonth | wc -l`
    echo "Spostati nella cartella "$NumFile" File" >> $LogDir/$LogFile
else 
    echo "IL comando di find e copia non completato correttamente" >>$LogDir/$LogFile
    exit 98
fi

tar  -czf $LogDir/status_$LastMonth.tar.gz -C $LogDir/$LastMonth $LogDir/$LastMonth
rc=$?
if [ $rc == 0 ] ; then
    echo "Compressione completata correttamente" >> $LogDir/$LogFile
    rm -Rf $LogDir/$LastMonth
    if [ ! -d  $LogDir/$LastMonth ] ; then
        echo "Pulizia della cartella intermedia completata" >> $LogDir/$LogFile
    else
        echo "Pulizia della cartella in errore" >> $LogDir/$LogFile
    fi
fi

