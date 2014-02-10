class CreateCustomizers < ActiveRecord::Migration
  def change
    create_table :customizers do |t|
      t.string :twitter_handle
      t.string :menu_color_one
      t.string :menu_color_two
      t.string :menu_font_color
      t.string :menu_font_size
      t.string :menu_header_color
      t.text :contact_us_body
      t.timestamps
    end
  end
end
