echo 'Lanzamos el despliegue con ansible:'

cd ansible;
ansible-playbook -i host playbook.yaml;
cd ..;
