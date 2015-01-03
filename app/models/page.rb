class Page < ActiveRecord::Base
  has_many :user_bookmarks, class_name: 'User', foreign_key: 'farthest_page_id'
  has_one  :challenge
  belongs_to :next_page, class_name: 'Page'
  has_one    :prev_page, class_name: 'Page', foreign_key: 'next_page_id'
  has_many :success_routes, class_name: 'Challenge', foreign_key: 'success_page_id'
  has_many :fail_routes, class_name: 'Challenge', foreign_key: 'fail_page_id'
end
