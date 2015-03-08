class ApplicantsController < ApplicationController
  def index
  end

  def new
    @applicant = Applicant.new
  end
end
