class Item < ApplicationRecord

  #アソシエーション
  belongs_to :user
  has_one :buy
end
