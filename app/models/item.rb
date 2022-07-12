class Item < ApplicationRecord
  belongs_to       :user
  has_one_attached :image
  has_one          :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_charge
  belongs_to :category
  belongs_to :quality
  belongs_to :province
  belongs_to :shipping_date

  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :item_name, :explanation, :image, presence: true

  validates :delivery_charge_id, :category_id, :quality_id, :province_id, :shipping_date_id, numericality: { other_than: 1 }
end
