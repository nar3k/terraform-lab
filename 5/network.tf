resource "yandex_vpc_network" "network" {
  name = "terraform-network"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = ""
  zone           = ""
  network_id     = "${yandex_vpc_network.network.id}"
  v4_cidr_blocks = ["192.168.200.0/24"]
}

locals {
  subnet_id = "${yandex_vpc_subnet.subnet.id}"
}
