default: all

all:  deploy provision test destroy

deploy:
	echo "Deploying the Infrastructure"
	ansible-playbook deployInfra.yml
	#discover bastion name or ip ???
	echo "Populate the Ansible Inventory file"
	ansible-playbook populate_inventory.yml -e "user_name=ubuntu key=testkey.pem bastion=172.24.4.7"

provision:
	echo "Wait for 30 sec (instances to bootup)  "
	sleep 30
	echo "Provisioning the Instances"	
	ansible-playbook -i hosts provision.yml

test:
	echo "Perform the tests"	
	# discover the vm2 private ip??
	ansible-playbook -i hosts test.yml -e "serverip=192.168.1.3"

destroy:
	echo "Destroying the Infrastructure"		
	ansible-playbook -i hosts destroyInfra.yml	
