# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Yelp.client.search('San Francisco', { term: 'food' })

5.times do
  User.create(email: FFaker::Internet.email, password: "password")
end

5.times do
  Bored.create(name: FFaker::Company.name, rating: 4, reviews_count: 200,
  image_url: 'https://www.yelp.com/biz_photos/shake-shack-washington?select=pD5tPkaXevJZbSIlsT-Pbg',
  snippet_text: 'snippet example', location: '(38.9063081, -77.111955)', yelp_id: 1)
end

# t.point :location
# number: FFaker::PhoneNumber.short_phone_number
# first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name

5.times do
  Hungry.create(name: FFaker::Company.name, rating: 4, reviews_count: 200,
  image_url: 'https://www.yelp.com/biz_photos/shake-shack-washington?select=pD5tPkaXevJZbSIlsT-Pbg',
  snippet_text: 'snippet example', location: '(38.9063081, -77.111955)', yelp_id: 1)
end
