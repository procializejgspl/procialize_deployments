class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.text :description
      t.boolean :can_message
      t.boolean :can_meet

      t.timestamps
    end
  end
end
