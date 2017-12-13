FactoryBot.define do
  factory :member do
    provider 'google'
    sequence(:uid) { |i| "#{1000067890 + i}" }
    sequence(:email) { |i| "user#{i}@example.com" }
  end
end
