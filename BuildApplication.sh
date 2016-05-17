#!/bin/bash


cd Nearbite
bundle install
bin/rake db:migrate
bin/rails server