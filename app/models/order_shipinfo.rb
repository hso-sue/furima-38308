class OrderShipinfo
  include ActiveModel::Model
  attr_accessor :post_code, :prefectures_id, :city, :address, :building_name, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/}
    validates :prefectures_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :token, presence: true
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shipinfo.create(post_code: post_code, prefectures_id: prefectures_id, city: city, address: address, telephone_number: telephone_number, building_name: building_name, order_id: order.id)
  end
end