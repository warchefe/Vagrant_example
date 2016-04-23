
Vagrant.configure(2) do |conf|

conf.vm.box = "TEST"
conf.vm.box ="http://files.vagrantup.com/precise32.box"
conf.vm.synced_folder "./", "/var/www", create: true
conf.vm.network "private_network", ip: "192.168.10.10"
conf.vm.provision "shell", :path =>'s.sh'

end
