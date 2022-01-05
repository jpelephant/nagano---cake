class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  def subtotal
    item.with_tax_price * amount
  end
  
  def total_price
    item.taxin_price * quantity
  end
  
  def add_tax_sales_price
    (self.price * 1.10).round
  end
end
