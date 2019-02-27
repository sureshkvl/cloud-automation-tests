#variables
user_name=ubuntu
key=test-key

default: all

all:  deploy provision test destroy

deploy:
	echo "Deploying the Infrastructure"
	ansible-playbook deployInfra.yml 
	echo "Populate the Ansible Inventory file"
	ansible-playbook populate_inventory.yml -e "user_name=$(user_name) key=$(key) bastion=$$(cat terraform.tfstate | jq -r .modules[0].outputs.bastion_ip.value)"

provision:
	echo "Provisioning the Instances"	
	ansible-playbook -i hosts provision.yml

test:
	echo "Perform the tests"	
	ansible-playbook -i hosts test.yml -e "server_ip=$$(cat terraform.tfstate | jq -r .modules[0].outputs.server_ip.value)"

destroy:
	echo "Destroying the Infrastructure"		
	ansible-playbook -i hosts destroyInfra.yml	
