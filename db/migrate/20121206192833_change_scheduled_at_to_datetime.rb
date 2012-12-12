class ChangeScheduledAtToDatetime < ActiveRecord::Migration
  def up
  	remove_column :scheduled_messages, :scheduled_at
    add_column :scheduled_messages, :scheduled_at, :datetime
  end

  def down
    remove_column :scheduled_messages, :scheduled_at
  	add_column :scheduled_messages, :scheduled_at, :time
  end
end
