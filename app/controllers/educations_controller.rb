class EducationsController < ApplicationController
  before_action :authenticate_applicant!

  def create
    @education = current_applicant.educations.new(filtered_params) 
    @education.save
    @educations = current_applicant.educations
  end

  def edit
    @education = Education.find(params[:id])
  end

  def update
    @education = Education.find(params[:id])
    @education.update(filtered_params)
    @educations = current_applicant.educations
  end

  def destroy
    @education = Education.find(params[:id])
    @education.destroy
    @educations = current_applicant.educations
  end


  protected

  def education_params
    params.require(:education).permit(:level, :institution, :field,
                                     :grade, :awards, :location, :major, :graduation_year)
  end

  def filtered_params # this filters the params to not include empty fields
    education_params.select{|k,v| !v.blank?}
  end
end
