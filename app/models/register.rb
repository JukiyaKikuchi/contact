class Register < ApplicationRecord
  belongs_to :user
  has_many :parent_books
  has_one_attached :image

  validates :title, presence: true
  validates :general_comment, presence: true
end
