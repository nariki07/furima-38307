class Identification < ApplicationRecord

validates :last_name, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字を使用してください' }
validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字を使用してください' }
validates :last_name_kana, presence: true , format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "は全角カタカナのみで入力して下さい"}
validates :first_name_kana, presence: true , format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "は全角カタカナのみで入力して下さい" }
validates :birthday, presence: true

belongs_to :user, optional: true 

end
