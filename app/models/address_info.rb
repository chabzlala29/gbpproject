class AddressInfo < ActiveRecord::Base

  COUNTRY_LISTS = Gbpproject::Application.settings['country_lists']

  belongs_to :applicant
end
