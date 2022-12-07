class ParentBook < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :poop
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :greeted_time
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :attendance

  validates :parent_name, :parent_comment,  presence: true
  validates :attendance_id, numericality: { other_than: 1, message: "can't be blank" } 

  belongs_to :user
end
