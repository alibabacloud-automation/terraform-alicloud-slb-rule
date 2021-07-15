variable "name" {
  description = "The name of a new load balancer."
  type        = string
  default     = "slb-rule-basic-config"
}

variable "spec" {
  description = "The specification of the SLB instance."
  type        = string
  default     = "slb.s1.small"
}

variable "internal" {
  description = "It has been deprecated from 1.6.0 and 'address_type' instead. If true, SLB instance will be an internal SLB."
  type        = bool
  default     = false
}

variable "address_type" {
  description = "The type of address. Choices are 'intranet' and 'internet'. Default to 'internet'."
  type        = string
  default     = "internet"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "cidr_block" {
  description = "The CIDR block for the VPC. The cidr_block is Optional and default value is `172.16.0.0/12` after `v1.119.0+`."
  type        = string
  default     = "172.16.0.0/16"
}

variable "images_name_regex" {
  description = "A regex string to filter resulting images by name."
  type        = string
  default     = "^ubuntu_18.*64"
}

variable "images_most_recent" {
  description = "If more than one result are returned, select the most recent one."
  type        = bool
  default     = true
}

variable "images_owners" {
  description = "Filter results by a specific image owner. Valid items are `system`, `self`, `others`, `marketplace`."
  type        = string
  default     = "system"
}

variable "cpu_core_count" {
  description = "Number of CPU cores."
  default     = 1
}

variable "memory_size" {
  description = "Size of memory, measured in GB."
  default     = 2
}

variable "available_disk_category" {
  description = "Filter the results by a specific disk category. Can be either `cloud`, `cloud_efficiency`, `cloud_ssd`, `ephemeral_ssd`."
  type        = string
  default     = "cloud_efficiency"
}

variable "available_resource_creation" {
  description = "Type of resources that can be created."
  type        = string
  default     = "VSwitch"
}

variable "internet_charge_type" {
  description = "Internet charge type of the instance, Valid values are `PayByBandwidth`, `PayByTraffic`. Default is `PayByTraffic`."
  type        = string
  default     = "PayByTraffic"
}

variable "internet_max_bandwidth_out" {
  description = "Maximum outgoing bandwidth to the public network, measured in Mbps (Mega bit per second). Value range: [0, 100]. Default to 0 Mbps."
  type        = string
  default     = "10"
}

variable "instance_charge_type" {
  description = "Valid values are `PrePaid`, `PostPaid`, The default is `PostPaid`."
  type        = string
  default     = "PostPaid"
}

variable "system_disk_category" {
  description = "Valid values are `ephemeral_ssd`, `cloud_efficiency`, `cloud_ssd`, `cloud_essd`, `cloud`. `cloud` only is used to some none I/O optimized instance. Default to `cloud_efficiency`."
  type        = string
  default     = "cloud_efficiency"
}

variable "backend_port" {
  description = "Port used by the Server Load Balancer instance backend. Valid value range: [1-65535]."
  default     = 22
}

variable "frontend_port" {
  description = "Port used by the Server Load Balancer instance frontend."
  default     = 22
}

variable "protocol" {
  description = "The protocol to listen on."
  type        = string
  default     = "http"
}

variable "bandwidth" {
  description = "Bandwidth peak of Listener."
  default     = 5
}

variable "health_check_connect_port" {
  description = "Port used for health check. Valid value range: [1-65535]. Default to `None` means the backend server port is used."
  type        = string
  default     = "20"
}

variable "slb_server_group_port" {
  description = "The port used by the backend server. Valid value range: [1-65535]."
  default     = 80
}

variable "slb_server_group_weight" {
  description = "Weight of the backend server. Valid value range: [0-100]. Default to 100."
  default     = 100
}

variable "domain" {
  description = "Domain name of the forwarding rule. It can contain letters a-z, numbers 0-9, hyphens (-), and periods (.), and wildcard characters."
  type        = string
  default     = "*.aliyun.com"
}

variable "url" {
  description = "Domain of the forwarding rule. It must be 2-80 characters in length. Only letters a-z, numbers 0-9, and characters '-' '/' '?' '%' '#' and '&' are allowed. URLs must be started with the character '/', but cannot be '/' alone."
  type        = string
  default     = ""
}

variable "cookie" {
  description = "The cookie configured on the server. It is mandatory when `sticky_session` is `on` and `sticky_session_type` is `server`. Otherwise, it will be ignored. Valid value：String in line with RFC 2965, with length being 1- 200. It only contains characters such as ASCII codes, English letters and digits instead of the comma, semicolon or spacing, and it cannot start with $."
  type        = string
  default     = "cookie_test"
}

variable "cookie_timeout" {
  description = "Cookie timeout. It is mandatory when sticky_session is `on` and sticky_session_type is `insert`. Otherwise, it will be ignored. Valid value range: [1-86400] in seconds."
  default     = 100
}

variable "health_check_http_code" {
  description = "Regular health check HTTP status code. Multiple codes are segmented by “,”. It is required when health_check is on. Default to `http_2xx`. Valid values are: `http_2xx`, `http_3xx`, `http_4xx` and `http_5xx`."
  type        = string
  default     = "http_2xx"
}

variable "health_check_interval" {
  description = "Time interval of health checks. It is required when `health_check` is on. Valid value range: [1-50] in seconds. Default to 2."
  default     = 2
}

variable "health_check_uri" {
  description = "URI used for health check. When it used to launch TCP listener, health_check_type must be `http`. Its length is limited to 1-80 and it must start with /. Only characters such as letters, digits, ‘-’, ‘/’, ‘.’, ‘%’, ‘?’, #’ and ‘&’ are allowed."
  type        = string
  default     = "/test"
}

variable "rule_health_check_connect_port" {
  description = "Port used for health check. Valid value range: [1-65535]. Default to `None` means the backend server port is used."
  default     = 80
}

variable "health_check_timeout" {
  description = "Maximum timeout of each health check response. It is required when `health_check` is on. Valid value range: [1-300] in seconds. Default to 5. Note: If `health_check_timeout` < `health_check_interval`, its will be replaced by `health_check_interval`."
  default     = 30
}

variable "healthy_threshold" {
  description = "Threshold determining the result of the health check is success. It is required when `health_check` is on. Valid value range: [1-10] in seconds. Default to 3."
  default     = 3
}

variable "unhealthy_threshold" {
  description = "Threshold determining the result of the health check is fail. It is required when `health_check` is on. Valid value range: [1-10] in seconds. Default to 3."
  default     = 3
}

variable "sticky_session" {
  description = "Whether to enable session persistence, Valid values are `on` and `off`. Default to `off`. This parameter is required and takes effect only when ListenerSync is set to `off`."
  type        = string
  default     = "on"
}

variable "sticky_session_type" {
  description = "Mode for handling the cookie. If sticky_session is `on`, it is mandatory. Otherwise, it will be ignored. Valid values are insert and server. insert means it is inserted from Server Load Balancer; server means the Server Load Balancer learns from the backend server."
  type        = string
  default     = "server"
}

variable "listener_sync" {
  description = "Indicates whether a forwarding rule inherits the settings of a health check , session persistence, and scheduling algorithm from a listener. Default to on."
  type        = string
  default     = "off"
}

variable "scheduler" {
  description = "Scheduling algorithm, Valid values are `wrr`, `rr` and `wlc`. Default to `wrr`. This parameter is required and takes effect only when ListenerSync is set to `off`."
  type        = string
  default     = "rr"
}

variable "health_check_domain" {
  description = "Domain name used for health check. When it used to launch TCP listener, health_check_type must be `http`. Its length is limited to 1-80 and only characters such as letters, digits, ‘-‘ and ‘.’ are allowed. When it is not set or empty, Server Load Balancer uses the private network IP address of each backend server as Domain used for health check."
  type        = string
  default     = "test"
}

variable "health_check" {
  description = "Whether to enable health check. Valid values are `on` and `off`. TCP and UDP listener's HealthCheck is always on, so it will be ignore when launching TCP or UDP listener. This parameter is required and takes effect only when ListenerSync is set to off."
  type        = string
  default     = "on"
}
