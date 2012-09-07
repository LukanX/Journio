class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :to_number
      t.string :from_number
      t.string :content
      t.integer :study_id

      t.timestamps
    end
  end
end
