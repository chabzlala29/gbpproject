class LanguagesController < ApplicationController
  before_action :authenticate_applicant!

  def create
    @language = current_applicant.languages.new(filtered_params) 
    @language.save
    @languages = current_applicant.languages
  end

  def edit
    @language = Language.find(params[:id])
  end

  def update
    @language = Language.find(params[:id])
    @language.update(filtered_params)
    @languages = current_applicant.languages
  end

  def destroy
    @language = Language.find(params[:id])
    @language.destroy
    @languages = current_applicant.languages
  end
  protected

  def languages_params
    params.require(:language).permit(:language, :spoken, :written)
  end

  def filtered_params # this filters the params to not include empty fields
    languages_params.select{|k,v| !v.blank?}
  end
end
