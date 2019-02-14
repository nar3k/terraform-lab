provider "yandex" {
  token     = "<>"
  cloud_id  = "<>"
  folder_id = "<>"
}


resource "yandex_compute_instance" "slave" {
  name        = "<>"
  hostname    = "<>"
  description = "<>"
  zone = "<>"

  resources {
    cores  = "<>"
    memory = "<>"
  }

  boot_disk {
    initialize_params {
      image_id = "<>"
      type_id = "<>"
      size = "<>"
    }
  }


  network_interface {
    subnet_id = "<>"
    nat  = true
  }

  metadata {
    ssh-keys  = "centos:${file("<>")}"
  }

}


locals {
  external_ip = "${yandex_compute_instance.slave.network_interface.0.nat_ip_address}"
}

output "external_ip_addresses" {
  value = "${local.external_ip}"
}
