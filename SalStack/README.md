# SaltStack

![alt file](https://www.wecandonow.com/courses/saltstack/about.png "SaltStack")

>  is an automation suite which offers Configuration Management plus standard and/or event-driven orchestration. It is commonly used un a master-minion setup, where a master node provides centralized control across a compute estate.   

## Advantages

- Reusabilidad   
![alt file](https://i.ibb.co/XkxJgFh/img1.png "SaltStack")  

- Different Modes (Masterless -  Master Minion)  

## Concepts  

- **States** are the files which describe the desired state of a machine. Here we write instructions for installing packages, modifying files, updating permissions, and so on.
- **Pillars** are the files in which we define variables to help make States more portable and
flexible.
- **Grains** are pieces of information gathered on the minion host itself. These include details about the OS, environment, the hardware platform, and others.
- The Salt File Server stores any files, scripts, or other artifacts which may be referenced in the States.
- The Salt **Top file(s)** are used to map States and/or Pillars to minions

## Task
Here is our task-list:
1. Prepare our SaltStack development environment.
2. Write the configuration that we would like SaltStack to apply to our node(s).
3. Compose the Terraform template describing our infrastructure.
4. Deploy the infrastructure via Terraform and let SaltStack configure it
