gitium-base
===========

Kickstart WordPress projects with a sane development environment!

## Requirements

To start a project you need to download and install
[Docker](https://docs.docker.com/get-docker/) and of course [Git](https://git-scm.com/downloads).

## Clone and get started

Once Docker is installed and running, run these commands from your terminal window:

    git clone -o gitium git@github.com:presslabs/gitium-base AWESOME_SITE

## Connect to your remote git repo

    cd AWESOME_SITE
    git remote add origin git@github.com:GITHUB_USERNAME/AWESOME_SITE
    git branch main --set-upstream-to origin/main
    git push origin main

## Start the local environment

    docker compose up

### Linux and Windows (with WSL), if the above command returns errors:

    USER_ID="$(id -u)" GROUP_ID="$(id -g)" docker compose up

### DB import

* Get a database dump from your hosting provider
* Download it locally and unpack it
* Import the database into your local MySQL:

```
cat database.sql | docker compose exec -T db mysql -u wordpress -pnot-so-secure wordpress
```

* Connect to the `wordpress` container:

```
docker compose exec wordpress bash
```

* Clear the cache from WP-CLI:

```
wp cache flush
```

Done!

#### Go to [http://localhost:8080/wp-admin/](http://localhost:8080/wp-admin/) from your browser and log in to the local development environment.


### Runtime extensions

We offer some extensions to the default configuration that allow you to change the running mode.

#### Enable SSL

 1. Generate a key and a certificate and place them in the root directory of the project under the names `certificate.key` and `certificate.crt`.

 2. Run docker compose overwriting the default ssl config like this:

```
docker compose -f docker-compose.yaml -f .dev/docker-compose.ssl.yaml up
```

#### Run as root

```
docker compose -f docker-compose.yaml -f .dev/docker-compose.run-as-root.yaml up
```
