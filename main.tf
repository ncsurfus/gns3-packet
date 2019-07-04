provider "packet" {
  auth_token = "${var.packet_token}"
}

output "network" {
    value = "${packet_device.gns3_svr.access_public_ipv4}"
}

resource "packet_device" "gns3_svr" {
  hostname         = "gns3_svr"
  plan             = "t1.small.x86"
  facilities       = ["ewr1"]
  operating_system = "ubuntu_18_04"
  billing_cycle    = "hourly"
  project_id       = "${var.packet_project}"

  connection {
    type        = "ssh"
    host        = "${self.access_public_ipv4}"
    user        = "root"
    private_key = "${file(var.ssh_key)}"
    timeout     = "120s"
  }

  provisioner "file" {
    source      = "conf/"
    destination = "~/"
  }

  provisioner "remote-exec" {
    inline = [
      "apt-get update",
      "apt-get install -y --no-install-recommends docker.io docker-compose",
      "curl 'https://www.duckdns.org/update?domains=${var.duckdns_domain}&token=${var.duckdns_token}'",
      "systemctl start docker",
      "systemctl enable docker",
      "docker-compose -f ~/docker-compose.yml up -d"
    ]
  }
}