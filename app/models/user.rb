class User < ActiveRecord::Base
  validates :username, :password, presence: true
  has_secure_password
  before_create :set_page_one
  belongs_to :current_page, class_name: 'Page'

  def set_page_one
    self.current_page_id = 1
  end
end
