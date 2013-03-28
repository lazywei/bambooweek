class Order < ActiveRecord::Base
  has_many :order_itemships, :dependent => :destroy
  has_many :items, :through => :order_itemships
  attr_accessible :email, :mobile, :name, :stid, :item_ids
end
