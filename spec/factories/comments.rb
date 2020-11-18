FactoryBot.define do
  factory :comment do
    text    { Faker::Lorem.sentences }
    association :user
    association :tweet
  end
end
