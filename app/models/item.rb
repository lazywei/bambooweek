class Item < ActiveRecord::Base
  mount_uploader :picture, VenusUploader
  has_many :order_itemships, :dependent => :destroy
  has_many :orders, :through => :order_itemships
  attr_accessible :description, :name, :picture, :price, :picture_cache, :remove_picture
end
