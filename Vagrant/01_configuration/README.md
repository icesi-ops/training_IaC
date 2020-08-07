# Vagrant

### Boxes

With Vagrant you can install whatever SO, software o Architecture that you find in Vagrant Cloud.

Util commands for Boxes:

| Command | Description |
| ------- | ----------- |
| vagrant box add <boxid> | Add a new Box for your use |
| vagrant box list | list all the boxes that you have downloaded |
| vagrant box remove | remove a box |

Using a box in Vagrant
```rb
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
end 
```

Deploy vm  
```bash 
vagrant up 
```

Connect through SHH to VM  
```bash 
vagrant ssh 
```

Sync folder  
```rb
config.vm.synced_folder "src/", "/srv/website" 
```

Networking: Vagrant provides 3 ways for you are able to connect your guest machine to the network. 
- Forwarded Ports  
- Private Network  
- Public Network  

Could you explain us the meaning of each one?  

```rb
config.vm.network "forwarded_port", guest: 80, host: 8080
``` 
```rb
config.vm.network "private_network", ip: "192.168.50.4"
```  
```rb
config.vm.network "public_network" 
```  

Add provider  
``` rb
server.vm.provider "virtualbox" do |vb| 
```

Customize VM provider  
``` rb
vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "centos_srv"]  
   end
```

Provisioning the VM
```bash
vagrant up
```

Cool?   

### References
https://www.vagrantup.com/intro/getting-started
 
