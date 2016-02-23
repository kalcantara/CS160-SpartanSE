#!/bin/bash


mkdir RailsApplication
cd RailsApplication
rails new SJSUelp
cd SJSUelp
bin/rails generate scaffold Post title:string body:text
bin/rake db:migrate