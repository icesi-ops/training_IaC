variable "aik_ami_id" {
  description = "AMI ID used for apply to instance's AIK"
  default     = "ami-03657b56516ab7912"

}

variable "vpc_cidr" {
  description = "VPC cidr to use for AIK VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name VPC of AIK"
  default     = "aik-vpc"
}

variable "aws_availability_zones" {
  description = "availability zones to uses for AIK"
  default     = "us-east-2a,us-east-2b"
}

variable "aik_instance_type" {
  description = "type of instance for use with instances of FRONT AND BACK"
  default     = "t2.micro"
}

variable "aik_key_name" {
  description = "Key pair name"
  default     = "estudiante10"
}
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = string
  default     = "3030"
}

variable "alb_name" {
  description = "The name of the ALB"
  type        = string
  default     = "alb-aik"
}

variable "instance_security_group_name" {
  description = "The name of the security group for the EC2 Instances"
  type        = string
  default     = "instances-sg"
}

variable "alb_security_group_name" {
  description = "The name of the security group for the ALB"
  type        = string
  default     = "alb-sg"
}
