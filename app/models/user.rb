class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  # バリデーション
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  with_options presence: true do
    validates :nickname, length: { maximum: 40 }
    validates :email
    validates :password, length: { minimum: 6 }
    validates :password_confirmation
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :family_name_kana, format: { with: /\A[ァ-ン]+\z/}
    validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/}
    validates :birthday
  end

  # アソシエーション
  has_many :items
  has_many :buys

end