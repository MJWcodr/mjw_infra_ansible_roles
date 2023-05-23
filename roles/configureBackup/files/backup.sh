#!/bin/bash
# script to backup files using restic

# Load Environment Variables
source /etc/restic/restic.env

PATH_TO_LOG_FILE="/var/log/restic.log"

# Restic loads the environment variables from the file, like $RESTIC_PASSWORD_COMMAND and $RESTIC_REPOSITORY, and thus they are not needed in the command line.
restic -r $RESTIC_REPOSITORY \
    backup $PATH_TO_BACKUP \
    --files-from $PATH_TO_BACKUP_LIST  \
    --exclude-file "$PATH_TO_EXCLUDE_LIST" \
    --exclude-caches \
    --tag "cryptdrive_backup" \
    --password-command "echo $RESTIC_PASSWORD"

# add stats to log file
restic -r $RESTIC_REPOSITORY \
    stats \
    --password-command "echo $RESTIC_PASSWORD" \
    >> "$PATH_TO_LOG_FILE"