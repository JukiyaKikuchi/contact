class TeacherComment < ApplicationRecord
  belongs_to :user
  belongs_to :parent_book

  validates :teacher_name, presence: true
  validates :teacher_comment, presence: true
end
