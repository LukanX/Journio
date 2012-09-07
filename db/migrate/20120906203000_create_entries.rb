class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :content
      t.integer :participant_id

      t.timestamps
    end
    add_index :entries, [:participant_id, :created_at]
  end
end
