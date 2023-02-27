gitium-base
===========

Kickstart WordPress projects with a sane development environment!

## Requirements

To start a project you need to download and install
[Docker](https://docs.docker.com/get-docker/) and obviously, [Git](https://git-scm.com/downloads).

## Clone and go

With Docker installed and started run these commands from your terminal window

    git clone -o gitium git@github.com:PressLabs/gitium-base AWESOME_SITE

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
* copy it to the Docker DB container:

    `docker cp database.sql gitium-base-db-1:/database.sql`

* connect to the MySQL terminal either from Docker Desktop, or by running:

    `docker exec -it gitium-base-db-1 mysql -u wordpress -pnot-so-secure wordpress`

* import the database:

    `source database.sql;`

* disconnect from the MySQL terminal with `CTRL+D`

* connect to the wordpress-1 container:

    `docker exec -u www-data -it gitium-base-wordpress-1 /bin/bash`

* purge the cache from WP-CLI:

    `wp cache flush`

done!

#### Point your browser to [http://localhost:8080/wp/wp-admin/](http://localhost:8080/wp/wp-admin/) and login to the local development.
