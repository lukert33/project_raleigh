class User < ActiveRecord::Base
  validates :username, :password, presence: true
  has_secure_password
  before_create :set_page_one
  belongs_to :farthest_page, class_name: 'Page'
  has_many :user_challenges
  has_many :challenges, through: :user_challenges

  def set_page_one
    self.farthest_page_id = 1
  end
end
