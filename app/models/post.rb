class Post < ActiveRecord::Base
  validates :title, :body, presence: true
  belongs_to :user

  scope :with_users, ->{ includes(:user) }
end
