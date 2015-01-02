class Challenge < ActiveRecord::Base
  belongs_to :page
  belongs_to :success_page, class_name: 'Page'
  belongs_to :fail_page, class_name: 'Page'
  has_many   :user_challenges
  has_many   :users, through: :user_challenges
end
