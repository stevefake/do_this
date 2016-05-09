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

bin/rake db:create:all
bin/rake db:migrate

heroku run rake db:create:all
heroku run db:migrate

heroku open

git push heroku will commit your code
heroku create once you have your repo
  will rando generate new name as your url
first url is the web url; second url is our git url

you have to push to both github (for collab) and heroku

heroku logs --tail #willconstantly print the file log errors

heroku local    will start your app like heroku will; heroku from the top dir

`rake db:migrate` will only migrate your development database by default
use `RACK_ENV=test rake db:migrate` to migrate your test database
if you find yourself in vim with a merge message with vim `:wq`

heroku pg:info


user preferences:
id for every attraction must be in db
  -user can specify not to get an attraction suggested again



YELP API  https://www.yelp.com/developers/documentation/v2/overview
  Find up to 40 best results for a geographically-oriented search
  Sort results by the best match for the query, highest ratings, or distance
https://www.yelp.com/developers/documentation/v2/search_api
  use Specify Location by Geographic Coordinate?
    `ll=latitude,longitude,accuracy,altitude,altitude_accuracy`
    Sample Request: https://api.yelp.com/v2/search?term=food&ll=37.788022,-122.399797


    gem 'yelp', require: 'yelp'


RAILS
bin/rails server
rails console
rails server
rake
rails generate
rails dbconsole
rails new app_name
bin/rake db:drop db:migrate db:seed 
bin/rails generate scaffold HighScore game:string score:integer
Users, belongs to many restaurants and attractions (fks for both)
  t.belongs_to restaurants
  t.belongs_to attractions
Restaurants
  t.string? location      (lat. and long. ?)
  t.number  rating        reviews average (1-5 stars)
  t.number  reviews_count (total num of yelp reviews)
  t.string?datetime? open hours
 ?t.string	yelp_id       Yelp ID for this business
  t.string  name	        Name of this business
  t.string  image_url		  URL of photo for this business
  t.string  url	 	        URL for business website (or its page on yelp? design choice)
  t.string  phone         Phone number for this business with international dialing code (e.g. +442079460000)
  t.string  snippet_text	Snippet text associated with this business
  t.dict    location		  Location data for this business
  t.list    location.address	Address for this business. Only includes address fields.
  t.dict    location.coordinate	Coordinates of this location. This will be omitted if coordinates are not known for the location.
  t.number  location.coordinate.latitude	Latitude associated with the location. omitted if none is known for the location.
  t.number  location.coordinate.longitude	Longitude associated with the location. omitted if none is known for the location.
  t.string  menu_provider	Provider of the menu for this business
Attractions
  ditto all the restaurants columns


RSPEC
group :development, :test do
  gem 'rspec-rails', '~> 3.0'
end

bundle install

rails generate rspec:install

Use the rspec command to run your specs:
bundle exec rspec
