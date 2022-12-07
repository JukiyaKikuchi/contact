class GreetedTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '16時頃' },
    { id: 3, name: '17時頃' },
    { id: 4, name: '18時頃' },
    { id: 5, name: 'それ以外' },
  ]

  include ActiveHash::Associations
  has_many :parent_books
  
  end