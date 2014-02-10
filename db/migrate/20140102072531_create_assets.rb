class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.attachment :content
      t.string :type

      t.timestamps
    end
  end
end
