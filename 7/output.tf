output "salt_master" {
  value = "${local.master_ip}"
}

output "salt_minions" {
  value = "${local.minion_ips}"
}
