# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"

  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.name = "base-box-ubuntu"
    vb.memory = "4096"
    vb.cpus = "8"
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-add-repository --yes --update ppa:ansible/ansible
    apt-get install -y ansible

    ansible-playbook /vagrant/playbooks/copy-resources.yml
    ansible-playbook /vagrant/playbooks/install-tools.yml
    ansible-playbook /vagrant/playbooks/install-docker.yml
  SHELL
end
