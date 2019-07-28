# microk8s-provisioning
Resize disk

cd ~/.vagrant.d/boxes/ubuntu-VAGRANTSLASH-bionic64/20190708.0.0/virtualbox/
VBoxManage clonehd ubuntu-bionic-18.04-cloudimg.vmdk tmp-disk.vdi --format vdi
VBoxManage modifyhd tmp-disk.vdi --resize 61440
VBoxManage clonehd tmp-disk.vdi resized-disk.vmdk --format vmdk
rm tmp-disk.vdi ubuntu-bionic-18.04-cloudimg.vmdk
mv resized-disk.vmdk  ubuntu-bionic-18.04-cloudimg.vmdk
                         
