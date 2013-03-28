class Order < ActiveRecord::Base
  attr_accessible :email, :mobile, :name, :stid
end
