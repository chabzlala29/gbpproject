class Family < ActiveRecord::Base
  belongs_to :applicant

  enum relationship: [:mother, :father, :brother, :sister]

  def fullname
    [firstname, middlename, lastname].compact.join(" ")
  end
end
