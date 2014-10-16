module Spree
  User.class_eval do
    has_many :user_notifications, :dependent => :destroy
    has_many :notifications, through: :user_notifications

    preference :notification_switch, :boolean
    
    def num_of_unread_notifications
      UserNotification.unread.size
    end
    
  end
end