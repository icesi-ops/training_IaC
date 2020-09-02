# Ansible
![alt text](https://i.ibb.co/dgmxdVn/img.png "Diagram")

### We make some changes to ours Vagrantfile

- Add a new VM that refer to ours LB
```rb
config.vm.define "lb" do |lb|
    lb.vm.box = "centos/7"
    lb.vm.hostname = "lb"
    lb.vm.network "private_network", ip: "192.168.33.200"
    lb.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "lb"]
    end
    lb.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbooks/haproxy/loadbalancer.yml"
      ansible.extra_vars = {
         "web_servers" => [
          {"name": "web-1","ip":"192.168.33.11"},
          {"name": "web-2","ip":"192.168.33.12"}
         ] 
    	}
    
    end  
  end
```

- Changes provisioner to ours web servers VM
```rb
web.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbooks/httpd/webserver.yml"
      ansible.groups = {
        "webservers" => ["web-#{i}"]
      }
```

- New dirs and playbooks

Go to playbooks dir ```  cd playbooks ```  
  
Make directory haproxy ```  mkdir haproxy  ```  

Make playbook file ```  vim loadbalancer.yml ```  
  
We make the playbook that install and configure a loadbalancer.  
```yml
---
- hosts: lb
  become: true
  tasks:
   - name: "install haproxy"
     yum:
       name:
        - haproxy
   - name: "configure haproxy"
     template:
       src: templates/haproxy.j2
       dest: /etc/haproxy/haproxy.cfg
       owner: root
       group: wheel
       mode: '0644'
   - name: "Restar and enabled haproxy"
     service:
      name: haproxy
      state: restarted
      enabled: yes
```  

Now we create dir templates ```  mkdir templates  ```  

into it we going to download ```  wget https://raw.githubusercontent.com/icesi-ops/training_IaC/master/Ansible/04_load_balancer/templates/haproxy.j2  ```

If you want can run until this part and test that loadbalancer has been created and configured.

- Playbook for ours Webserver VMs  
  
into playbooks dir we create new dir ```  mkdir httpd  ```
  
Make playbook file ```  vim webserver.yml  ```

We make the playbook that install and configure ours webservers
```yml
---
- hosts: webservers
  become: true
  tasks:
   - name: "Install httpd"
     yum:
       name: httpd
   - name: "know hostname"
     shell: "echo $HOSTNAME"
     register: print_hostname
   - name: "Configure httpd"
     template:
       src: templates/index.j2
       dest: /var/www/html/index.html
       owner: root
       group: wheel
       mode: '0644'
   - name: "start httpd"
     service:
      name: httpd
      state: restarted
      enabled: yes
```

Now we create dir templates into playbooks/httpd ```  mkdir templates  ```

Download the template ```   wget https://raw.githubusercontent.com/icesi-ops/training_IaC/master/Ansible/04_load_balancer/templates/index.j2 ```


We already have each component of ours SD configured through IaC, remember  
Provisioning: Vagrant  
COnfiguration management: Ansible  
  

- Run Vagrantfile ```  vagrant up  ```

Now we go to explorer and type the loadbalancer ip.

Great !! is it awesome ?



