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

Upon visiting the landing page, the site will attempt to geolocate the user:

![Loading user location](app/assets/images/Screenshot_2016-05-26_11.54.40.png?raw=true "Geolocating")

The site will then present the user with the option to receive a activity or
restaurant suggestion:

![Loading user location](app/assets/images/Screenshot_2016-05-26_11.55.12.png?raw=true "Selection Screen")

A sample activity suggestion:

![Loading user location](app/assets/images/Screenshot_2016-05-26_11.55.49.png?raw=true "Bored Result")

A sample food suggestion:

![Loading user location](app/assets/images/Screenshot_2016-05-26_11.56.53.png?raw=true "Hungry Result")

The map indicating walking directions from the user's location to the destination:

![Loading user location](app/assets/images/Screenshot_2016-05-26_11.57.53.png?raw=true "Walking Directions")
