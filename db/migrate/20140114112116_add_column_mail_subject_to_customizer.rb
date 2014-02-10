class AddColumnMailSubjectToCustomizer < ActiveRecord::Migration
  def change
    add_column :customizers, :mail_subject, :string
  end
end
