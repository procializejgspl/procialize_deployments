class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :company, :string
    add_column :users, :headline, :string
    add_column :users, :industry, :string
    add_column :users, :interest, :string
    add_column :users, :location, :string
    add_column :users, :role_id,:integer
  end
end
