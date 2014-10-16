class CreateSpreeNotifications < ActiveRecord::Migration
  def change
    create_table :spree_notifications do |t|
      t.string :content
      t.text :detail_content
      t.date :pushed_on

      t.timestamps
    end
  end
end
