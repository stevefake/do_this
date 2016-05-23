class AddLatitudeAndLongitudeToAttraction < ActiveRecord::Migration
  def change
    add_column :attractions, :latitude, :float
    add_column :attractions, :longitude, :float
  end
end
