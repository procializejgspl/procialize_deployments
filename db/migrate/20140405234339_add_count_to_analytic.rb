class AddCountToAnalytic < ActiveRecord::Migration
  def change
    add_column :analytics, :count, :integer, default: 0
  end
end
