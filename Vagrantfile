# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.provision :shell, :path => "puppet-install.sh"

  config.vm.provision :puppet, :module_path => "modules" do |puppet|
    puppet.manifest_file = "site.pp"
    puppet.options = ["--verbose --hiera_config /vagrant/manifests/hiera_vagrant.yml"]
  end


  config.vm.define :devrigg01 do |config|

    box_name = 'devrigg01'
    host_name = "local.#{box_name}.com"

    config.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id,
                   "--name", box_name,
                   "--memory", "1024"]
    end

    config.vm.box = "precise64"
    config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"

    config.vm.hostname = host_name
    config.vm.network :private_network, ip: "33.33.33.27"

  end

end
