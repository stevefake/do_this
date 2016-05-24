#Do This!

##About
In this application the user specifies whether they are either bored or hungry
and the site returns a popular nearby attraction (a museum, restaurant, etc).
DoThis! currently utilizes the Google Maps api to geolocate the user and to
provide walking directions to the destination the user selects.
It pulls from the Yelp api to provide the activity suggestions along with select
information about the places suggested.
The user is also able to create an account, allowing them to save suggestions
for later. The app uses the Geocode Gem to do an ActiveRecord search of the
Postgres db to notify the user when they are near one of their saved suggestions.
