module ApplicationHelper
  def civil_statuses
    Applicant.civil_statuses.keys.map{|v| [v.titleize, v]}
  end

  def genders
    Applicant.genders.keys.map{|v| [v.titleize, v]}
  end
end
