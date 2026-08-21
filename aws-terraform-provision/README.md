### Goals

The [roadmap.sh challenge](https://roadmap.sh/projects/iac-digitalocean) requires the creation of a droplet on DigitalOcean via Terraform.

With my existing infrastructure hosted on DigitalOcean, I've instead opted to focus my efforts on a test.judah.sh instance in AWS. 

#### Terraform
I'll use Terraform for the following, within AWS + Cloudflare:

- Configuring the VPC.
- Provisioning a small EC2 instance.
- Setting up a security group - default deny SSH, which will instead be handled by Tailscale.
- Configuring a subdomain of judah.sh through Cloudflare with proxying on.

#### Ansible
Once the infrastructure is ready, I'll use Ansible to:

- Install Docker 
- Grab a container from the github container registry and deploy it.
- Configure Nginx.
- Configure firewall rules, SSH hardening, fail2ban, remove ubuntu/default user once 'judah' has been added with my existing ssh key. 
- Configure unattended-upgrades, monit for Nginx
- Configure Tailscale and only allow SSH traffic over my tailnet.

#### Validation

Once deployed, I'll verify:

- test.judah.sh is reachable over HTTPS.
- HTTP redirects to HTTPS where appropriate.
- The application container is running.
- SSH is inaccessible from the public interface.
- SSH is accessible through Tailscale.
- Firewall rules behave as expected.
- Security updates are configured.
- The server can be destroyed and completely recreated from code.

#### Nice-to-haves

- Automatically configure my [existing CI pipeline](https://github.com/ilbic/devops-labs/tree/main/blue-green) to be in place on the new infrastructure, rather than pulling a container. 