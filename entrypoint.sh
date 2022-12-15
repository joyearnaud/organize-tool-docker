#!/bin/sh

if [ $# -eq 1 ]
  then
    (crontab -l 2>/dev/null; echo "$1 /usr/local/bin/organize sim >> /var/log/organize/organize.log 2>&1") | crontab -
    service cron restart
    /bin/bash
  else
    while true; do
      ls -d Input | entr -d /usr/local/bin/organize sim >> /var/log/organize/organize.log 2>&1 && exit 0
    done
fi