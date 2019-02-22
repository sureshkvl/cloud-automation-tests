default: all

all:  deploy provision test destroy

deploy:
	echo "Deploying the Infrastructure"
	ansible-playbook deployInfra.yml --verbose
	echo "Populate the Ansible Inventory file"
	ansible-playbook populate_inventory.yml --verbose

provision:
	echo "Wait for 30 sec (instances to bootup)  "
	sleep 30
	echo "Provisioning the Instances"	
	ansible-playbook -i hosts provision.yml --verbose

test:
	echo "Perform the tests"	
	ansible-playbook -i hosts test.yml --verbose	

destroy:
	echo "Destroying the Infrastructure"		
	ansible-playbook -i hosts destroyInfra.yml --verbose	
