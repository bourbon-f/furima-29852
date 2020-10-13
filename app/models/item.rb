class Item < ApplicationRecord

  # バリデーション
  with_options presence: true do
    PRICE_REGEX = /\A[0-9]+\z/.freeze

    validates :product_name
    validates :description
    validates :genre_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :days_id
    validates :price, numericality: { with:PRICE_REGEX, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Price Out of setting range"}
  end

  with_options numericality: { other_than: 1, message:"select" } do
    validates :genre_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :days_id
  end

  validate :image_necessary?

  def image_necessary?
    errors.add(:image, 'Please upload your image.') unless image.attached?
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