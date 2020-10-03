output "lb_public_dns"{
    value = aws_lb.aik_lb.dns_name
}