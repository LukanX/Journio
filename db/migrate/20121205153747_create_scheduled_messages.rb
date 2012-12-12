class CreateScheduledMessages < ActiveRecord::Migration
  def change
    create_table :scheduled_messages do |t|
      t.string :message
      t.string :phone_number
      t.time :scheduled_at
      t.time :sent_at
      t.integer :study_id

      t.timestamps
    end
  end
end
