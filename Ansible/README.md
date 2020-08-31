# Configuration Management with Ansible

![alt text](https://i.ibb.co/Wvc4VJs/ansible.png "Logo Title Text 1")


> Ansible is a radically simple IT automation engine that automates cloud provisioning, configuration management, application deployment, intra-service orchestration, and many other IT needs.

## Pre-requisites
- Install Ansible -> Refer to [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- Python 2.7 or 3.6
- Vagrant

## Ansible

![alt text](https://i.ibb.co/f42gRY8/ansible2.png "Logo Title Text 1")

1. Make ansible.cfg
```
[defaults]
inventory=./ansible_hosts
remote_user=vagrant
private_key_file=$HOME/.vagrant.d/insecure_private_key
```
2. Make ansible_hosts
```
[servers]
192.168.33.11
192.168.33.12
```

3. Run Vagrantfile
```
vagrant up
```
4. We does test that everything machine is reachable
```
ansible -m ping all
```
5. Now lets play

```
ansible all -a "whoami"
ansible all -a "uname -a"
ansible all -a "pwd"
```
6. Groups: add to ansible_host the db server
```
db ansible_ssh_host=192.168.33.100
```

Now we can target to specific group 
```
ansible dbservers -a "whoami"
```

Also, we can create groups that contains other groups
```
[first]
servers
dbservers
```

```
ansible --list-host all
```


### Playbooks

Make a dir playbooks and go to it
```
mkdir playbooks
cd playbooks
```

Make new file 01-ping.yml
```
---
- hosts: all
  tasks:
    - name: Ping All Servers
      action: ping
    - debug: msg="Hello"
- hosts: servers
  tasks:
    - debug: msg="Hello Servers"
```

Look 02-shell.yml and run
Look 03-variables.yml and run
Look 05-install-httpd.yml and run


