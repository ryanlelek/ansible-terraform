Ansible with Terraform
======================

# Introduction
We use Terraform the create machines and automatically provision those machines with Ansible.  
Provider is DigitalOcean but you can edit it and use a different cloud service.  
This will show some of the intermediate skills for DevOps for learning.

# Steps
1. Edit `./env.sh` with DigitalOcean API key and edit SSH key filepath if needed.
2. Run `source ./env.sh` to load environment variables
3. Edit `provider.tf` bottom to the SSH Key name you added to DigitalOcean.
4. Run `terraform init -upgrade` to install dependencies.
5. Run `terraform apply` and it will create with Terraform and provision with Ansible.
6. Check the `./inventory` file for your loadbalancer ip. Visit this in curl or a browser and see the traffic flip-flop between web servers.
7. By default, there are 2 web servers. Edit `count` in `web.tf` file to a higher number to test further if desired.

# Re-Running
- `ansible-playbook -i ./inventory ./playbooks/combo.yml`
- `terraform destroy -auto-approve && terraform apply -auto-approve`

# Note
This is for illustration purposes only and is not designed for security, performance, or the latest versions of packages.  
