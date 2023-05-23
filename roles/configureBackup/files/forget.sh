#!/bin/bash
# script to forget old snapshots and prune the repository

# Load Environment Variables
source /etc/restic/restic.env

# set path to log file
DEBUG_LOG="/var/log/restic.log"

# forget old snapshots
restic \
    -r "$RESTIC_REPOSITORY" \
    --password-command "echo $RESTIC_PASSWORD" \
    forget \
    --keep-last 7 \
    --keep-daily 7 \
    --keep-weekly 4 \
    --keep-monthly 6 \
    --keep-yearly 2

# prune the repository
restic \
    -r "$RESTIC_REPOSITORY" \
    --password-command "echo $RESTIC_PASSWORD" \
    prune

# limit the length of the log file
# remove all but the last 1000 lines
tail -n 1000 "$DEBUG_LOG" > "$DEBUG_LOG.tmp" && mv "$DEBUG_LOG.tmp" "$DEBUG_LOG"

# clear rclone log file
RCLONE_LOG="/var/log/cryptdrive.log"
tail -n 1000 "$RCLONE_LOG" > "$RCLONE_LOG.tmp" && mv "$RCLONE_LOG.tmp" "$RCLONE_LOG"