PRIMARY_HOST        = "local.mydomainname.be"
PROJECT_NAME        = "Test Project"
MEMORY              = 6096
CPUS                = 4
IP                  = "192.168.11.22"
PHP_VERSION         = "7.4"
PHPMYADMIN_VERSION  = "5.0.2"
MYSQL_VERSION       = "5.7"
DB_USERNAME         = "user"
DB_PASSWORD         = "password"
DB_NAME             = "db"
DB_NAME_TEST        = "db_test"
COMPOSER_VERSION    = "2.0.4"

# Never empty these variables, but replace them if you need additional hostnames
EXTRA_HOST_1        = "local.domainname1.be"
EXTRA_HOST_2        = "local.domainname2.be"
EXTRA_HOST_3        = "local.domainname3.be"
EXTRA_HOST_4        = "local.domainname4.be"

Vagrant.configure("2") do |config|
    config.vm.box = "hashicorp/bionic64"

    config.ssh.forward_agent = true

    config.vm.provider "virtualbox" do |v|
        v.name = PROJECT_NAME
        v.memory = MEMORY
        v.cpus = CPUS
    end

    config.vm.network "private_network", ip: IP

    config.vm.synced_folder ".", "/var/www", nfs: true, mount_options:['nolock,vers=3,udp,noatime,actimeo=2']

    config.vm.provision :shell, path: "provision/components/ssl.sh", :args => [PRIMARY_HOST, EXTRA_HOST_1, EXTRA_HOST_2, EXTRA_HOST_3, EXTRA_HOST_4]
    config.vm.provision :shell, path: "provision/components/apache.sh"
    config.vm.provision :shell, path: "provision/components/php.sh", :args => [PHP_VERSION]
    config.vm.provision :shell, path: "provision/components/mysql.sh", :args => [MYSQL_VERSION, DB_USERNAME, DB_PASSWORD, DB_NAME, DB_NAME_TEST]
    config.vm.provision :shell, path: "provision/components/phpmyadmin.sh", :args => [PHPMYADMIN_VERSION, DB_PASSWORD]
    config.vm.provision :shell, path: "provision/components/composer.sh", :args => [COMPOSER_VERSION]
    config.vm.provision :shell, path: "provision/components/profile.sh"
end