class User < ApplicationRecord

devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable
      
has_many :items
has_many :orders
has_one  :identification
validates :nickname, presence: true

VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates :password, format: {with: VALID_PASSWORD_REGEX}

end