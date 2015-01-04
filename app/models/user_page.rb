class UserPage < ActiveRecord::Base
  validates :page_id, :user_id, presence: true
  before_save :update_user_bookmark
  belongs_to :user
  belongs_to :page

  def update_user_bookmark
    u_id = self.user_id
    p_id = self.page_id
    User.find(u_id).update(farthest_page_id: p_id)
  end
end
