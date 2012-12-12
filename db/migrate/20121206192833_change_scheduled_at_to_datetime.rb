class ChangeScheduledAtToDatetime < ActiveRecord::Migration
  def up
  	change_table :scheduled_messages do |t|
      t.change :scheduled_at, :datetime
    end
  end

  def down
  	change_table :scheduled_messages do |t|
  		t.change :scheduled_at, :time
	end
  end
end
