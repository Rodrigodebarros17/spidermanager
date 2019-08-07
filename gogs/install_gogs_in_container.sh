#!/bin/bash
#


clear
# Checking if is SUDO
if (( $EUID != 0 )); then

    echo "********************************************"
    echo "********    Please run as root    **********"
    echo "********************************************"
    exit
fi


GOGS_DIR=/var/gogs
PLAYBOOK_BUILD=build_image.yml
PLAYBOOK_DIR=/etc/ansible/playbooks
BASEDIR=$(dirname $0)

#Verify if container gogs alredy instaled
if [ -d "$GOGS_DIR" ] 
then
    DATE=$(date +%Y%m%d-%H%M%S)
    echo "*** Directory $GOGS_DIR alredy existes. Making Backup ***" 
    mkdir -p $BASEDIR/backups

    tar -czf $BASEDIR/backups/gogs_$DATE.tar.gz $GOGS_DIR
    echo "*** Cleaning directory $GOGS_DIR ***"
    rm -rf $GOGS_DIR/*

else
    echo "*** Creating gogs Dir( $GOGS_DIR ). ***"
    mkdir -p $GOGS_DIR
fi


echo "*** Cheking if ansible is instaled ***"
if [ ! -d "$PLAYBOOK_DIR" ]
then
   echo "************* ERROR: Ansible not instaled. Please install! ****************"
   exit 1

fi

echo "*** Build Docker Image with Dockerfile with ansible playbook ***"
ansible-playbook $PLAYBOOK_BUILD



