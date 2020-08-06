# VAGRANT  

> Vagrant is a tool for building and managing virtual machine environments in a single workflow. With an easy-to-use workflow and focus on automation, Vagrant lowers development environment setup time, i> ncreases production parity, and makes the "works on my machine" excuse a relic of the past.

## Why Vagrant?
> Vagrant provides easy to configure, reproducible, and portable work environments built on top of industry-standard technology and controlled by a single consistent workflow to help maximize the productivity and flexibility of you and your team.

## Install

Please refer to: https://www.vagrantup.com/intro/getting-started/install  
Rember install VirtualBox before.

## Verifying the Installation

1. Execute 
```vagrant --version``` 

2. Clone the repo https://github.com/icesi-ops/training_IaC  
```git clone https://github.com/icesi-ops/training_IaC```  

3. Go to directory Vagrant/00_init into repo folder  
```cd Vagrant/00_init```  

4. Get familiar with Vagrantfile

5. Run VM
```vagrant up```

6. Try to connect with VM
```vagran ssh``

| Command | Description   |
|---|---|
| vagrant up | Run provision of the virtual machine |
| vagrant up --no-provision | Create the virtual machine without provisioning |
| vagrant provision | Provision the virtual machine on the fly |
| vagrant destroy | Destroy virtual machine |
| vagrant package --output box_name | Package a deployed virtual machine in a vagrant box |

### References
https://www.vagrantup.com/intro/index

