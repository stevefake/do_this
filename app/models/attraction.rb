class Attraction < ActiveRecord::Base
  belongs_to :user

  reverse_geocoded_by :latitude, :longitude, reverse_geocode: false

  # For geocoding your model must provide a method that returns an address.
  # This can be a single attribute, but it can also be a method that returns a
  # string assembled from different attributes (eg: city, state, and country).

  # Next, your model must tell Geocoder which method returns your object's geocodable address:
  #
  # geocoded_by :full_street_address   # can also be an IP address
  # after_validation :geocode          # auto-fetch coordinates
  # For reverse geocoding, tell Geocoder which attributes store latitude and longitude:
  #
  # reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode  # auto-fetch address

  # Find the Bearing (Direction) Between Places
  # Given a Place model with geocoded objects, find the distance and direction of the closest ones:
  # nearbys = Attraction.near("Washington, DC", 50,
  # nearbys = self.near("Washington, DC", 50,
  #   :order => "distance")
  # bearing = nearbys.first.bearing # => 46.12
  # Geocoder::Calculations.compass_point(
  #   bearing) # => "NE"
  # The bearing attribute is a number between 0 and 360 indicating the number of
  # degrees clockwise from due North (eg: 180 = South, 270 = West).
  # nearbys = Attraction.near(cords)
  # nearbys = Attraction.near(session[:coordinates].values)

end
