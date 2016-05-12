class HungrySerializer < ActiveModel::Serializer
  attributes :id, :name, :rating, :reviews_count, :image_url, :snippet_text, :location, :yelp_id
end
