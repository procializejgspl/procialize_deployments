class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :rate

      t.timestamps
    end
  end
end
