require 'application_controller'

class AdminController < ApplicationController
  before_action :authenticate

  # GET /admin
  #
  def index
    # TODO いずれ分岐に
    redirect_to admin_profile_path
  end
end
