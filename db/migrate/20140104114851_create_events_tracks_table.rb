class CreateEventsTracksTable < ActiveRecord::Migration
  def up
    create_table :events_tracks, :id => false do |t|
      t.integer :event_id
      t.integer :track_id
    end
  end

  def down
  end
end
