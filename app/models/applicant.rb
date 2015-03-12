class Applicant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  CITIZENSHIP_LISTS = Gbpproject::Application.settings['citizenship_lists']

  CIVIL_STATUS_LISTS = ['Filipino', 'Korean', 'American']

  enum civil_status: [:single, :married, :widow, :divorced]
  enum gender: [:male, :female]

  has_one :address_info
  has_one :job_preference

  [:answers, :educations, :families, :languages, :skills, :certificates, :character_preferences].each do |resource|
    has_many resource
  end

  accepts_nested_attributes_for :address_info, :answers, :job_preference

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :middlename, presence: true

  dragonfly_accessor :avatar

  attr_accessor :accept_terms

  def fullname
    [firstname, middlename, lastname].compact.join(" ")
  end
end
