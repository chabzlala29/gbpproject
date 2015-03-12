class Skill < ActiveRecord::Base
  belongs_to :applicant

  enum proficiency: [:beginner, :intermediate, :expert]
end
