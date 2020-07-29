# Requirements:
* docker, docker-compose
# Tech:
* Ruby:2.6.3
* Rails:5
* Docker, docker-compose
* CircleCI
* Server AWS
# Instructions:
* /# docker-compose build
* /# docker-compose up (If don't want to see log, add -d)
* /# docker attach project1_rails (to get log)
* /# docker-compose exec web bash
    * rails db:create
    * rails db:migrate
    * rails fb:seed
* /# rails console (for interact with model, database, vv)

* /# docker-compose down (to stop web containers)

* localhost:3000 for web interface for normal users
* localhost:3000/admin for web interface for admin users
