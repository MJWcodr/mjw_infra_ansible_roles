#!/bin/bash
# script to forget old snapshots and prune the repository

# Load Environment Variables
source /etc/restic/restic.env

# forget old snapshots
restic \
    -r "$RESTIC_REPOSITORY" \
    --password-command "echo $RESTIC_PASSWORD" \
    forget \
    --log-file "$PATH_TO_LOG_FILE" \
    --keep-last 7 \
    --keep-daily 7 \
    --keep-weekly 4 \
    --keep-monthly 6 \
    --keep-yearly 2

# prune the repository
restic \
    -r "$RESTIC_REPOSITORY" \
    --password-command "echo $RESTIC_PASSWORD" \
    --log-file "$PATH_TO_LOG_FILE" \
    prune

# limit the length of the log file
# remove all but the last 1000 lines
tail -n 1000 "$PATH_TO_LOG_FILE" > "$PATH_TO_LOG_FILE.tmp" && mv "$PATH_TO_LOG_FILE.tmp" "$PATH_TO_LOG_FILE"
