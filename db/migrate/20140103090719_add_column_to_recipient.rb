class AddColumnToRecipient < ActiveRecord::Migration
  def change
    add_column :recipients, :status, :boolean
  end
end
