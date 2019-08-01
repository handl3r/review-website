#!/bin/sh
cd ~/www/Rails_Project1
docker-compose build
docker-compose up
docker-compose exec web rails db:reset