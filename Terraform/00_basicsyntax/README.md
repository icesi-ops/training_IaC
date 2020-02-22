# BASIC SYNTAX

The first step to using Terraform is typically to configure the provider(s) you want to use. Create an empty folder and put a file in it called main.tf that contains the following contents:

```tf
provider "docker" {
}
```
For each type of provider, there are many different kinds of resources that you can create, such as servers, databases,and load balancers. The general syntax for creating aresource in Terraform is:

```tf
resource "<PROVIDER>_<TYPE>" "<NAME>" {  
[CONFIG ...]  
}
```

In a terminal, go into the folder where you created main.tf and run:
```tf 
terraform init
terraform plan
terraform apply
terraform graph
```





