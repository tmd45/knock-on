FactoryGirl.define do
  factory :group do
    sequence(:name) { |i| "group#{i}" }
    sequence(:name_kana) { |i| "グループ #{i}" }
    order 0
  end
end
