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

  #THIS IS THROWING A ROLLBACK IN ACTIVE RECORD...WHY?
  def resolve_farthest_page
    self.update(farthest_page_id: self.read_pages.last.id)
  end

end
