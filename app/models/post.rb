class Post < ActiveRecord::Base
  validates :title, :body, presence: true
  belongs_to :user
end
