class User < ActiveRecord::Base
  has_many :chores
  validates :name, presence: true
  validates :phone_number, presence: true
end
