FactoryGirl.define do
  factory :member do
    provider 'google'
    uid '1000067890'
    email 'taro@example.com'
  end
end
