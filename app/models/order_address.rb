class OrderAddress
  include ActiveModel::Model
  attr_accessor :town, :building, :city, :province_id, :post_code, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :town
    validates :city
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :phone_number, format: { with: /0\d{9,10}/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :province_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(town: town, building: building, city: city, province_id: province_id, post_code: post_code,
                   phone_number: phone_number)
  end
end
