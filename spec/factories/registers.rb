FactoryBot.define do
  factory :register do
    title {Faker::Lorem.sentence}
    general_comment {Faker::Lorem.sentence}
    association :user

    after(:build) do |register|
      register.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
