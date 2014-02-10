class AddColumnLikedToQuestionable < ActiveRecord::Migration
  def change
    add_column :questionables, :Liked, :boolean
  end
end
