class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.integer :user_id
      t.integer :count,:default => 0
      t.integer :viewed_by

      t.timestamps
    end
  end
end
