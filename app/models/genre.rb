class Genre < ApplicationRecord
  has_many_attached :item_id
end
