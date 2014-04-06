class CreateAnalytics < ActiveRecord::Migration
  def change
    create_table :analytics do |t|
      t.string :performed_by
      t.string :action
      t.string :performed_on

      t.timestamps
    end
  end
end
