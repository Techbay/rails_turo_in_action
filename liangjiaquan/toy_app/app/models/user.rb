class User < ActiveRecord::Base
  has_many :microposts
  # practice2 of chapter2
  validates :name, presence: true
  validates :email, presence: true
end
