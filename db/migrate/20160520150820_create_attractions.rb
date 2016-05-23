class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :yelp_id
      t.point :location
      t.boolean :flag
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
