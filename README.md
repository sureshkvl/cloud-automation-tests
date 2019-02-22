# cloud-automation-tests
cloud-automation-test cases


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

 