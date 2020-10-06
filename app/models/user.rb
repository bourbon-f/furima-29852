class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  # バリデーション
  validates :nickname, presence: true, length: { maximum: 40 }
  validates :email, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  with_options presence: true do
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :family_name_kana, format: { with: /\A[ァ-ン]+\z/}
    validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/}
  end
  validates :birthday, presence: true

  # アソシエーション
  has_many :items
  has_many :buys

end