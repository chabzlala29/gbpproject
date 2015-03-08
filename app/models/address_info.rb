class AddressInfo < ActiveRecord::Base

  COUNTRY_LISTS = ['Philippines', 'Korea', 'America']
  belongs_to :applicant
end
