class JobPreference < ActiveRecord::Base
  belongs_to :applicant

  SOURCE_LISTS = ['Social Media', 'Ads', 'Friend','Newspaper Ad ', 'Current Employee ']

  validates :first_pref, presence: true
  validates :second_pref, presence: true
  validates :source, presence: true


  attr_accessor :source_sub
end
