class Event < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state

  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :place, presence: true
  validates :fee, presence: true, numericality: { only_integer: true, in: 0..999_999 }
  validates :payer, presence: true
  validates :booker, presence: true
  validates :state_id, presence: true

end
