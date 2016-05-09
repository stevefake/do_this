#Do This!

##About

##Dev Notes

rails new do_this -m https://raw.githubusercontent.com/tiy-dc-ror-2016-feb/rails_template/master/template.rb

use postgres for map-based apps; strong geolocation support
rails new myapp --database=postgresql`

put rspec in dev and test
  just need fixtures in the test folder

heroku create
Creating app... done, stack is cedar-14
https://whispering-sea-73422.herokuapp.com/ | https://git.heroku.com/whispering-sea-73422.git

git push heroku master

heroku run rake db:create:all
heroku run db:migrate

heroku open

git push heroku will commit your code
heroku create once you have your repo
  will rando generate new name as your url
first url is the web url; second url is our git url

you have to push to both github (for collab) and heroku

heroku logs --tail #willconstantly print the file log errors
