class AddNotificationCounterCacheToUser < ActiveRecord::Migration
  def change
    add_column :spree_users, :num_of_notifications, :integer
  end
end
