class SurveyAnswer < ActiveRecord::Base
  attr_accessible :option_id, :question_id, :user_id
end
