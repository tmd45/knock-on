require 'application_controller'

class AdminController < ApplicationController
  before_action :authenticate
  before_action :current_member

  # GET /admin
  #
  def index
    if @member.is_administrator?
      redirect_to admin_profile_path, notice: 'is administrator'
    else
      redirect_to admin_profile_path
    end
  end
end
