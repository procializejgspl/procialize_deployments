class AddColumnGaTrackerIdToCustomizer < ActiveRecord::Migration
  def change
    add_column :customizers, :ga_tracker_id, :string
  end
end
