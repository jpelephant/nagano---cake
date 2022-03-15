class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item


  def add_tax_item_price
    (self.item.price * 1.10).round
  end

  def sum_of_price
    self.add_tax_item_price * amount
  end
end
