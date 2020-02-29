# DATA 

A data source represents a piece of read-only information that is fetched from the provider (in this case, AWS) every time you run Terraform.  

Syntax:  
```tf
data "<PROVIDER>_<TYPE>" "<NAME>" {
  [CONFIG ...]
}
```
To get the data out of a data source, you use the following attribute reference syntax:
```
data.<PROVIDER>_<TYPE>.<NAME>.<ATTRIBUTE>
```

Also, we can combine with another data source.
```
data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}
```

## Deploying a Load Balancer

![alt text](https://learning.oreilly.com/library/view/terraform-up/9781492046899/assets/tur2_0210.png "elb")

There are 3 types of ELB.

- Application Load Balancer
- Network Load Balancer
- Classic Load Balancer

### Listener
Listens on a specific port (e.g., 80) and protocol (e.g., HTTP).

### Listener Rule
Takes requests that come into a listener and sends those that match specific paths (e.g., /foo and /bar) or hostnames (e.g., foo.example.com and bar.example.com) to specific target groups.

### Target Groups
One or more servers that receive requests from the load balancer. The target group also performs health checks on these servers and only sends requests to healthy nodes.

![alt text](https://learning.oreilly.com/library/view/terraform-up/9781492046899/assets/tur2_0211.png "map")

