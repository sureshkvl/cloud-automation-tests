
#test variables
user_name=ubuntu
key=testkey.pem

server_ip := $(shell cat terraform.tfstate | jq -r .modules[0].outputs.server_ip.value) 
bastion_ip := $(shell cat terraform.tfstate | jq -r .modules[0].outputs.bastion_ip.value)

default: all

all:  deploy provision test destroy

deploy:
	echo "Deploying the Infrastructure"
	ansible-playbook deployInfra.yml
	#wait for 5 secs for populating the tf file
	sleep 5
	echo "bastion ip  is",  $(bastion_ip)
	echo "bastion ip  is",  $(server_ip)
        
	echo "Populate the Ansible Inventory file"
	ansible-playbook populate_inventory.yml -e "user_name=$(user_name) key=$(key) bastion=$(bastion_ip)"

provision:
	echo "Wait for 10 sec (instances to bootup)  "
	sleep 10
	echo "Provisioning the Instances"	
	ansible-playbook -i hosts provision.yml

test:
	echo "Perform the tests"	
	ansible-playbook -i hosts test.yml -e "server_ip=$(server_ip)"

destroy:
	echo "Destroying the Infrastructure"		
	ansible-playbook -i hosts destroyInfra.yml	
