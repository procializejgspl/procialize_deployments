class CreateSurveyAnswers < ActiveRecord::Migration
  def change
    create_table :survey_answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :option_id

      t.timestamps
    end
  end
end
