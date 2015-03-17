class Job < ActiveRecord::Base
  belongs_to :applicant

  DEFAULT_JOBS = ['Web Developer', 'Some Job', 'Another Job']

  validates :name, presence: true
  validates :name, uniqueness: true
end
