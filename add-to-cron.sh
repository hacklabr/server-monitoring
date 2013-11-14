#!/bin/bash

crontab - << EOF
$(crontab -l)
* 0 * * * /bin/bash $(readlink -f monitoring)
EOF

crontab -l

cron_pid=`pgrep cron`
if [ -z $cron_pid ]; then
    echo "Warning: cron service is not running!"
fi

