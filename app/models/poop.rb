class Poop < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '良い' },
    { id: 3, name: '普通' },
    { id: 4, name: '悪い' },
  ]

  include ActiveHash::Associations
  has_many :parent_books

  end