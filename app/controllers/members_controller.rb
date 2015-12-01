class MembersController < ApplicationController

  # GET /members
  #
  def index
    @members = Member.search(group_name: params[:group_name])
    flash.now[:group_name] = params[:group_name]
  end
end
