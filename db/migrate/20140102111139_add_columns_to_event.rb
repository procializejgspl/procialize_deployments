class AddColumnsToEvent < ActiveRecord::Migration
  def change

    add_column :events, :event_day_id, :integer
  end
end
