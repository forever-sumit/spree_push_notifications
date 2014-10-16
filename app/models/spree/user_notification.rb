module Spree
  class UserNotification < ActiveRecord::Base
    belongs_to :user, class_name: 'Spree::User', counter_cache: :num_of_notifications
    belongs_to :notification, class_name: 'Spree::Notification'

    before_create :mark_unread

    scope :unread, ->(user_id) { where("status = ? and user_id = ?", "new", user_id) }
    scope :read, ->(user_id) { where("status = ? and user_id = ?", "read", user_id) }
                           
    def mark_unread
      self.status = 'new'
    end
    
    def read
      self.status = 'read'
      save
    end
          
  end
end