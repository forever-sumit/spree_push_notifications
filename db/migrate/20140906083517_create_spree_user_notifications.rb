class CreateSpreeUserNotifications < ActiveRecord::Migration
  def change
    create_table :spree_user_notifications do |t|
      t.integer :user_id
      t.integer :notification_id
      t.string :delivery_status
      t.string :status

      t.timestamps
    end
  end
end
