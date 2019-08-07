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


JENKINS_BACKUP_DIR=/var/jenkins_backup
PLAYBOOK_BUILD=build_image.yml
PLAYBOOK_DIR=/etc/ansible/playbooks
BASEDIR=$(dirname $0)


echo "*** Creating Jenkins Backup Dir( $JENKINS_BACKUP_DIR ). ***"
mkdir -p $JENKINS_BACKUP_DIR


echo "*** Build Docker Image with Dockerfile with ansible playbook ***"
ansible-playbook $PLAYBOOK_BUILD



