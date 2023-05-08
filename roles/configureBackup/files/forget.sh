#!/bin/bash
# script to forget old snapshots and prune the repository

# Load Environment Variables
source /etc/restic/restic.env

# forget old snapshots
restic \
    -r $RESTIC_REPOSITORY \
    --password-command "echo $RESTIC_PASSWORD" \
    forget \
    --keep-last 7 \
    --keep-daily 7 \
    --keep-weekly 4 \
    --keep-monthly 6 \
    --keep-yearly 2

# prune the repository
restic \
    -r $RESTIC_REPOSITORY \
    --password-command "echo $RESTIC_PASSWORD" \
    prune
