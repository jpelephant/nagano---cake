class Item < ApplicationRecord
  has_many :cart_item
  has_many :order_details
  belongs_to :genre

  attachment :image

  validates :name, presence: true
  validates :genre_id, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  validates :is_active, presence: true
  validates :price, presence: true


  def add_tax_item_price
    (self.price * 1.10).round
  end

end
