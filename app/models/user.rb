class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, through: :participants
  has_many :participants

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :admin

  validates :name, presence: true
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
                      message: 'is invalid. Input half-width alphanumeric characters.' }
  validates :admin_id, numericality: { other_than: 1, message: "can't be blank" }
end
