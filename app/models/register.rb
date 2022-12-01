class Register < ApplicationRecord
  has_many :users
  has_one_attached :image

  validates :title, presence: true
  validates :general_comment, presence: true
end
