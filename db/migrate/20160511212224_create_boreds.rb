class CreateBoreds < ActiveRecord::Migration
  def change
    create_table :boreds do |t|
      t.string :name
      t.integer :rating
      t.integer :reviews_count
      t.string :image_url
      t.string :snippet_text
      t.point :location
      t.string :yelp_id
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
