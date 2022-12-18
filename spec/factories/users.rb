FactoryBot.define do
  factory :user do
    first_name          {"テスト"}
    last_name           {"テスト"}
    first_name_kana     {"テスト"}
    last_name_kana      {"テスト"}
    email               {Faker::Internet.free_email}
    password            {"g9"+Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}
    birthday            {Faker::Date.birthday}
    
    after(:build) do |user|
      user.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end