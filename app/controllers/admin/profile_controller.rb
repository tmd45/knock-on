class Admin::ProfileController < Admin::ApplicationController
  before_action :authenticate
  before_action :current_member

  # GET /admin/profile
  def edit
    @title = 'プロフィール編集'
  end
end
