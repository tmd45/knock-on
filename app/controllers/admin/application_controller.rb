require 'application_controller'

class Admin::ApplicationController < ApplicationController
  layout 'admin'

  before_action :title

  private

  def title
    @title = '管理ページ'
  end

  def current_member
    member_id = session[:member_id]
    @member = Member.find(member_id)
  end
end
