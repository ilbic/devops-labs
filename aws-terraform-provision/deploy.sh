#!/bin/bash

set -euo pipefail

terraform plan

terraform apply

server_public_ip=$(terraform output -raw test_judah_sh_public_ip)


# tried printf here but this looks cleaner
cat > inventory.yml <<EOF
---
all:
  hosts:
    test.judah.sh:
      ansible_host: $server_public_ip
EOF

sleep 30

ansible-playbook -i inventory.yml -u ubuntu configure-judah.yml

ansible-playbook -i inventory.yml -u judah configure-ssh.yml

ansible-playbook -i inventory.yml -u judah remove-ubuntu.yml

ansible-playbook -i inventory.yml -u judah install-docker.yml

ansible-playbook -i inventory.yml -u judah start-container.yml --ask-vault-pass

ansible-playbook -i inventory.yml -u judah nginx.yml