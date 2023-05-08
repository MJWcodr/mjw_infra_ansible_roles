#!/bin/bash
# script to create a test backup using restic

## Load Environment Variables

source /etc/restic/restic.env

## Restic loads the environment variables from the file, like $RESTIC_PASSWORD_COMMAND and $RESTIC_REPOSITORY, and thus they are not needed in the command line.
restic -r $RESTIC_REPOSITORY \
    backup $PATH_TO_BACKUP \
    --password-command "echo $RESTIC_PASSWORD"