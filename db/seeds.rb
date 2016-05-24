# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create(email: "steven.m.fake@gmail.com", password: "password")

Attraction.create(yelp_id: "escape-room-live-dc-washington", flag: true, latitude: 38.9201203, longitude: -77.0741203, location: '(38.9201203, -77.0741203)')
