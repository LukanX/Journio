class AddTypeToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :type, :string, default: "received"
  end
end
