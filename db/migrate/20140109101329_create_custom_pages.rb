class CreateCustomPages < ActiveRecord::Migration
  def change
    create_table :custom_pages do |t|
      t.text :page_content
      t.boolean :display
      t.string :name

      t.timestamps
    end
  end
end
