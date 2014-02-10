class CreateMeeters < ActiveRecord::Migration
  def change
    create_table :meeters do |t|
      t.integer :meeting_id
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
  end
end
