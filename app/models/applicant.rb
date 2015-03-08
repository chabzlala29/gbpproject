class Applicant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  CITIZENSHIP_LISTS = ['Filipino', 'Korean', 'American']

  enum civil_status: [:single, :married, :widow, :divorced]
  enum gender: [:male, :female]

  has_one :address_info

  accepts_nested_attributes_for :address_info

  dragonfly_accessor :avatar
end
