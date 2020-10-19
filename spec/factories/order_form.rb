FactoryBot.define do
  factory :order_form do
    token                {123}
    postal_code          {"111-2222"}
    prefecture_id        {16}
    municipality         {"横浜市"}
    address              {"1-1-1"}
    tel_number           {"09011112222"}
    association          :user
    association          :item
  end
end
