Alicloud SLB Rule Terraform Module On Alibaba Cloud

terraform-alicloud-slb-rule
---


Terraform module which creates SLB Rule and attach them to one specified instance on Alibaba Cloud.

These types of resources are supported:

* [SLB Rule](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/slb_rule)

----------------------

Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g., main.tf

    ```
      module "rule" {
      source              = "../"
      name                = "slb-rule-basic-config"
      domain              = "*.test.com"
      cookie              = "cookie-test"
      health_check_uri    = "/test"
      health_check_domain = "test"
      }
    ```

2. Setting `access_key` and `secret_key` values through environment variables:

    - ALICLOUD_ACCESS_KEY
    - ALICLOUD_SECRET_KEY
    - ALICLOUD_REGION

## Inputs

| Name | Description | Type | Required | Default |
|------|-------------|:----:|:-----:|:-----:|
| name | The name of a new load balancer. | string | yes | - | 
| spec | The specification of the SLB instance. | string | no | slb.s1.small |
| address_type | The type of address. Choices are 'intranet' and 'internet'. Default to 'internet'. | string | no | internet |
| tags | A mapping of tags to assign to the resource. | map(string) | no | - |
| cidr_block | The CIDR block for the VPC. The cidr_block is Optional and default value is `172.16.0.0/12` after `v1.119.0+`. | string | no | 172.16.0.0/16 |
| images_name_regex | A regex string to filter resulting images by name. | string | no | ^ubuntu_18.*64 |
| images_most_recent | If more than one result are returned, select the most recent one. | bool | no | true |
| images_owners | Filter results by a specific image owner. Valid items are `system`, `self`, `others`, `marketplace`. | string | no | system |
| cpu_core_count | Number of CPU cores. | int | no | 1 |
| memory_size | Size of memory, measured in GB. | int | no | 2 |
| available_disk_category | Filter the results by a specific disk category. Can be either `cloud`, `cloud_efficiency`, `cloud_ssd`, `ephemeral_ssd`. | string | no | cloud_efficiency |
| available_resource_creation | Type of resources that can be created. | string | no | VSwitch |
| internet_charge_type | Internet charge type of the instance, Valid values are `PayByBandwidth`, `PayByTraffic`. Default is `PayByTraffic`. | string | no | PayByTraffic |
| internet_max_bandwidth_out | Maximum outgoing bandwidth to the public network, measured in Mbps (Mega bit per second). Value range: [0, 100]. Default to 0 Mbps. | string | no | 10 |
| instance_charge_type | Valid values are `PrePaid`, `PostPaid`, The default is `PostPaid`. | string | no | PostPaid |
| system_disk_category | Valid values are `ephemeral_ssd`, `cloud_efficiency`, `cloud_ssd`, `cloud_essd`, `cloud`. `cloud` only is used to some none I/O optimized instance. Default to `cloud_efficiency`. | string | no | cloud_efficiency |
| backend_port | Port used by the Server Load Balancer instance backend. Valid value range: [1-65535]. | int | no | 22 |
| frontend_port | Port used by the Server Load Balancer instance frontend. | int | no | 22 |
| protocol | The protocol to listen on. | string | no | http |
| bandwidth | Bandwidth peak of Listener. | int | no | 5 |
| health_check_connect_port | Port used for health check. Valid value range: [1-65535]. Default to `None` means the backend server port is used. | string | no | 20 |
| slb_server_group_port | The port used by the backend server. Valid value range: [1-65535]. | string | no | 80 |
| slb_server_group_weight | Weight of the backend server. Valid value range: [0-100]. Default to 100. | int | no | 100 |
| domain | Domain name of the forwarding rule. It can contain letters a-z, numbers 0-9, hyphens (-), and periods (.), and wildcard characters. | string | yes | - |
| url | Domain of the forwarding rule. It must be 2-80 characters in length. Only letters a-z, numbers 0-9, and characters '-' '/' '?' '%' '#' and '&' are allowed. URLs must be started with the character '/', but cannot be '/' alone. | string | no | - |
| cookie | The cookie configured on the server. It is mandatory when `sticky_session` is `on` and `sticky_session_type` is `server`. Otherwise, it will be ignored. Valid value：String in line with RFC 2965, with length being 1- 200. It only contains characters such as ASCII codes, English letters and digits instead of the comma, semicolon or spacing, and it cannot start with $. | string | no | cookie_test |
| cookie_timeout | Cookie timeout. It is mandatory when sticky_session is `on` and sticky_session_type is `insert`. Otherwise, it will be ignored. Valid value range: [1-86400] in seconds. | int| no | 100 |
| health_check_http_code | Regular health check HTTP status code. Multiple codes are segmented by “,”. It is required when health_check is on. Default to `http_2xx`. Valid values are: `http_2xx`, `http_3xx`, `http_4xx` and `http_5xx`. | string | no | http_2xx |
| health_check_interval | Time interval of health checks. It is required when `health_check` is on. Valid value range: [1-50] in seconds. Default to 2. | int | no | 2 |
| health_check_uri | URI used for health check. When it used to launch TCP listener, health_check_type must be `http`. Its length is limited to 1-80 and it must start with /. Only characters such as letters, digits, ‘-’, ‘/’, ‘.’, ‘%’, ‘?’, #’ and ‘&’ are allowed. | string | no | /test |
| rule_health_check_connect_port | Port used for health check. Valid value range: [1-65535]. Default to `None` means the backend server port is used. | int | no | 80 |
| health_check_timeout | Maximum timeout of each health check response. It is required when `health_check` is on. Valid value range: [1-300] in seconds. Default to 5. Note: If `health_check_timeout` < `health_check_interval`, its will be replaced by `health_check_interval`. | int | no | 30 |
| healthy_threshold | Threshold determining the result of the health check is success. It is required when `health_check` is on. Valid value range: [1-10] in seconds. Default to 3. | int | no | 3 |
| unhealthy_threshold | Threshold determining the result of the health check is fail. It is required when `health_check` is on. Valid value range: [1-10] in seconds. Default to 3. | int | no | 3 |
| sticky_session | Whether to enable session persistence, Valid values are `on` and `off`. Default to `off`. This parameter is required and takes effect only when ListenerSync is set to `off`. | string | no | on |
| sticky_session_type | Mode for handling the cookie. If sticky_session is `on`, it is mandatory. Otherwise, it will be ignored. Valid values are insert and server. insert means it is inserted from Server Load Balancer; server means the Server Load Balancer learns from the backend server. | string | no | server |
| listener_sync | Indicates whether a forwarding rule inherits the settings of a health check , session persistence, and scheduling algorithm from a listener. Default to on. | string | no | off |
| scheduler | Scheduling algorithm, Valid values are `wrr`, `rr` and `wlc`. Default to `wrr`. This parameter is required and takes effect only when ListenerSync is set to `off`. | string | no | rr |
| health_check_domain | Domain name used for health check. When it used to launch TCP listener, health_check_type must be `http`. Its length is limited to 1-80 and only characters such as letters, digits, ‘-‘ and ‘.’ are allowed. When it is not set or empty, Server Load Balancer uses the private network IP address of each backend server as Domain used for health check. | string | no | test |
| health_check | Whether to enable health check. Valid values are `on` and `off`. TCP and UDP listener's HealthCheck is always on, so it will be ignore when launching TCP or UDP listener. This parameter is required and takes effect only when ListenerSync is set to off. | string | no | on |

## Outputs

| Name | Description |
|------|-------------|
| this_load_balancer_id | The SLB instance ID |
| this_rule_id | The rule ID |
| this_name | The rule name |

Authors
-------
Created and maintained by He Guimin(@xiaozhu36, heguimin36@163.com)

Reference
---------

* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
