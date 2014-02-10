class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.integer :survey_id

      t.timestamps
    end
  end
end
