terraform {
  required_providers {
    # https://registry.terraform.io/providers/hashicorp/local/latest/docs
    hashicorplocal = {
      source  = "hashicorp/local"
      version = "2.2.2"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.19.0"
    }
    #linode = {
    #  source  = "linode/linode"
    #  version = "1.27.1"
    #}
    #vultr = {
    #  source  = "vultr/vultr"
    #  version = "2.10.1"
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
