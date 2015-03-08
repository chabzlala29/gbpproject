class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :applicant

  validates :question_id, uniqueness: { scope: :applicant_id }
end
