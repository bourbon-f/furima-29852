class Item < ApplicationRecord

  # バリデーション
  with_options presence: true do
    validates :product_name
    validates :description
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :days_id
    validates :price
    validates :user
  end

  # アソシエーション
  belongs_to :user
  has_one :buy

end