class Address < ApplicationRecord

  #アソシエーション
  belongs_to :order

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture_id
end
