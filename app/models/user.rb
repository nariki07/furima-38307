class User < ApplicationRecord

devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable
validates :nickname, presence: true
validates :last_name, presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
validates :last_name_kana, presence: true , format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい"}
validates :first_name_kana, presence: true , format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい" }
validates :birthday, presence: true
VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates :password, format: {with: VALID_PASSWORD_REGEX}

end