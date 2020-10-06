class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  # バリデーション
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX


  with_options presence: true do
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
    NAME_KANA_REGEX = /\A[ァ-ン]+\z/.freeze
    validates :nickname, length: { maximum: 40 }
    validates :email
    validates :password, length: { minimum: 6 }
    validates :password_confirmation
    validates :family_name, format: { with:NAME_REGEX}
    validates :first_name, format: { with:NAME_REGEX}
    validates :family_name_kana, format: { with: NAME_KANA_REGEX}
    validates :first_name_kana, format: { with: NAME_KANA_REGEX}
    validates :birthday
  end

  # アソシエーション
  has_many :items
  has_many :buys

end