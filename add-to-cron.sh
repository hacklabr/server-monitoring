#!/bin/bash

set -f

HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

command="/bin/bash $HERE/monitoring"
cronline="0 0 * * * $command"

if [[ "$1" =~ ((\*|[0-9][0-9]*)( (\*|[0-9][0-9]*)){4}) ]];
then
    cronline="${BASH_REMATCH[1]} $command"
fi

crontab=$(crontab -l | grep -Fv "$cronline" | grep -v "^ *$")

crontab - <<< "$crontab
$cronline
"

crontab -l

cron_pid=`pgrep cron`
if [ -z $cron_pid ]; then
    echo "Warning: cron service is not running!"
fi

