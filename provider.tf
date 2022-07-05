terraform {
  required_providers {
    # https://registry.terraform.io/providers/hashicorp/local/latest/docs
    hashicorplocal = {
      source  = "hashicorp/local"
      version = "2.2.3"
    }
    # https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.21.0"
    }
    # https://registry.terraform.io/providers/linode/linode/latest/docs
    #linode = {
    #  source  = "linode/linode"
    #  version = "1.28.0"
    #}
    # https://registry.terraform.io/providers/vultr/vultr/latest/docs
    #vultr = {
    #  source  = "vultr/vultr"
    #  version = "2.11.3"
    #}
  }
}

provider "digitalocean" {
}

variable "SSH_KEY" {
  type        = string
  description = "Local private key"
}

data "digitalocean_ssh_key" "terraform" {
  # Edit to match the name of your SSH key added to DigitalOcean
  name = "EXAMPLESSH"
}
