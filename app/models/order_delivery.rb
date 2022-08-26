class Orderdelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :area_id, :city, :block, :building, :phone_number, :order_id

  with_options presence: true do
    validates :postcode
    validates :city
    validates :block
    validates :phone_number
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
    validates :area_id, numericality: { other_than: 0 , message: "can't be blank"}
    
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postcode: postcode, area_id: area_id, city: city,block: block, building: building, phone_number: phone_number, order_id: order_id)
  end
end