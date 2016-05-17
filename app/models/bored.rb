class Bored < ActiveRecord::Base
  geocoded_by :address
  # geocoded_by :ip_address,
  # :latitude => :lat, :longitude => :lon
end
