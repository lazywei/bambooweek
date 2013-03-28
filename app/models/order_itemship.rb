class OrderItemship < ActiveRecord::Base
  attr_accessible :count, :item_id, :order_id
end
