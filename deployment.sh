#!/bin/sh
pwd
docker-compose build
docker-compose up
docker-compose exec web rails db:migrate