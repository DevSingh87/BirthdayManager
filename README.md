# How to run app locally

This application runs in a docker container. So, please make sure you have installed Docker on your system.

Please follow these steps to run application locally on your system.


* Clone the repository.

 `git clone git@github.com:DevSingh87/BirthdayManager.git`

* Go to the cloned app.

 `cd BirthdayManager`

* Run docker build command.

 `docker-compose build`

* Once you have got docker container and images built, create database.

 `docker-compose run web bundle exec rake db:create`


* Create tables in the new created database.

 `docker-compose run web bundle exec rake db:migrate`

* Now, you are good to run docker containerized app on your machine.
 
 `docker-compose up`

* Now go the brower and start creating your friends list.

 `http://localhost:3000`

