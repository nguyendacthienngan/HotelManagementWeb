# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  2.7.3
  
Database: PostgreSQL
CSS framework: Bootstrap 5.0
  
  
Install dependencies:
            
        bundle install

* Configuration
  
Config database by cange your user name and password in database.yml (development and test)
    

* Init all things for Database  

      rails db:setup

This step will help you create database, migrate all migrations, seeding data


* Database creation 
  
        rails db:create
  
    
* Creating default tables
  
        rails db:migrate

* Inserting data

        rails db:seed
  
* Run localhost-8000:
  
        rails s

* Default admin account:
        
        email: admin@gmail.com
        password: 123456


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