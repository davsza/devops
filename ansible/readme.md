## Ansible
ansible all -i inventory.yaml -m ping
ansible-playbook -i inventory.yaml playbook.yaml --ask-become-pass --extra-vars "@vault_secrets.yaml" --ask-vault-pass
