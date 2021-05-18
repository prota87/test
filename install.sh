#!/bin/bash

export SYSTEMD_PAGER=''

function SetLogFile {
    export LOG_FILE="/tmp/install_fastpanel.debug"

    if [ -f "$LOG_FILE" ]; then
        rm "$LOG_FILE"
    fi
    
    exec 3>&1
    exec &> $LOG_FILE
}
