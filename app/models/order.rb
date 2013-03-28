class Order < ActiveRecord::Base
  has_many :order_itemships, :dependent => :destroy
  has_many :items, :through => :order_itemships
  attr_accessible :email, :mobile, :name, :stid, :item_ids, :draw_date

  validates_presence_of :name, :stid, :email, :mobile
  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  validates_format_of :mobile, :with => /^\d*$/
  validates_format_of :stid, :with => /\w\d*/
  validates :draw_date, :inclusion => {:in => [509, 510], :message => "%{value} is not a valid draw date"}
end
