
# https://www.terraform.io/language/functions/templatefile
resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tftpl", {
    lb_id    = "${digitalocean_droplet.lb.id}"
    lb_ipv4  = "${digitalocean_droplet.lb.ipv4_address}"
    web_ids  = "${digitalocean_droplet.web.*.id}"
    web_ipv4 = "${digitalocean_droplet.web.*.ipv4_address}"
  })
  filename = "inventory"

  # https://www.terraform.io/language/resources/provisioners/local-exec
  provisioner "local-exec" {
    command = "sleep 60; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ./inventory ./playbooks/combo.yml"
  }

}
