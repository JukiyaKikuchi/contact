FactoryBot.define do
  factory :teacher_comment do
    teacher_name {"テスト"}
    teacher_comment {Faker::Lorem.sentence}
    association :user
    association :parent_book
  end
end
