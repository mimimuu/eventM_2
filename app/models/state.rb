class State < ActiveHash::Base
  self.data = [
    { id: 1, name: 'open' },
    { id: 2, name: 'close' }
  ]
  include ActiveHash::Associations
  has_many :events
end
