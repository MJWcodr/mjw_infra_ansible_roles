# Ansible Collection - mjwcodr.mjw_infra_ansible_roles

Documentation for the collection.

## Variables to configure

You can lookup all variables, that one is able to configure in the `varsToBeSet.yml`

Further you need to supply an ssh public key for the users you choose to setup and an `rclone.conf` for a lot of use cases as well

## Setting up Rclone

To configure Rclone you need to include an `rclone.conf`, which implements the backends:
"cryptdrive" and if you want to use backup using restic "backup"
