class Admin::ProfileController < Admin::ApplicationController
  before_action :authenticate

  # GET /admin/profile
  def edit
    @title = 'プロフィール編集'
  end
end
