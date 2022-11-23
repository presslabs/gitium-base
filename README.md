gitium-base
===========

Kickstart WordPress projects with a sane development environment!

## Clone and go!

    git clone -o gitium git@github.com:PressLabs/gitium-base AWESOME_SITE
    cd AWESOME_SITE

### Linux

    USER_ID="$(id -u)" GROUP_ID="$(id -g)" docker compose up

### MacOS

    docker compose up

Point your browser at [http://localhost:8080/wp](http://localhost:8080/wp).

## Connect to your remote git

    cd AWESOME_SITE
    git remote add origin git@github.com:GITHUB_USERNAME/AWESOME_SITE
    git branch master --set-upstream-to origin/master
    git push origin master

## Requirements

To start a project you need to download and install
[docker compose](https://docs.docker.com/compose/).
