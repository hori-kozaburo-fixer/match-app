FactoryBot.define do
  factory :user do
    email             { Faker::Internet.free_email }
    password          { 'abc123' }
    password_confirmation { password }
    nickname          { Faker::Name.name }
    birthday          { Faker::Date.birthday(min_age: 18, max_age: 65) }
    request           { Faker::Lorem.paragraph_by_chars(number: 60, supplemental: false) }
    self_introduction { Faker::Lorem.paragraph_by_chars(number: 191, supplemental: false) }
    sex               { '男' }
    team_id           { 1 }
    prefecture_id     { 1 }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/icon.png')) }
  end
end
