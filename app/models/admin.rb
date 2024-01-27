class Admin < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'member' },
    { id: 3, name: 'admin' },
  ]

  include ActiveHash::Associations
  has_many :users
end