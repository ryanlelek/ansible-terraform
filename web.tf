
resource "digitalocean_droplet" "web" {
  count  = 2
  image  = "debian-11-x64"
  name   = "web-${count.index}"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  #####
  backups    = false
  monitoring = true
  ipv6       = false
  ssh_keys   = [
    data.digitalocean_ssh_key.terraform.id
  ]
  resize_disk       = false
  tags              = []
  droplet_agent     = true
  graceful_shutdown = false

  connection {
    host        = self.ipv4_address
    agent       = false
    user        = "root"
    type        = "ssh"
    private_key = file(var.SSH_KEY)
  }
  provisioner "file" {
    source      = "./files/upload_file.txt"
    destination = "/root/upload_file.txt"
  }
  provisioner "remote-exec" {
    script = "./files/initial_script.sh"
  }
}
