class Family < ActiveRecord::Base
  belongs_to :applicant

  enum relationship: [:mother, :father, :brother, :sister]

  validates :firstname, presence: true
  validates :middlename, presence: true
  validates :lastname, presence: true
  validates :relationship, presence: true
  validates :address, presence: true
  

  def fullname
    [firstname, middlename, lastname].compact.join(" ")
  end
end
