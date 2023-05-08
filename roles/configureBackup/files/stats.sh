#!/bin/bash
# script to view restic repository stats

# Load Environment Variables
source /etc/restic/restic.env

# get stats
restic \
    -r $RESTIC_REPOSITORY \
    --password-command "echo $RESTIC_PASSWORD" \
    --log-file "$PATH_TO_LOG_FILE" \
    stats

# get snapshots
restic \
    -r $RESTIC_REPOSITORY \
    --password-command "echo $RESTIC_PASSWORD" \
    snapshots