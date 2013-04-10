class Order < ActiveRecord::Base
  has_many :order_itemships, :dependent => :destroy
  has_many :items, :through => :order_itemships
  attr_accessible :email, :mobile, :name, :stid, :item_ids, :draw_date

  validates_presence_of :name, :email, :mobile
  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  validates_format_of :mobile, :with => /^\d*$/
  validates :draw_date, :inclusion => {:in => [509, 510], :message => "%{value} is not a valid draw date"}

  def total_price
    total = 0
    self.order_itemships.each do |o_i|
      total += o_i.count.to_i * o_i.item.price.to_i
    end
    return total
  end
end
