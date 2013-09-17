class Post < ActiveRecord::Base
  validates :title, :body, presence: true
  belongs_to :user
  acts_as_commentable

  scope :with_users, ->{ includes(:user) }

  def load_comments
    comments.recent.includes(:user)
  end
end
