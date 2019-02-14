provider "yandex" {
  token     = "<>"
  cloud_id  = "<>"
  folder_id = "<>"
}

data "yandex_compute_image" "base_image" {
  family = "<>"
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
      image_id = "${data.yandex_compute_image.base_image.id}"
      type_id = "<>"
      size = "<>"
    }
  }


  network_interface {
    subnet_id = "${local.subnet_id}"
    nat       = true
  }

  metadata {
    ssh-keys  = "centos:${file("<>")}"
  }

}

locals {
  external_ip = "${yandex_compute_instance.slave.network_interface.0.nat_ip_address}"
}
