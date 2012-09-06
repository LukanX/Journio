class AddIndexToStudiesName < ActiveRecord::Migration
  def change
  	add_index :studies, :name, unique: true
  end
end
