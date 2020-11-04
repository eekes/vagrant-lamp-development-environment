# LAMP development environment for Vagrant

My default bootstrap for new LAMP projects. Contains:

- PHP 7.4
- MySQL 5.7
- PHPMyAdmin 5.0.2
- Composer 2.0.4

But all versions are configurable in the ```Vagrantfile```.

Simply run:

```
vagrant up
```

And add the hostnames to your local hosts file (on Mac: ```/etc/hosts```):

```
192.168.22.33 mydomainname.be www.mydomainname.be backend.mydomainname.be
```

## SSL

When running ```vagrant up```, a wildcard SSL certificate is automatically created based on the hostnames you 
configured in the ```Vagrantfile```. To make them work locally (on Mac):

- Open Keychain Access
- Click on the “System” keychain in the left column
- Drag the .cert file in provision/config/ssl into the certificates list
- Double click on the certificate, and under "Trust", set to "Always Trust"

## Installing Grump

This repo also contains PHPCS and GrumPHP configs, run this to and GrumPHP will do the rest**: 

```
composer require --dev friendsofphp/php-cs-fixer phpro/grumphp phpstan/phpstan
```