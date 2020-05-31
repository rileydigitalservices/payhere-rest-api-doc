#!/bin/bash
root="/var/www/payhere-api-docs"
cd $root
echo -e '\e[1m\e[34mPulling code from remote..\e[0m\n'
git pull origin master
echo -e '\e[1m\e[34m\nInstalling required packages..\e[0m\n'
# Install required packages
bundle exec install
echo -e '\e[1m\e[34m\nBuilding HTML..\e[0m\n'
# Install required packages
bundle exec middleman build
echo -e '\e[1m\e[34m\API deployed\e[0m\n'
