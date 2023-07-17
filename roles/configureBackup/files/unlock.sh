#!/bin/bash

# Load Environment Variables
source /etc/restic/restic.env

# get stats
restic \
    -r $RESTIC_REPOSITORY \
    --password-command "echo $RESTIC_PASSWORD" \
    unlock
