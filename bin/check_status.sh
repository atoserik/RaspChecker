#!/bin/bash

today=$(date +%Y%m%d)
rootDir="placeholder"
logDir=$rootDir"logs/"
logFile=$logDir"status_"${today}".log"

cpu=$(</sys/class/thermal/thermal_zone0/temp)
echo "$(date +'%Y/%m/%d %H:%M:%S') - GPU: $(/opt/vc/bin/vcgencmd measure_temp) - CPU: temp=$((cpu/1000))'C - Volts: $(/opt/vc/bin/vcgencmd measure_volts) - Throttle: $(/opt/vc/bin/vcgencmd get_throttled)" >> $logFile

