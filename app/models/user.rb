class User < ApplicationRecord
  # バリデーション
  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true

  # アソシエーション
  has_many :items
  has_many :buys

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
