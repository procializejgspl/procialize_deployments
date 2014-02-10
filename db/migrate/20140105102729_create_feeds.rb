class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.text :message
      t.integer :user_id

      t.timestamps
    end
  end
end
