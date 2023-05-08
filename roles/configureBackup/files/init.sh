#!/bin/bash
# script to initialize restic repository if it does not exist

# Load Environment Variables
source /etc/restic/restic.env

# check if restic repository exists
restic -r $RESTIC_REPOSITORY --password-command "echo $RESTIC_PASSWORD" snapshots > /dev/null 2>&1

# if restic repository does not exist, initialize it
if [ $? -ne 0 ]; then
    restic \
        -r $RESTIC_REPOSITORY \
        --password-command "echo $RESTIC_PASSWORD" \
        --log-file "$PATH_TO_LOG_FILE" \
        init
fi
