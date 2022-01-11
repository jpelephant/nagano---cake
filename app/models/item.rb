class Item < ApplicationRecord
  has_many :cart_item
  has_many :order_details
  belongs_to :genre

  attachment :image

  def add_tax_sales_price
    (self.sales_price * 1.10).round
  end

  def taxin_price
        price*1.1
  end
end
