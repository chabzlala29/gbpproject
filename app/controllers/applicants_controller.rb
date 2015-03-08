class ApplicantsController < ApplicationController
  before_action :authenticate_applicant!

  def index
  end

  def edit
    @applicant = Applicant.find(params[:id])
    @questions = Question.all

    if @applicant.address_info.nil?
      @applicant.build_address_info
    end

    @questions.each do |q|
      if @applicant.answers.where(question: q).empty?
        @applicant.answers.new(question: q)
      end
    end

    if @applicant.job_preference.nil?
      @applicant.build_job_preference
    end
  end

  def update
    @applicant = Applicant.find(params[:id])

    if applicant_params[:accept_terms] == "1"
      filtered_params = set_params

      if @applicant.update(filtered_params) 
        redirect_to edit_applicant_path(@applicant), flash: { prompt: 'Process completed. Just wait.' }
      end
     else
       redirect_to edit_applicant_path(@applicant), flash: { error: 'You must accept terms and conditions' }
     end
  end

  private

  def applicant_params
    params.require(:applicant).permit(:accept_terms, :firstname, :middlename, :lastname, :nickname, :birthdate, :citizenship, :gender,
                                      :height, :religion, :sss_number, :birthplace, :civil_status, :weight, :tin, :philhealth,
                                      :availability_status, :work_experience, :avatar, address_info_attributes: [:street, :village, :city,
                                                                                                                 :country, :phone_home, :mobile, :phone_office, :fax],
                                                                                                                 answers_attributes: [:id, :question_id, :answer],
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
end

