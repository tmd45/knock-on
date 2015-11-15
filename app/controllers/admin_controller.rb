require 'application_controller'

class AdminController < ApplicationController
  before_action :authenticate

  def index
    redirect_to admin_profile_path
  end
end
