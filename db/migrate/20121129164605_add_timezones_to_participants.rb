class AddTimezonesToParticipants < ActiveRecord::Migration
  def change
  	add_column :participants, :time_zone, :string
  end
end
