class User < ActiveRecord::Base
  validates :username, :password, presence: true
  has_secure_password
  after_create :set_page_one
  has_many :user_challenges
  has_many :challenges, through: :user_challenges
  has_many :user_pages
  has_many :read_pages, through: :user_pages, source: :page

  def set_page_one
    uid = self.id
    UserPage.create(user_id: uid, page_id: 1)
  end

  def farthest_page
    self.read_pages.last
  end

  def return_errors
    if self.errors[:username].any?
      err = self.errors[:username].first
      return "username error: #{err}"
    elsif self.errors[:password].any?
      err = self.errors[:password].first
      return "password error: #{err}"
    else
      return nil
    end
  end

end
