#!/bin/bash

set -euo pipefail

terraform plan

terraform apply -auto-approve

server_public_ip=$(terraform output -raw test_judah_sh_public_ip)

echo "$server_public_ip"