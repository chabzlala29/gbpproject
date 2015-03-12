class SkillsController < ApplicationController
  before_action :authenticate_applicant!

  def create
    @skill = current_applicant.skills.new(filtered_params) 
    @skill.save
    @skills = current_applicant.skills
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    @skill.update(filtered_params)
    @skills = current_applicant.skills
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    @skills = current_applicant.skills
  end

  protected

  def skills_params
    params.require(:skill).permit(:skill, :years_of_experience, :proficiency)
  end

  def filtered_params # this filters the params to not include empty fields
    skills_params.select{|k,v| !v.blank?}
  end
end
