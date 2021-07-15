module "rule" {
  source              = "../"
  name                = "slb-rule-basic-config"
  domain              = "*.test.com"
  cookie              = "cookie-test"
  health_check_uri    = "/test"
  health_check_domain = "test"
}
