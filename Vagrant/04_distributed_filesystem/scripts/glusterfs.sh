yum install -y centos-release-gluster
yum install -y glusterfs-server
yum install -y xfsprogs
service glusterd start

sfdisk /dev/sdb << EOF
;
EOF

mkfs.xfs /dev/sdb1
mkdir -p /gluster/data 
# echo "/dev/sdb1 /gluster/data xfs default 1 2" >> /etc/fstab
mount /dev/sdb1 /gluster/data/
#mount -a && mount
