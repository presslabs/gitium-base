# -*- mode: ruby -*-
# vi: set ft=ruby :

HOSTNAME = File.basename(File.dirname(__FILE__), ".git")

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "minimal/xenial64"

  # Create a private network, which allows host-only access to the machine
  config.vm.network "private_network", type: "dhcp"

  config.vm.hostname = HOSTNAME

  config.vm.provision "shell", path: "provision/vagrant.sh"
end

