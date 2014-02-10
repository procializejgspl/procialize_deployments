class AddColumnGaToCustomizer < ActiveRecord::Migration
  def change
    add_column :customizers, :ga, :text
  end
end
