## Multiple Machines

> Vagrant is able to define and control multiple guest machines per Vagrantfile. This is known as a "multi-machine" environment.

```rb
Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "echo Hello"

  config.vm.define "web" do |web|
    web.vm.box = "centos/7"
  end

  config.vm.define "db" do |db|
    db.vm.box = "centos/7"
  end
end
```

Load Order

```rb
Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "echo a"

  config.vm.define "web" do |web|
   web.vm.box = "centos/7"
   web.vm.provision "shell", inline: "echo b"
  end

  config.vm.define "db" do |db|
   db.vm.box = "centos/7"
   db.vm.provision "shell", inline: "echo c"
  end

  config.vm.provision "shell"m inline: "echo d"
end
```

Loops

```rb
(1..3).each do |i|
  config.vm.define "node-#{i}" do |node|
    node.vm.provision "shell",
      inline: "echo hello from node #{i}"
  end
end
```

Play a little

```rb
(1..2).each do |i|
   config.vm.define "web-#{i}" do |web|
     web.vm.box = "centos/7"
     web.vm.network "private_network", ip: "192.168.33.1#{i}"
     web.vm.hostname = "web-#{i}"
     web.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "web-#{i}"]
     end
     web.vm.provision "shell", inline: "echo hello from $HOSTNAME"
   end
  end
```

Activities for workshop

- Can you make that assignament of IP will be Dynamic?
- Use config.vm.provision "file" to transfer a file from your host machine to your guest(vm) machine
This file is a bash script that print HOSTNAME + IP + Timestamp server.
- Use config.vm.provision "shell" to execute the file that you transfered 



