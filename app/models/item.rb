class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_charge
  belongs_to :category
  belongs_to :quality
  belongs_to :province
  belongs_to :shipping_date

  validates :item_name, :price, :explanation, :image, presence: true

  validates :delivery_charge_id, :category_id, :quality_id, :province_id, :shipping_date_id, numericality: { other_than: 1 }
end
