gitium-base
===========

Kickstart WordPress projects with a sane development environment!

## Clone and go!

    git clone -o gitium git@github.com:PressLabs/gitium-base AWESOME_SITE
    cd AWESOME_SITE
    git submodule update --init
    vagrant up

Point your browser at [http://AWESOME_SITE.local](http://AWESOME_SITE.local).

## Connect to your remote git

    cd AWESOME_SITE
    git remote add origin git@github.com:GITHUB_USERNAME/AWESOME_SITE
    git branch master --set-upstream-to origin/master
    git push origin master

## Requirements

To start a project you need to download and install
[vagrant](http://www.vagrantup.com/downloads.html) and
[virtualbox](https://www.virtualbox.org/wiki/Downloads).

On Ubuntu or Debian after download issue:

    dpkg -i vagrant*.deb
    dpkg -i virtualbox*.deb

## Notes

 * Vagrant must be installed / downloaded from the vagrantup.com site
 * Check your virtualization settings from your PC BIOS
