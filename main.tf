data "alicloud_instance_types" "default" {
  availability_zone = var.availability_zone
  cpu_core_count    = var.cpu_core_count
  memory_size       = var.memory_size
}

data "alicloud_images" "default" {
  name_regex  = var.images_name_regex
  most_recent = var.images_most_recent
  owners      = var.images_owners
}

resource "alicloud_slb_load_balancer" "default" {
  load_balancer_name = var.name
  vswitch_id         = var.vswitch_id
  load_balancer_spec = var.spec
}

resource "alicloud_slb_listener" "default" {
  load_balancer_id          = alicloud_slb_load_balancer.default.id
  backend_port              = var.backend_port
  frontend_port             = var.frontend_port
  protocol                  = var.protocol
  bandwidth                 = var.bandwidth
  health_check_connect_port = var.health_check_connect_port
}

resource "alicloud_slb_server_group" "default" {
  load_balancer_id = alicloud_slb_load_balancer.default.id
}

resource "alicloud_slb_rule" "default" {
  load_balancer_id          = alicloud_slb_load_balancer.default.id
  frontend_port             = alicloud_slb_listener.default.frontend_port
  name                      = var.name
  domain                    = var.domain
  url                       = var.url
  server_group_id           = alicloud_slb_server_group.default.id
  cookie                    = var.cookie
  cookie_timeout            = var.cookie_timeout
  health_check_http_code    = var.health_check_http_code
  health_check_interval     = var.health_check_interval
  health_check_uri          = var.health_check_uri
  health_check_connect_port = var.rule_health_check_connect_port
  health_check_timeout      = var.health_check_timeout
  healthy_threshold         = var.healthy_threshold
  unhealthy_threshold       = var.unhealthy_threshold
  sticky_session            = var.sticky_session
  sticky_session_type       = var.sticky_session_type
  listener_sync             = var.listener_sync
  scheduler                 = var.scheduler
  health_check_domain       = var.health_check_domain
  health_check              = var.health_check
}
