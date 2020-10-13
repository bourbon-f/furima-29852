FactoryBot.define do
  factory :item do
    product_name    {"あああ"}
    description     {"えええ"}
    genre_id        {3}
    status_id       {3}
    burden_id       {2}
    area_id         {2}
    days_id         {2}
    price           {1000}
    association     :user
  end
end
