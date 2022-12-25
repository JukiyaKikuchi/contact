FactoryBot.define do
  factory :parent_book do
    parent_name  {"テスト"}
    parent_comment  {Faker::Lorem.sentence}
    temperature  {"36.5度"}
    breakfast  {"テスト"}
    greeted_name  {"テスト"}
    greeted_time_id  {2}
    attendance_id  {2}
    mood_id  {2}
    tell_number  {0000000000}

    
    association :user
    association :register
  end
end
