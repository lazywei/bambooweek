class Item < ActiveRecord::Base
  attr_accessible :description, :name, :picture, :price
end
