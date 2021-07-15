locals {
  this_load_balancer_id          = alicloud_slb_load_balancer.default.id
  this_rule_id                   = alicloud_slb_rule.default.id
  this_name                      = alicloud_slb_rule.default.name
}

output "this_load_balancer_id" {
  value = local.this_load_balancer_id
}

output "this_rule_id" {
  value = local.this_rule_id
}

output "this_name" {
  value = local.this_name
}
