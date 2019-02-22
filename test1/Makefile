default: all

all:  deploy provision test destroy

deploy:
	ansible-playbook deployInfra.yml --verbose
	ansible-playbook populate_inventory.yml --verbose
provision:
	sleep 30
	ansible-playbook -i hosts provision.yml --verbose
test:
	ansible-playbook -i hosts test.yml --verbose	
destroy:
	ansible-playbook -i hosts destroyInfra.yml --verbose	
