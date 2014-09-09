Vagrant.configure("2") do |config|
  ## Choose your base box
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.ssh.forward_agent = true

  ## For masterless, mount your file roots file root
  config.vm.synced_folder "salt/roots/", "/srv/"
  config.vm.host_name = 'salt-talk'

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024

  end

  ## Set your salt configs here
  config.vm.provision :salt do |salt|

    ## Minion config is set to ``file_client: local`` for masterless
    salt.minion_config = "salt/minion"

    ## Installs our example formula in "salt/roots/salt"
    salt.run_highstate = true

    salt.verbose = true

  end
end
