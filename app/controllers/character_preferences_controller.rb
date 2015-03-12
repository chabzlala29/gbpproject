class CharacterPreferencesController < ApplicationController
  before_action :authenticate_applicant!

  def create
    @character_preference = current_applicant.character_preferences.new(filtered_params) 
    @character_preference.save
    @character_preferences = current_applicant.character_preferences
  end

  def edit
    @character_preference = CharacterPreference.find(params[:id])
  end

  def update
    @character_preference = CharacterPreference.find(params[:id])
    @character_preference.update(filtered_params)
    @character_preferences = current_applicant.character_preferences
  end

  def destroy
    @character_preference = CharacterPreference.find(params[:id])
    @character_preference.destroy
    @character_preferences = current_applicant.character_preferences
  end

  protected

  def character_preferences_params
    params.require(:character_preference).permit(:firstname, :middlename, :lastname, :number_of_years,
                                                 :address, :contact, :company, :position)
  end

  def filtered_params # this filters the params to not include empty fields
    character_preferences_params.select{|k,v| !v.blank?}
  end
end
