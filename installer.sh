#!/bin/bash

echo "Setting up env"

rootDir=`pwd`
binDir=$rootDir"/bin"
logsDir=$rootDir"/logs"
today=$(date +%Y%m%d)
user=`whoami`

echo "Looking for log dir"
if [ ! -d $logsDir ]; then
	mkdir $logsDir
fi

echo "sustituting rootDir"
sed -e --in-place "s:placeholder:$rootDir/:g" ./bin/*sh


echo "setting up crontab"

crontab -l -u $user >> original_crontab.cron_${today}
cp original_crontab.cron_${today} updated.cron

echo "
## RaspChecker Section ##
15 00 1 * * $binDir/status_log_archiver.sh
*/2 * * * * $binDir/check_status.sh
" >> updated.cron

crontab -u $user updated.cron

echo "Installation completed!"
