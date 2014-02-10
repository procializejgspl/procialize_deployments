class CreateEventDays < ActiveRecord::Migration
  def change
    create_table :event_days do |t|
      t.string :name
      t.integer :conference_id
      t.integer :sequence,:default => 0
      t.date :event_date

      t.timestamps
    end
  end
end
