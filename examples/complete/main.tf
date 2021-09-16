data "alicloud_zones" "default" {}

module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_name           = "my_module_vpc"
  vpc_cidr           = "172.16.0.0/16"
  vswitch_name       = "my_module_vswitch"
  vswitch_cidrs      = ["172.16.1.0/24"]
  availability_zones = [data.alicloud_zones.default.ids.0]
}

module "example" {
  source                          = "../.."
  name                            = var.name
  vswitch_id                      = module.vpc.vswitch_ids[0]
  availability_zone               = data.alicloud_zones.default.zones.0.id
  cpu_core_count                  = var.cpu_core_count
  memory_size                     = var.memory_size
  images_name_regex               = var.images_name_regex
  images_most_recent              = var.images_most_recent
  images_owners                   = var.images_owners
  spec                            = var.spec
  backend_port                    = 22
  frontend_port                   = 22
  protocol                        = "http"
  bandwidth                       = var.bandwidth
  cookie_timeout                  = var.cookie_timeout
  health_check_connect_port       = var.health_check_connect_port
  domain                          = "*.aliyun.com"
  url                             = "/image"
  cookie                          = var.cookie
  rule_health_check_connect_port  = var.rule_health_check_connect_port
  health_check_timeout            = var.health_check_timeout
  unhealthy_threshold             = var.unhealthy_threshold
  scheduler                       = var.scheduler
  health_check_domain             = var.health_check_domain
  health_check                    = var.health_check
}
