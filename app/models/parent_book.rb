class ParentBook < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :mood
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :greeted_time
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :attendance

  validates :parent_name, :parent_comment,  presence: true
  validates :attendance_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :tell_number, format: {with:/\A\d{10,11}\z/}

  belongs_to :user
  belongs_to :register, optional: true
  has_many :teacher_comments, dependent: :destroy
end
