class Item < ApplicationRecord
  has_one_attached :image
  has_many_attached :item_id
  belongs_to :genre_id
end
