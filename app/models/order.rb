class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer

  def full_name
    self.last_name + " " + self.first_name
  end

  def add_tax_item_price
    (self.price * 1.10).round
  end

  def subtotal
    item.with_tax_price * amount
  end

  def total_price
    item.taxin_price * amount
  end

  enum payment_method: { credit_card: 0, transfer: 1 }

end
