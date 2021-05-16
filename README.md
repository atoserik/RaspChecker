# RaspChecker
### Simple scripts to monitor CPU/GPU temperature, Volts and throttle events with vcgencmd command

The installer.sh will:
- create the logs dir that is the defauolt to store logs file and the archives
- will update crontab to include a measure every 2 minutes, and the compression of the file of the previous month at 00.15 AM of the 1st day of each month

The check_status script will write a log daily file with rows (1 row every 2 minutes) like: 

`2021/05/16 18:04:01 - GPU: temp=48.7'C - CPU: temp=50'C - Volts: volt=0.8375V - Throttle: throttled=0x0`

The status_log_archiver script will create tar.gz archive montly with all the files of the previous month.
