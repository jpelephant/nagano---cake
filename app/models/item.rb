class Item < ApplicationRecord
  
  def add_tax_price
        (self.price * 1.08).round
  end
end
