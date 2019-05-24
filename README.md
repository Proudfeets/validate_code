# README

This program processes a csv file, normal.csv, and turns out the users sorted into possible duplicates and unique users in Terminal.


* Ruby version 2.3.3

* System dependencies
- Postgres
- Ruby on Rails
- Bundler

* Configuration in Terminal
- run `bundle`
- run `bundle exec rake db:create`
- run `rails db:migrate`

* Deployment instructions
- in Terminal, start the server with ```rails s```
- open your browser to tcp://localhost:3000
- refresh the page once (more than once will duplicate the data in the database)
- check the Terminal window where your server is running to find the data
