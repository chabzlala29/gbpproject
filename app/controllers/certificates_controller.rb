class CertificatesController < ApplicationController
  before_action :authenticate_applicant!

  def create
    @certificate = current_applicant.certificates.new(filtered_params) 
    @certificate.save
    @certificates = current_applicant.certificates

    redirect_to edit_profile_path
  end

  def edit
    @certificate = Certificate.find(params[:id])
  end

  def update
    @certificate = Certificate.find(params[:id])
    @certificate.update(filtered_params)
    @certificates = current_applicant.certificates
  end

  def destroy
    @certificate = Certificate.find(params[:id])
    @certificate.destroy
    @certificates = current_applicant.certificates

    redirect_to edit_profile_path
  end

  protected

  def certificates_params
    params.require(:certificate).permit(:file)
  end

  def filtered_params # this filters the params to not include empty fields
    certificates_params.select{|k,v| !v.blank?}
  end
end
