class OrderItemship < ActiveRecord::Base
  attr_accessible :count, :item_id, :order_id
  belongs_to :order
  belongs_to :item
end
