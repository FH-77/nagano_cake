class Order < ApplicationRecord
  has_many :order
  belongs_to :customer
end
