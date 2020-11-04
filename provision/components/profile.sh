#!/bin/bash

grep -qxF 'cd /var/www' /home/vagrant/.profile || echo 'cd /var/www' >> /home/vagrant/.profile
