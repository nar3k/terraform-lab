provider "yandex" {
  token     = "${var.token}"
  cloud_id  = "${var.cloud_id}"
  folder_id = "${var.folder_id}"
}

data "yandex_compute_image" "base_image" {
  family = "${var.yc_image_family}"
}



resource "yandex_compute_instance" "salt-master" {
// ЗАПОЛНИТЕ ТУТ ВСЕ ПРАВИЛЬНО
  metadata {
    ssh-keys  = "centos:${file("${var.public_key_path}")}"
    user-data = "${file("boostrap/salt-master.yaml")}"
  }
}


resource "yandex_compute_instance" "salt-minion" {

// ЗАПОЛНИТЕ ТУТ ВСЕ ПРАВИЛЬНО
  metadata {
    ssh-keys  = "centos:${file("${var.public_key_path}")}"
    user-data = "${data.template_file.salt-minion.rendered}"
  }

}

locals {
  master_ip = "${yandex_compute_instance.salt-master.network_interface.0.nat_ip_address}"
  minion_ips = ["${yandex_compute_instance.salt-minion.*.network_interface.0.nat_ip_address}"]
}
