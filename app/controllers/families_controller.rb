class FamiliesController < ApplicationController
  before_action :authenticate_applicant!

  def create
    @family = current_applicant.families.new(filtered_params) 
    @family.save
    @families = current_applicant.families
  end

  def edit
    @family = Family.find(params[:id])
  end

  def update
    @family = Family.find(params[:id])
    @family.update(filtered_params)
    @families = current_applicant.families
  end

  def destroy
    @family = Family.find(params[:id])
    @family.destroy
    @families = current_applicant.families
  end
  protected

  def families_params
    params.require(:family).permit(:firstname, :middlename, :lastname,
                                     :relationship, :address, :company, :dob, :position)
  end

  def filtered_params # this filters the params to not include empty fields
    families_params.select{|k,v| !v.blank?}
  end
end
