FactoryBot.define do
  factory :tweet do
    name    { Faker::Lorem.sentence } 
    text    { Faker::Lorem.sentences }
    team_id { 1 }
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/icon.png'))}
    association :user
  end
end