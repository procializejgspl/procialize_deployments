class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :starting_at
      t.datetime :ending_at

      t.timestamps
    end
  end
end
