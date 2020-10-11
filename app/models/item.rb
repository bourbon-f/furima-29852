class Item < ApplicationRecord

  # バリデーション
  with_options presence: true do
    validates :product_name
    validates :description
    validates :genre_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :days_id
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :genre_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :days_id
  end

  # アソシエーション
  belongs_to :user
  has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :day

end