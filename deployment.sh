#!/bin/sh
set -eu
docker-compose up  --build -d
docker-compose exec web rails db:migrate