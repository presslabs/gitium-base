gitium-base
===========

Kickstart WordPress projects with a sane development environment!

## Requirements

To start a project you need to download and install
[Docker](https://docs.docker.com/get-docker/) and obviously, [Git](https://git-scm.com/downloads).

## Clone and go

With Docker installed and started run these commands from your terminal window

    git clone -o gitium git@github.com:presslabs/gitium-base AWESOME_SITE

## Connect to your remote git

    cd AWESOME_SITE
    git remote add origin git@github.com:GITHUB_USERNAME/AWESOME_SITE
    git branch main --set-upstream-to origin/main
    git push origin main

## Start the local environment

### Linux and Windows (with WSL):

    USER_ID="$(id -u)" GROUP_ID="$(id -g)" docker compose up
    
### MacOS

    docker compose up

### DB import

* obtain a database dump from your hosting provider
* download it locally and unpack it
* import the database into local MySQL:

    cat database.sql | docker compose exec -T db mysql -u wordpress -pnot-so-secure wordpress

* connect to the `wordpress` container:

    docker compose exec wordpress bash

* purge the cache from WP-CLI:

    wp cache flush

done!

#### Point your browser to [http://localhost:8080/wp-admin/](http://localhost:8080/wp-admin/) and login to the local development.


### Runtime extensions

We provide some extension to the default configuration that let's you change the running mode.

#### Enable SSL

 1. Generate a key and a certificate and place it in the project's root named as `certificate.key` and `certificate.crt`.

 2. Run docker compose with ssl overwrite config liek:

    docker compose -f docker-compose.yaml -f .dev/docker-compose.ssl.yaml up


#### Run as root

    docker compose -f docker-compose.yaml -f .dev/docker-compose.run-as-root.yaml up
