##############################################################
#variables for alicloud_instance_types
##############################################################
cpu_core_count  = 2
memory_size     = 4
##############################################################
#variables for alicloud_images
##############################################################
images_name_regex     = "^centos_6"
images_owners         = "others"
images_most_recent    = false
##############################################################
#variables for alicloud_slb_load_balancer
##############################################################
spec = "slb.s2.medium"
name = "slb-rule-basic-config-update"
##############################################################
#variables for alicloud_slb_listener
##############################################################
backend_port                = 30
frontend_port               = 30
health_check_connect_port   = "10"
bandwidth                   = 10

##############################################################
#variables for alicloud_slb_rule
##############################################################
cookie                         = "23ffsa"
cookie_timeout                 = 200
rule_health_check_connect_port = 30
health_check_timeout           = 40
unhealthy_threshold            = 5
scheduler                      = "wrr"
health_check_domain            = "tests"
health_check                   = "off"