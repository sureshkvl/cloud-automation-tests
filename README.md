# cloud-automation-tests

## How to setup/install:
=========================


#!/bin/bash
apt-get update 
apt-get install -y --force-yes  vim git unzip python-dev libffi-dev libssl-dev libxml2-dev libxslt1-dev zlib1g-dev python-pip software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install -y --force-yes ansible


unzip /tmp/files/terraform_0.11.11_linux_amd64.zip
mv /tmp/files/terraform /usr/bin/.
tar xvzf terraform-inventory_linux_x64.tar.gz
mv terraform-inventory /usr/bin/.





cloud-automation-test cases
============================

How to run:

ansible-playbook deployInfra.yml --verbose
ansible-playbook populate_inventory.yml --verbose
ansible-playbook -i hosts provision.yml --verbose
ansible-playbook -i hosts test.yml --verbose
ansible-playbook destroyInfra.yml --verbose



Others:
=======
1. configure ssh retries in ansible config file
    sudo vi /etc/ansible/ansible.cfg
    [ssh_connection]
    retries = 6





How to run
===========
export ENV=devstack
export test=sg
./run_test.sh 