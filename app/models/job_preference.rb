class JobPreference < ActiveRecord::Base
  belongs_to :applicant

  SOURCE_LISTS = ['Social Media', 'Ads', 'Friend']

  attr_accessor :source_sub
end
