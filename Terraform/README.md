# Terraform

![alt file](https://learning.oreilly.com/library/view/terraform-up/9781492046899/assets/tur2_0106.png "Terraform")

> Terraform is an open source tool created byHashiCorp and written in the Go programming language. The Go code compiles down into a single binary (or rather, onebinary for each of the supported operating systems) called, not surprisingly, terraform.


## Procedural Language Versus Declarative Language  

Chef and Ansible --> Procedural, You code with the final desired state in mind  
Terraform, Salstack, Cloudformation, Puppet --> Declarative, You code the final desired state.

Example:

Ansible
```yaml
- ec2:
    count: 10
    image: ami-0c55b159cbfafe1f0
    instance_type: t2.micro
```

Terraform
```tf
resource "aws_instance" "example" {
  count         = 10
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
```
![alt file](https://learning.oreilly.com/library/view/terraform-up/9781492046899/assets/tur2_0111.png "Terraform")

## SUMMARY
![alt file](https://i.ibb.co/sQMHbXJ/COMPARATIVE.png "Terraform")

## Install

Go to a directory where you want save and install terraform
```
wget https://releases.hashicorp.com/terraform/0.12.21/terraform_0.12.21_linux_amd64.zip
```
Unzip binary
```
unzip terraform_0.12.21_linux_amd64.zip
```
Configure PATH
```
nano ~/.profile

Add the next line  
export PATH="$PATH:<Path to terraform binary>"
```
Refresh session
```
source ~/.profile
```
Validar version
```
terraform --version
```


