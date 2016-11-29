class Chore < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  # validates :user_id, presence: true

  # def next
  #  self.class.where("user.id > ?", self.user_id).first
  # end
  #
  # def prev
  #  self.class.where("user.id < ?", self.user_id).last
  # end
end
