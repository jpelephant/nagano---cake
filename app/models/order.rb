class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer
  
  def full_name
    self.last_name + " " + self.first_name
  end
  
end
