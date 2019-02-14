data "template_file" "salt-minion" {
  template = "${file("boostrap/salt-minion.yaml")}"
  vars {

        salt_master_ip = "${local.master_ip}"

    }
}
