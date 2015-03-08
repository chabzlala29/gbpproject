class WelcomeController < ApplicationController
  def index
    authenticate_applicant!
  end
end
