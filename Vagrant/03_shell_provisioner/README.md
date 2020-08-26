## Shell provisioner

> The Vagrant Shell provisioner allows you to upload and execute a script within the guest machine.
```rb
 server.vm.provision "shell", inline: <<-SHELL
      sudo yum install -y httpd
      systemctl start  httpd.service
      systemctl enable httpd.service
    SHELL
```

How can i reach this web server from Host machine?

Inline is one way to execute shell scripting within guest machine, there are ways like:

inline but script through variables
```rb
$script = <<-SCRIPT
echo I am provisioning...
date > /etc/vagrant_provisioned_at
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: $script
end
```

External file
```rb
  config.vm.provision "shell", path: "script.sh"
```

Please, translate the above inline script to bash file and do VMs provision as a external file.  
  
Also, you can pass arguments
```rb
  config.vm.provision "shell" do |s|
    s.inline = "echo $1"
    s.args   = ["hello, world!"]
  end
```


