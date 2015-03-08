class Applicant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  CITIZENSHIP_LISTS = ['Filipino', 'Korean', 'American']

  enum civil_status: [:single, :married, :widow, :divorced]
  enum gender: [:male, :female]

  has_one :address_info
  has_many :answers
  has_one :job_preference

  accepts_nested_attributes_for :address_info, :answers, :job_preference

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :middlename, presence: true

  dragonfly_accessor :avatar

  attr_accessor :accept_terms
end
