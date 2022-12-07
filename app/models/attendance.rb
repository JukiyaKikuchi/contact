class Attendance < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '登園' },
    { id: 3, name: 'お休み' },
  ]
  
  include ActiveHash::Associations
  has_many :parent_books

  end