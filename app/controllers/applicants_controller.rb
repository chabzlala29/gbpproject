class ApplicantsController < ApplicationController
  before_action :authenticate_applicant!
  skip_before_action :verify_authenticity_token

  def show
    @applicant = current_applicant
  end

  def edit
    load_nested_resources

    if @applicant.address_info.nil?
      @applicant.build_address_info
    end

    if @applicant.job_preference.nil?
      @applicant.build_job_preference
    end
  end

  def update
    @applicant = current_applicant
    @accepted_terms = applicant_params[:accept_terms].eql?("1")

    if @accepted_terms
      filtered_params = set_params

      @applicant.assign_attributes(filtered_params)

      @valid = @applicant.valid?

      @error_str = set_errors(@applicant) unless @valid


      @applicant.save if @valid
    end

  end

  private

  def load_nested_resources
    @applicant = current_applicant
    @educations = current_applicant.educations
    @families = current_applicant.families
    @languages = current_applicant.languages
    @skills = current_applicant.skills
    @certificates = current_applicant.certificates
    @character_preferences = current_applicant.character_preferences
  end

  def applicant_params
    params.require(:applicant).permit(:accept_terms, :firstname, :middlename, :lastname, :nickname, :birthdate, :citizenship, :gender,
                                      :height, :religion, :sss_number, :birthplace, :civil_status, :weight, :tin, :philhealth,
                                      :availability_status, :work_experience, :avatar, address_info_attributes: [:street, :village, :city,
                                                                                                                 :country, :phone_home, :mobile, :phone_office, :fax],
                                                                                                                 job_preference_attributes: [:first_pref, :second_pref,
                                                                                                                                             :third_pref, :source, :firstname, :lastname, :source_sub]
                                     )
  end
  
  def set_params
    hash = applicant_params

    unless hash[:birthdate].blank?
      hash[:birthdate] = Date.strptime(applicant_params[:birthdate], "%Y-%d-%m")
    end

    source_sub = applicant_params[:job_preference_attributes][:source_sub]

    unless source_sub.blank?
      hash[:job_preference_attributes][:source] = source_sub
    end

    hash
  end

  def set_errors(applicant)
    applicant.errors.messages.map{|k,v| k.to_s.titleize + ' ' + v.first.to_s }.join(', ')
  end
end

