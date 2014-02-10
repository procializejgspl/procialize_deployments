class CreateRecommends < ActiveRecord::Migration
  def change
    create_table :recommends do |t|
      t.integer :user_id
      t.boolean :done
      t.string :type

      t.timestamps
    end
  end
end
