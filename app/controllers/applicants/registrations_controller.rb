class Applicants::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    resource_saved = resource.save!
    if !resource_saved
      clean_up_passwords resource
      @validatable = devise_mapping.validatable?
      if @validatable
        @minimum_password_length = resource_class.password_length.min
      end

    end

    redirect_to edit_applicant_path(resource)
  end
end
