FactoryBot.define do
  factory :teacher_comment do
    teacher_name {"ใในใ"}
    teacher_comment {Faker::Lorem.sentence}
    association :user
    association :parent_book
  end
end
