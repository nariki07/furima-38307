class OrderDelivery

  include ActiveModel::Model
  attr_accessor :postcode, :area_id, :city, :block, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :city
    validates :block
    validates :token
    validates :user_id
    validates :item_id
  end

  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/ 
  validates :postcode, presence: true, format: { with: VALID_POSTAL_CODE_REGEX } 

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }

  extend ActiveHash::Associations::ActiveRecordExtensions
    validates :area_id, numericality: { other_than: 0 , message: "を入力してください"}
    
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postcode: postcode, area_id: area_id, city: city,block: block, building: building, phone_number: phone_number,order_id: order.id)
  end

end