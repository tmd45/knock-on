class MembersController < ApplicationController

  # GET /members
  #
  def index
    group_names = params[:group_names].try(:split, ',') || []
    @members = Member.search(group_names: group_names)

    if (group_names & Settings.group.need_general_mention).present?
      flash.now[:need_general_mention] = true
    end
  end
end
