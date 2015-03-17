class Education < ActiveRecord::Base
  

  belongs_to :applicant

  #validates :level, presence: true
  #validates :institution, presence: true
  #validates :field, presence: true
  #validates :location, presence: true
  #validates :major, presence: true
  #validates :graduation_year, presence: true

  enum level: [:elementary, :high_school, :college, :masteral, :doctorate]

end
