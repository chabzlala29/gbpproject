class CharacterPreference < ActiveRecord::Base
  belongs_to :applicant

  def fullname
    [firstname, middlename, lastname].compact.join(" ")
  end
end
