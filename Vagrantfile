# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|

  config.vm.define "microk8s" do |node|
    #node.vm.box = "k8s"
    node.vm.box = "ubuntu/bionic64"
    node.vm.hostname = "microk8s.example.com"
    node.vm.network "private_network", ip: "172.42.42.101"
    node.vm.provider "virtualbox" do |v|
      v.name = "microk8s"
      v.memory = 2048
      v.cpus = 1
    end
    node.vm.provision "shell", path: "bootstrap.sh"
  end
end
