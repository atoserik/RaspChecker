#!/bin/bash

data=$(date +%Y%m%d)
logDir="/opt/RaspChecker/logs/"
logFile=$logDir"status_"${data}".log"
#echo $logDir $logFile

cpu=$(</sys/class/thermal/thermal_zone0/temp)
#echo "$(date +'%Y/%m/%d %H:%M:%S') - GPU: $(/opt/vc/bin/vcgencmd measure_temp) - CPU: temp=$((cpu/1000))'C - Volts: $(/opt/vc/bin/vcgencmd measure_volts) - Throttle: $(/opt/vc/bin/vcgencmd get_throttled)"
echo "$(date +'%Y/%m/%d %H:%M:%S') - GPU: $(/opt/vc/bin/vcgencmd measure_temp) - CPU: temp=$((cpu/1000))'C - Volts: $(/opt/vc/bin/vcgencmd measure_volts) - Throttle: $(/opt/vc/bin/vcgencmd get_throttled)" >> $logFile

