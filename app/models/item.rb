
class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image
  has_one :order
  
  validates :image, presence: true
  validates :item, presence:true
  validates :text, presence:true
  validates :price, presence:true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}

  #validates :user_id, presence:true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 , message: "を入力してください"}
  
  belongs_to :status
  validates :status_id, numericality: { other_than: 1 , message: "を入力してください"}

  belongs_to :deliverycharge
  validates :deliverycharge_id , numericality: { other_than: 1 , message: "を入力してください"}

  belongs_to :area
  validates :area_id , numericality: { other_than: 0 , message: "を入力してください"}
  
  belongs_to :deliveryday
  validates :deliveryday_id , numericality: { other_than: 1 , message: "を入力してください"}

end
