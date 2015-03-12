module ApplicationHelper
  def civil_statuses
    Applicant.civil_statuses.keys.map{|v| [v.titleize, v]}
  end

  def genders
    Applicant.genders.keys.map{|v| [v.titleize, v]}
  end

  def make_options(object)
    object.map{|k,v| [k.titleize, k]}
  end

  def set_level(level)
    Language.levels.select{|k,v| v == level.to_i }.first.first.titleize
  end

  def year_choices
    ((Date.today - 30.years).year..Date.today.year).to_a
  end
end
