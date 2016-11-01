# Giver Game | Effective Altruists of Berkeley
==============================================

Giver-game application for CS169 / Effective Altruists of Berkeley

https://gentle-plateau-16169.herokuapp.com/


CodeClimate:
[![Code Climate](https://codeclimate.com/github/Nsrose/giver-game/badges/gpa.svg)](https://codeclimate.com/github/Nsrose/giver-game)

Coverage:
[![Test Coverage](https://codeclimate.com/github/Nsrose/giver-game/badges/coverage.svg)](https://codeclimate.com/github/Nsrose/giver-game/coverage)

TravisCI:
[![Build Status](https://travis-ci.org/Nsrose/giver-game.svg?branch=master)](https://travis-ci.org/Nsrose/giver-game)

http://eab.berkeley.edu/

The Effective Altruists of Berkeley are trying to optimize the way people make good decisions. 
They want to help people contribute to causes they care about in a fun way. That's why we're helping them create the Giver
Game. In this game, users will able to create choices between charities and other users can donate to the charity of their 
choosing. 


Pivotal Tracker: https://www.pivotaltracker.com/n/projects/1882085

Setup
-----
1. Install ruby, rvm, rails, cucumber.  
2. Clone this repo  


    $ git clone git@github.com:Nsrose/giver-game.git  


3. Run the following:
    
    
    $ bundle install --without production
    $ bundle exec rake db:migrate    
    $ rake db:seed


4. Run locally:  


    $ rails s -b $IP -p $PORT



Testing
-------
1. Test features (BDD):  


    $ rake features  


2. Unit tests (TDD):
  

    $ rake spec  


Deploying
---------
Pushing to the master branch will automatically trigger Travis and CodeClimate processes. However, 
this will *not* deploy to Heroku. 

Push to Travis and CodeClimate:

    
    $ git add .
    $ git commit -m "ready to check build and code status"
    $ git push origin master
      
    


Deploy to Heroku:  

1. Login to Heroku
 
 
    $ heroku login

2. If this is your first time deploying, run this command:  


    $ git remote add heroku https://git.heroku.com/gentle-plateau-16169.git  
    


3. Push to Heroku  


    $ git add .  
    $ git commit -m "ready to deploy"
    $ git push heroku master
  



