class CreateAdvLogos < ActiveRecord::Migration
  def change
    create_table :adv_logos do |t|
      t.string :name

      t.timestamps
    end
  end
end
