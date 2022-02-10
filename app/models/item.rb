class Item < ApplicationRecord
  has_many :cart_item
  has_many :order_details
  belongs_to :genre

  attachment :image
  

  
  def add_tax_item_price
    (self.price * 1.10).round
  end

end
