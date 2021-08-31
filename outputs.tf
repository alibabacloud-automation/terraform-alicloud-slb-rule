output "this_load_balancer_id" {
  value = alicloud_slb_load_balancer.default.id
}

output "this_rule_id" {
  value = alicloud_slb_rule.default.id
}

output "this_rule_name" {
  value = alicloud_slb_rule.default.name
}
