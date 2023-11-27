resource "aws_lb" "lb" {
    internal = false
    load_balancer_type = "application"
    enable_deletion_protection = false
    enable_http2          = true
    enable_cross_zone_load_balancing = true
    subnets = [ "subnet-033e66d2b9e7ef2ae", "subnet-017b9c5a6e71a7b3b" ]
}
