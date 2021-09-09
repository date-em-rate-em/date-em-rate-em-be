# README

date-em-rate-em-be is the backe-end database for our clienTell app. This read-me will cover the dependencies and setup for a local version of the database as well as information on our current deployed version.

* Team Members
  - Alicia Henzler [Linkedin](https://www.linkedin.com/in/aliciahenzler/)
  - Alex Ferencz [Linkedin](https://www.linkedin.com/in/alex-ferencz/)
  - Lawrence Whalen [Linkedin](www.linkedin.com/in/lawrencewhalen)

* App gem versions:
  - Ruby 2.7.2
  - Rails 5.2.6
  - Puma 3.11
  - Graphql 1.12.15
  - Graphql-rails 1.8.0

* Configuration:
 - Fork the project and clone down a local copy.
 - Run bundle install to install gems

* Database creation:
  - rails db:create
  - rails db:migrate
  - rails db:seeds

* How to run the test suite:
  - Run `rails graphql:schema:dump` in the terminal to create a schema dump
  - Run bundle exec rspec to run the test suite

* Deployment:
  - [Back-end deployment](https://date-em-rate-em-be.herokuapp.com/graphql)
  - [Front-end deployment](https://clientell.netlify.app/)
  - [Front-end repo](https://github.com/date-em-rate-em/date-em-rate-em-fe)

* Wiki for GraphQL queries and mutations 
 - [JSON contracts](https://date-em-rate-em.slite.com/) and other useful information.

* Cors Whitelist:
  - 'https://clientell.netlify.app/'

* Contribution links:
  - Due to our complete lack of knowledge of Graphql going into this project almost all coding was done as a group exercise so that all team members could take part in finding and fixing errors and obstacles. Our contribution graphs are not a useful meter of each team member's actual work. Between research, spiking, and code shares this project, and every line of code in it, belongs to all three team members.
