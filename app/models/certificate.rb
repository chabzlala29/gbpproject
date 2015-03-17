class Certificate < ActiveRecord::Base
  belongs_to :applicant

  dragonfly_accessor :file
end
