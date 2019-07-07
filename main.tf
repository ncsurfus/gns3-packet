provider "packet" {
  auth_token = "${var.packet_token}"
}

output "network" {
    value = "${packet_device.gns3_svr.access_public_ipv4}"
}

resource "packet_device" "gns3_svr" {
  hostname         = "gns3-svr"
  plan             = "t1.small.x86"
  facilities       = ["ewr1"]
  operating_system = "ubuntu_18_04"
  billing_cycle    = "hourly"
  project_id       = "${var.packet_project}"

  connection {
    type        = "ssh"
    host        = "${self.access_public_ipv4}"
    user        = "root"
    private_key = "${file(var.ssh_private_key)}"
    timeout     = "120s"
  }

  provisioner "file" {
    source      = "conf/"
    destination = "~/"
  }

  provisioner "remote-exec" {
    inline = [
      "export DEBIAN_FRONTEND=noninteractive",
      "curl 'https://www.duckdns.org/update?domains=${var.duckdns_domain}&token=${var.duckdns_token}'",
      "apt-get update",
      "apt-get install -y software-properties-common docker.io docker-compose python-pip",
      "systemctl start docker",
      "systemctl enable docker",
      "pip install --upgrade b2",
      "mkdir /data/",
      "b2 authorize-account ${var.b2_account_id} ${var.b2_application_key}",
      "b2 sync --delete --replaceNewer ${var.b2_path} /data/",
      "docker-compose up -d"
    ]
  }

  provisioner "remote-exec" {
    when    = "destroy"
    inline = [
      "docker-compose down",
      "b2 authorize-account ${var.b2_account_id} ${var.b2_application_key}",
      "b2 sync --delete --replaceNewer --excludeRegex '.*\\.ghost' /data/ ${var.b2_path}"
    ]
  }
}