module "aws_instance" {
    source = "../../../modules/VirtualMachine"
    ami = "ami-0fa1ca9559f1892ec"
}

module "load_balancer" {
    source = "../../../modules/LoadBalancer"
}

resource "aws_lb_target_group" "targetgroup" {
    name = "my-target-group"
    port = 80
    protocol = "HTTP"
    target_type = "instance"
    vpc_id = "vpc-09e676d910cf8278f"
}

resource "aws_lb_target_group_attachment" "attach" {
    target_group_arn = aws_lb_target_group.targetgroup.arn
    target_id =  module.aws_instance.instance_id
}