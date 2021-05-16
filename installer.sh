#!/bin/bash

echo "Setting up env"

rootDir=`pwd`
binDir=$rootDir"bin"
logsDir=$rootDir"logs"
today=$(date +%Y%m%d)
user=`whoami`

echo "Looking for log dir"
if [ ! -d $logsDir ]; then
	mkdir $logsDir
fi

echo "setting up crontab"

crontab -l -u $suer >> original_crontab.cron_${today}
cp original_${today} updated.cron

echo "## RaspChecker Section ##
15 00 1 * * /opt/Software/RaspChecker/bin/status_log_archiver.sh
*/2 * * * * /opt/Software/RaspChecker/bin/check_status.sh
" >> updated.cron

crontab updated.cron

echo "Installation completed!"
