class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates :title, :body, presence: true

  default_scope { order ('created_at DESC') }
end
