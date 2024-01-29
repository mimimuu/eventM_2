class Participant < ApplicationRecord
  belongs_to :event
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :attendance
end
