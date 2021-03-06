class Applicant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  CITIZENSHIP_LISTS = Gbpproject::Application.settings['citizenship_lists']

  CIVIL_STATUS_LISTS = ['Filipino', 'Korean', 'American']

  enum civil_status: [:single, :married, :widow, :divorced]
  enum gender: [:male, :female]
  enum status: [:pending, :completed]

  has_one :address_info, dependent: :destroy
  has_one :job_preference, dependent: :destroy

  [:educations, :families, :languages, :skills, :certificates, :character_preferences].each do |resource|
    has_many resource
  end

  accepts_nested_attributes_for :address_info, :job_preference

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :middlename, presence: true
  validates :nickname, presence: true
  validates :birthdate, presence: true
  validates :citizenship, presence: true
  validates :gender, presence: true
  validates :birthplace, presence: true
  validates :civil_status, presence: true


  dragonfly_accessor :avatar

  attr_accessor :accept_terms, :pending

  def self.job_lists
    Job.all
  end

  def fullname
    [firstname, middlename, lastname].compact.join(" ")
  end

  def set_status(pending_status)
    if pending_status.eql?('true')
      pending!
    else
      completed!
    end
  end

  RailsAdmin.config do |config|
    config.model 'Applicant' do
      list do
        scopes [:completed]
      end
    end
  end
end
