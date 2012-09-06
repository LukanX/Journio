class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.integer :study_id

      t.timestamps
    end
    add_index :participants, [:study_id]
  end
end
