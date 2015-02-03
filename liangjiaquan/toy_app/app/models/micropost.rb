class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :content, length: { maximum: 14 }, 
  # practice1 of chapter2
  presence: true
end
