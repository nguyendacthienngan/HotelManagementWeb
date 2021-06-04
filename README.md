# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  2.7.3
* System dependencies
  
Chart drawing: chartkick
  
Database: PostgreSQL
  
CSS framework: Bootstrap 5.0
  
Front-end framework: VueJS 
  
Install dependencies:
            
        bundle install

* Configuration
  
Config database by cange your user name and password in database.yml (development and test)
    

* Database creation 
  
        rails db:create
  
    
* Database initialization
  
        rails db:migrate

* Run localhost-8000:
  
        rails s

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Database command:

Create controller, model, view,..
        
        rails g scaffold <controller_name>

Create a controller

        rails g controller <controller_name>

Create a model

        rails g model <model_name>

Create a migration

        rails g migration <migration_name>

Run migrate

        rails db:migrate

Run migrate all

        rails db:migrate:all


Undo migrate

        rails db:migrate:undo

Undo migrate all

        rails db:migrate:undo:all

Drop database

        rails db:drop

Reset database (drop database, create database, run migrate)

        rails db:migrate:reset