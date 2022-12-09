class TeacherComment < ApplicationRecord
  belongs_to :user
  belongs_to :parent_book
end
