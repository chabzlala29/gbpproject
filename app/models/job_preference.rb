class JobPreference < ActiveRecord::Base
  belongs_to :applicant

  SOURCE_LISTS = ['Select', 'Social Media', 'Ads', 'Friend','Newspaper Ad ', 'Current Employee ']

  attr_accessor :source_sub
end
