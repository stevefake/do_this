class CreateHungries < ActiveRecord::Migration
  def change
    create_table :hungries do |t|
      t.string :name
      t.integer :rating
      t.integer :reviews_count
      t.string :image_url
      t.string :snippet_text
      t.point :location
      t.string :yelp_id

      t.timestamps null: false
    end
  end
end
