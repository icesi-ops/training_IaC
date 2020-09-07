# Distributed File System (With Glusterfs)

![alt text](https://docs.gluster.org/en/v3/images/640px-GlusterFS_Architecture.png "gluster")  
> Gluster is a scalable, distributed file system that aggregates disk storage resources from multiple servers into a single global namespace.

## Volumes  

- Distributed Glusterfs Volume  
![img](https://cloud.githubusercontent.com/assets/10970993/7412364/ac0a300c-ef5f-11e4-8599-e7d06de1165c.png)

- Replicated Glusterfs Voume  
![img2](https://cloud.githubusercontent.com/assets/10970993/7412379/d75272a6-ef5f-11e4-869a-c355e8505747.png)

- Striped Glusterfs Volume  
![img3](https://cloud.githubusercontent.com/assets/10970993/7412379/d75272a6-ef5f-11e4-869a-c355e8505747.png)

### Glusterfs (Inicialización)

Into master node
```
$ sudo gluster peer probe node-1
$ sudo gluster peer probe node-2
$ gluster pool list
$ sudo gluster volume create gv0 replica 3 master:/gluster/data/gv0 node-1:/gluster/data/gv0 node-2:/gluster/data/gv0
$ sudo gluster volume set gv0 auth.allow 127.0.0.1
$ sudo gluster volume start gv0
```

Each node
```
$ sudo mount.glusterfs localhost:/gv0 /mnt
```

Para añadir un nuevo servidor

| Command  | Description  |
|---|---|
| gluster peer status | Consulte el estado del cluster |
| gluster peer probe node4 | Adicione el nuevo nodo |
| gluster volume status | Anote el nombre del volumen |
| gluster volume add-brick swarm-vols replica 5 node4:/gluster/data/swarm-vols | TODO: Verificar este comando |

Para remover un nodo del cluster se requiere primero remover sus bricks de los volumenes asociados

| Command  | Description  |
|---|---|
| gluster volume info | Consulte los identificadores de los bricks actuales |
| gluster volume remove-brick swarm-vols replica 1 node1:/gluster/data force | Remueve un brick de un volumen con dos replicas |
| gluster peer detach node1 | Remueve un nodo del cluster |

Eliminar un volumen

| Command  | Description  |
|---|---|
| gluster volume stop swarm-vols | Detenga el volumen |
| gluster volume delete swarm-vols | Elimine el volumen |


### References
* https://docs.gluster.org/en/v3/Administrator%20Guide/Managing%20Volumes/
* https://support.rackspace.com/how-to/recover-from-a-failed-server-in-a-glusterfs-array/
* https://support.rackspace.com/how-to/add-and-remove-glusterfs-servers/
* http://embaby.com/blog/using-glusterfs-docker-swarm-cluster/
* https://docs.gluster.org/en/latest/Quick-Start-Guide/Quickstart/
* http://ask.xmodulo.com/create-mount-xfs-file-system-linux.html
* https://www.cyberciti.biz/faq/linux-how-to-delete-a-partition-with-fdisk-command/
* https://support.rackspace.com/how-to/getting-started-with-glusterfs-considerations-and-installation/
* https://everythingshouldbevirtual.com/virtualization/vagrant-adding-a-second-hard-drive/
* https://www.jamescoyle.net/how-to/351-share-glusterfs-volume-to-a-single-ip-address

