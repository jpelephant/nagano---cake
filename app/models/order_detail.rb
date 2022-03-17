class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def add_tax_sales_price
    (self.price * 1.10).round
  end

  def subtotal
    item.with_tax_price * amount
  end

  def total_price
    item.taxin_price * amount
  end

  def sum_of_price
    item.add_tax_item_price * amount
  end
end
