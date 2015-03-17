class AddressInfo < ActiveRecord::Base

  COUNTRY_LISTS = Gbpproject::Application.settings['country_lists']

  belongs_to :applicant

  validates :city, presence: true
  validates :country, presence: true
  validates :mobile, presence: true

end
