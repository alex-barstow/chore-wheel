class User < ActiveRecord::Base
  has_one :chore
  validates :name, presence: true
  validates :phone_number, presence: true
end
