class Order < ApplicationRecord
  has_many_attached :order_id
  belongs_to :customer_id
end
