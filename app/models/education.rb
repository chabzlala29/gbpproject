class Education < ActiveRecord::Base
  belongs_to :applicant

  enum level: [:elementary, :high_school, :college, :masteral, :doctorate]
end
