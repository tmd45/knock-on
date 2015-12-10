require 'application_controller'

class AdminController < ApplicationController
  before_action :authenticate
  before_action :current_member

  # GET /admin
  #
  def index
    if @current_member.administrator?
      redirect_to admin_members_path
    else
      redirect_to admin_profile_path
    end
  end
end
