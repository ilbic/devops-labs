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

