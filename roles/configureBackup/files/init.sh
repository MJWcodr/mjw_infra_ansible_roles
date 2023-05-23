#!/bin/bash
# script to initialize restic repository if it does not exist

# Load Environment Variables
# shellcheck disable=SC1091
source /etc/restic/restic.env

# check if restic repository exists
if ! restic -r "$RESTIC_REPOSITORY" --password-command "echo $RESTIC_PASSWORD" snapshots; then
    # initialize restic repository
    restic \
        --repo "$RESTIC_REPOSITORY" \
        --password-command "echo $RESTIC_PASSWORD"
        init
fi
