# Inception
This project creates a webserver that serves a clean wordpress installation

## Installation for localhost / VM
- clone this repository in the Virtual Machine (VM)
- create a `.env` file in the `srcs` of the source code, copy the content of `.env-example` to this file and set the credentials and passwords
- in the VM, the `etc/hosts` file should have the following line:
    - `127.0.0.1 localhost cherrewi.42.fr`

## running the webserver
- in the VM cd to the root of the source code
- run `make`, this will create and start the required services
- open browser Firefox, and go to `https://cherrewi.42.fr/`
    - the browser will complain a bit, because we are not the official owners of the 42.fr domain, but continue anyway

## starting and stopping the webserver
- `make start`
- `make stop`

## removing the webserver containers - but keep the website date
- `make down`
- you can re-create later with `make` or `make up`

## deleting all website data (requires sudo rights)!!
- `make clean`
- `make fclean` (also removes all images)
