class Language < ActiveRecord::Base
  enum level: [:beginner, :intermediate, :fluent]

  belongs_to :applicant
end
