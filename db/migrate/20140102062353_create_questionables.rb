class CreateQuestionables < ActiveRecord::Migration
  def change
    create_table :questionables do |t|
      t.integer :event_id
      t.integer :user_id
      t.boolean :approved
      t.text :quest_name
      t.integer :likes,:default => 0

      t.timestamps
    end
  end
end
