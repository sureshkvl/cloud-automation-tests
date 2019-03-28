#variables
user_name=ubuntu
key=test-key

default: all

all:  deploy provision test destroy

deploy:
	echo "Deploying the Infrastructure"
	ansible-playbook deployInfra.yml 
	echo "Populate the Ansible Inventory file"
	ansible-playbook populate_inventory.yml -e "user_name=$(user_name) key=$(key) bastion=$$(cat terraform.tfstate | jq -r .modules[0].outputs.sg_vm1_fip.value)"

provision:
	echo "Provisioning the Instances"	
	ansible-playbook -i hosts provision.yml

test:
	echo "Perform the tests"	
	ansible-playbook -i hosts test.yml -e "sg_vm2_ip=$$(cat terraform.tfstate | jq -r .modules[0].outputs.sg_vm2_ip.value)"

destroy:
	echo "Destroying the Infrastructure"		
	ansible-playbook -i hosts destroyInfra.yml	
