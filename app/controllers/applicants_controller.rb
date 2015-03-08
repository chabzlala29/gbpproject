class ApplicantsController < ApplicationController
  def index
  end

  def edit
    @applicant = Applicant.find(params[:id])

    if @applicant.address_info.nil?
      @applicant.build_address_info
    end
  end

  def update
    @applicant = Applicant.find(params[:id])

    filtered_params = set_date_params

    if @applicant.update!(filtered_params) 
      redirect_to edit_applicant_path(@applicant)
    end
  end

  private

  def applicant_params
    params.require(:applicant).permit(:firstname, :middlename, :lastname, :nickname, :birthdate, :citizenship, :gender,
                                     :height, :religion, :sss_number, :birthplace, :civil_status, :weight, :tin, :philhealth,
                                     :availability_status, :work_experience, :avatar, address_info_attributes: [:street, :village, :city,
                                      :country, :phone_home, :mobile, :phone_office, :fax])
  end
  
  def set_date_params
    applicant_params[:birthdate] = Date.strptime(applicant_params[:birthdate], "%Y-%d-%m")
    applicant_params
  end

end
