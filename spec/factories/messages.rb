FactoryBot.define do
  factory :message do
    message { Faker::Lorem.sentences }
    association :user
    association :room
  end
end
