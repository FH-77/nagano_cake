class CartItem < ApplicationRecord
  belongs_to :item_id
  belongs_to :customer_id
end
